import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/people/application/members_list/members_list_cubit.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';

@RoutePage()
class MembersListPage extends StatefulWidget implements AutoRouteWrapper {
  const MembersListPage({super.key});

  @override
  State<MembersListPage> createState() => _MembersListPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MembersListCubit>()..load(),
      child: this,
    );
  }
}

class _MembersListPageState extends State<MembersListPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;
    final primary = Theme.of(context).colorScheme;

    return BlocBuilder<MembersListCubit, MembersListState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(strings.members_list),
                Text(
                  strings.subtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize:const Size.fromHeight(40),
              child:  Container(
                color: primary.primary.withAlpha(25),
                padding:  const EdgeInsets.symmetric(vertical:10,horizontal: 10),
                child: Row(
                  crossAxisAlignment: .start,
                  children: [
                    AppText.body(
                      strings.members_count(count: state.visibleCount),
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              )
            ),
            actions: [
              IconButton(
                tooltip: strings.search,
                onPressed: () => _openSearch(context),
                icon: const Icon(Icons.search_rounded),
              ),
              GestureDetector(
                onLongPress: context.read<MembersListCubit>().clearFilters,
                child: Badge(
                  isLabelVisible: state.hasActiveFilters,
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
            key: ValueKey('${state.stage}-${state.status}'),
            initialStage: state.stage,
            initialStatus: state.status,
            onApply: (stage, status) {
              context.read<MembersListCubit>().applyFilters(
                stage: stage,
                status: status,
              );
              Navigator.of(context).pop();
            },
            onClear: () {
              context.read<MembersListCubit>().clearFilters();
              Navigator.of(context).pop();
            },
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: strings.add,
            onPressed: () async {
              final saved = await context.router.push<bool>(
                const MemberCreateWizardRoute(),
              );
              if (saved == true && context.mounted) {
                await context.read<MembersListCubit>().load();
              }
            },
            child: const Icon(Icons.person_add_alt_1_rounded),
          ),
          body: Expanded(child: _MembersListBody(state: state)),
        );
      },
    );
  }

  Future<void> _openSearch(BuildContext context) async {
    final cubit = context.read<MembersListCubit>();
    final member = await showSearch<Person?>(
      context: context,
      delegate: _MemberSearchDelegate(cubit.search),
    );

    if (member != null && context.mounted) {
      final updated = await context.router.push<bool>(
        MemberDetailsRoute(person: member),
      );
      if (updated == true && context.mounted) await cubit.load();
    }
  }
}

class _MembersListBody extends StatelessWidget {
  const _MembersListBody({required this.state});
  final MembersListState state;

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;

    if (state.isLoading && state.members.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null && state.members.isEmpty) {
      return Center(
        child: AppButton.filled(
          label: strings.retry,
          onPressed: context.read<MembersListCubit>().load,
        ),
      );
    }
    if (state.visibleMembers.isEmpty) {
      return Center(child: AppText.paragraph(strings.empty));
    }

    return RefreshIndicator(
      onRefresh: context.read<MembersListCubit>().load,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xs,
          AppSpacing.xs,
          AppSpacing.xs,
          AppSpacing.xl,
        ),
        itemCount: state.visibleMembers.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.xxs),
        itemBuilder: (context, index) {
          final member = state.visibleMembers[index];
          return Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs,
              ),
              leading: CircleAvatar(
                child: Text(member.fullName.characters.first),
              ),
              title: AppText.body(member.fullName, fontWeight: FontWeight.w700),
              subtitle: AppText.caption(
                '${member.unit} · ${strings.membership_number}: ${member.membershipNumber}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(
                Directionality.of(context) == TextDirection.rtl
                    ? Icons.chevron_left_rounded
                    : Icons.chevron_right_rounded,
              ),
              onTap: () async {
                final updated = await context.router.push<bool>(
                  MemberDetailsRoute(person: member),
                );
                if (updated == true && context.mounted) {
                  await context.read<MembersListCubit>().load();
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class _MemberSearchDelegate extends SearchDelegate<Person?> {
  _MemberSearchDelegate(this.searchMembers);
  final List<Person> Function(String query) searchMembers;

  @override
  String get searchFieldLabel => 'Search';

  @override
  List<Widget>? buildActions(BuildContext context) => [
    if (query.isNotEmpty)
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear_rounded),
      ),
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
  Widget buildResults(BuildContext context) => _results();

  @override
  Widget buildSuggestions(BuildContext context) => _results();

  Widget _results() {
    final results = searchMembers(query);
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final member = results[index];
        return ListTile(
          leading: const Icon(Icons.person_outline_rounded),
          title: Text(member.fullName),
          subtitle: Text('${member.membershipNumber} · ${member.phone}'),
          onTap: () => close(context, member),
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
    super.key,
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
                  DropdownMenuItem(
                    value: null,
                    child: Text(strings.all_stages),
                  ),
                  ...ScoutStage.values.map(
                    (value) =>
                        DropdownMenuItem(value: value, child: Text(value.name)),
                  ),
                ],
                onChanged: (value) => setState(() => _stage = value),
              ),
              AppGap.verticalMd,
              DropdownButtonFormField<PersonStatus?>(
                initialValue: _status,
                decoration: InputDecoration(labelText: strings.status),
                items: [
                  DropdownMenuItem(
                    value: null,
                    child: Text(strings.all_statuses),
                  ),
                  ...PersonStatus.values.map(
                    (value) =>
                        DropdownMenuItem(value: value, child: Text(value.name)),
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
