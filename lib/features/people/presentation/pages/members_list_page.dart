import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/people/application/people/people_cubit.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';

@RoutePage()
class MembersListPage extends StatefulWidget implements AutoRouteWrapper {
  const MembersListPage({super.key});

  @override
  State<MembersListPage> createState() => _MembersListPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PeopleCubit>()..load(),
      child: this,
    );
  }
}

class _MembersListPageState extends State<MembersListPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ScoutStage? _stage;
  PersonStatus? _status;

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(strings.members_list),
            Text(strings.subtitle, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        actions: [
          IconButton(
            tooltip: strings.search,
            onPressed: _openSearch,
            icon: const Icon(Icons.search_rounded),
          ),
          GestureDetector(
            onLongPress: _clearFilters,
            child: Badge(
              isLabelVisible: _stage != null || _status != null,
              child: IconButton(
                tooltip: strings.filter,
                onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                icon: const Icon(Icons.filter_list_rounded),
              ),
            ),
          ),
        ],
      ),
      endDrawer: _MemberFilterDrawer(
        initialStage: _stage,
        initialStatus: _status,
        onApply: (stage, status) {
          setState(() {
            _stage = stage;
            _status = status;
          });
          Navigator.of(context).pop();
        },
        onClear: () {
          _clearFilters();
          Navigator.of(context).pop();
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: strings.add,
        onPressed: () => context.router.push(const MemberFormRoute()),
        child: const Icon(Icons.person_add_alt_1_rounded),
      ),
      bottomNavigationBar: BlocBuilder<PeopleCubit, PeopleState>(
        buildWhen: (previous, current) => previous.people != current.people,
        builder: (context, state) {
          final count = _applyFilters(state.people).length;
          return BottomAppBar(
            child: Center(
              child: AppText.body(
                strings.members_count(count: count),
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        },
      ),
      body: BlocBuilder<PeopleCubit, PeopleState>(
        builder: (context, state) {
          if (state.isLoading && state.people.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null && state.people.isEmpty) {
            return Center(
              child: AppButton.filled(
                label: strings.retry,
                onPressed: context.read<PeopleCubit>().load,
              ),
            );
          }

          final members = _applyFilters(state.people);
          if (members.isEmpty) {
            return Center(child: AppText.paragraph(strings.empty));
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.sm,
              AppSpacing.xs,
              AppSpacing.sm,
              96,
            ),
            itemCount: members.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.xxs),
            itemBuilder: (context, index) {
              final member = members[index];
              return _MemberListTile(
                member: member,
                onTap: () => context.router.push(
                  MemberDetailsRoute(person: member),
                ),
              );
            },
          );
        },
      ),
    );
  }

  List<Person> _applyFilters(List<Person> people) {
    return people.where((person) {
      return (_stage == null || person.stage == _stage) &&
          (_status == null || person.status == _status);
    }).toList(growable: false);
  }

  Future<void> _openSearch() async {
    final people = context.read<PeopleCubit>().state.people;
    final member = await showSearch<Person?>(
      context: context,
      delegate: _MemberSearchDelegate(people),
    );

    if (member != null && mounted) {
      await context.router.push(MemberDetailsRoute(person: member));
    }
  }

  void _clearFilters() {
    setState(() {
      _stage = null;
      _status = null;
    });
  }
}

class _MemberListTile extends StatelessWidget {
  const _MemberListTile({required this.member, required this.onTap});

  final Person member;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;
    final colors = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xxs,
        ),
        leading: CircleAvatar(
          backgroundColor: colors.primaryContainer,
          foregroundColor: colors.primary,
          child: Text(member.fullName.characters.first),
        ),
        title: AppText.body(member.fullName, fontWeight: FontWeight.w700),
        subtitle: AppText.caption(
          '${member.unit} · ${strings.membership_number}: ${member.membershipNumber}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: onTap,
      ),
    );
  }
}

class _MemberSearchDelegate extends SearchDelegate<Person?> {
  _MemberSearchDelegate(this.people);

  final List<Person> people;

  @override
  String get searchFieldLabel => 'Search';

  @override
  List<Widget>? buildActions(BuildContext context) => [
    if (query.isNotEmpty)
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear)),
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    onPressed: () => close(context, null),
    icon: Icon(
      Directionality.of(context) == TextDirection.rtl
          ? Icons.chevron_right_rounded
          : Icons.chevron_left_rounded,
    ),
  );

  @override
  Widget buildResults(BuildContext context) => _results(context);

  @override
  Widget buildSuggestions(BuildContext context) => _results(context);

  Widget _results(BuildContext context) {
    final normalized = query.trim().toLowerCase();
    final results = people.where((person) {
      return normalized.isEmpty ||
          person.fullName.toLowerCase().contains(normalized) ||
          person.membershipNumber.toLowerCase().contains(normalized) ||
          person.phone.contains(normalized);
    }).toList(growable: false);

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final person = results[index];
        return ListTile(
          leading: const Icon(Icons.person_outline_rounded),
          title: Text(person.fullName),
          subtitle: Text('${person.membershipNumber} · ${person.phone}'),
          onTap: () => close(context, person),
        );
      },
    );
  }
}

class _MemberFilterDrawer extends StatefulWidget {
  const _MemberFilterDrawer({
    required this.initialStage,
    required this.initialStatus,
    required this.onApply,
    required this.onClear,
  });

  final ScoutStage? initialStage;
  final PersonStatus? initialStatus;
  final void Function(ScoutStage?, PersonStatus?) onApply;
  final VoidCallback onClear;

  @override
  State<_MemberFilterDrawer> createState() => _MemberFilterDrawerState();
}

class _MemberFilterDrawerState extends State<_MemberFilterDrawer> {
  ScoutStage? _stage;
  PersonStatus? _status;

  @override
  void initState() {
    super.initState();
    _stage = widget.initialStage;
    _status = widget.initialStatus;
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: AppSpacing.page,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppText.heading(strings.filters, fontWeight: FontWeight.w800),
              AppGap.verticalLg,
              DropdownButtonFormField<ScoutStage?>(
                initialValue: _stage,
                decoration: InputDecoration(labelText: strings.stage),
                items: [
                  DropdownMenuItem(value: null, child: Text(strings.all_stages)),
                  ...ScoutStage.values.map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.name),
                    ),
                  ),
                ],
                onChanged: (value) => setState(() => _stage = value),
              ),
              AppGap.verticalMd,
              DropdownButtonFormField<PersonStatus?>(
                initialValue: _status,
                decoration: InputDecoration(labelText: strings.status),
                items: [
                  DropdownMenuItem(value: null, child: Text(strings.all_statuses)),
                  ...PersonStatus.values.map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.name),
                    ),
                  ),
                ],
                onChanged: (value) => setState(() => _status = value),
              ),
              const Spacer(),
              AppButton.outline(
                label: strings.clear_filters,
                onPressed: widget.onClear,
              ),
              AppGap.verticalSm,
              AppButton.filled(
                label: strings.apply_filters,
                onPressed: () => widget.onApply(_stage, _status),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
