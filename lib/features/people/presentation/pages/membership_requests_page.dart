import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/people/application/membership_requests/membership_requests_cubit.dart';
import 'package:scouting_hub/features/people/domain/entities/membership_request.dart';

@RoutePage()
class MembershipRequestsPage extends StatelessWidget
    implements AutoRouteWrapper {
  const MembershipRequestsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<MembershipRequestsCubit>();
        unawaited(cubit.load());
        return cubit;
      },
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;

    return BlocBuilder<MembershipRequestsCubit, MembershipRequestsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(strings.membership_requests),
                Text(
                  strings.request_subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            actions: [
              IconButton(
                tooltip: strings.search,
                onPressed: () => _openSearch(context),
                icon: const Icon(Icons.search_rounded),
              ),
              PopupMenuButton<MembershipRequestStatus?>(
                tooltip: strings.filter,
                initialValue: state.statusFilter,
                onSelected: context.read<MembershipRequestsCubit>().filterBy,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: null,
                    child: Text(strings.request_all),
                  ),
                  for (final status in MembershipRequestStatus.values)
                    PopupMenuItem(
                      value: status,
                      child: Text(_statusLabel(context, status)),
                    ),
                ],
                icon: Badge(
                  isLabelVisible: state.statusFilter != null,
                  child: const Icon(Icons.filter_list_rounded),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: strings.new_request,
            onPressed: () => _showCreateSheet(context),
            child: const Icon(Icons.person_add_alt_1_rounded),
          ),
          body: _RequestListBody(state: state),
        );
      },
    );
  }

  Future<void> _openSearch(BuildContext context) async {
    final cubit = context.read<MembershipRequestsCubit>();
    final request = await showSearch<MembershipRequest?>(
      context: context,
      delegate: _RequestSearchDelegate(cubit.search),
    );

    if (request != null && context.mounted) {
      await _showDetailsSheet(context, request);
    }
  }
}

class _RequestListBody extends StatelessWidget {
  const _RequestListBody({required this.state});

  final MembershipRequestsState state;

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;

    if (state.isLoading && state.requests.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null && state.requests.isEmpty) {
      return Center(
        child: AppButton.filled(
          label: strings.retry,
          onPressed: context.read<MembershipRequestsCubit>().load,
        ),
      );
    }

    if (state.visibleRequests.isEmpty) {
      return Center(child: AppText.paragraph(strings.request_empty));
    }

    return RefreshIndicator(
      onRefresh: context.read<MembershipRequestsCubit>().load,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.sm,
          AppSpacing.sm,
          AppSpacing.sm,
          112 + MediaQuery.paddingOf(context).bottom,
        ),
        itemCount: state.visibleRequests.length,
        separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.xs),
        itemBuilder: (context, index) {
          final request = state.visibleRequests[index];
          return Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              leading: CircleAvatar(
                child: Text(request.fullName.characters.first),
              ),
              title: AppText.body(
                request.fullName,
                fontWeight: FontWeight.w700,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.caption('${request.id} · ${request.phone}'),
                  AppGap.verticalXxs,
                  _StatusChip(status: request.status),
                ],
              ),
              trailing: const AppDirectionalChevron(),
              onTap: () => _showDetailsSheet(context, request),
            ),
          );
        },
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final MembershipRequestStatus status;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xxs,
        ),
        decoration: BoxDecoration(
          color: colors.primaryContainer,
          borderRadius: AppRadius.large,
        ),
        child: AppText.caption(
          _statusLabel(context, status),
          color: colors.onPrimaryContainer,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

Future<void> _showDetailsSheet(
    BuildContext context,
    MembershipRequest request,
    ) async {
  final strings = context.t.people;
  final cubit = context.read<MembershipRequestsCubit>();

  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (sheetContext) => BlocProvider.value(
      value: cubit,
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: .9,
        minChildSize: .6,
        maxChildSize: .95,
        builder: (context, controller) => ListView(
          controller: controller,
          padding: AppSpacing.pageWithBottom,
          children: [
            AppText.heading(
              strings.request_details,
              fontWeight: FontWeight.w800,
            ),
            AppGap.verticalLg,
            _DetailRow(label: strings.request_id, value: request.id),
            _DetailRow(label: strings.full_name, value: request.fullName),
            _DetailRow(label: strings.phone, value: request.phone),
            _DetailRow(label: strings.email, value: request.email),
            _DetailRow(label: strings.address, value: request.address),
            _DetailRow(label: strings.stage, value: request.stage),
            _DetailRow(
              label: strings.status,
              value: _statusLabel(context, request.status),
            ),
            _DetailRow(
              label: strings.submitted_at,
              value: request.submittedAt.toLocal().toString().split('.').first,
            ),
            if (request.notes.isNotEmpty)
              _DetailRow(label: strings.notes, value: request.notes),
            AppGap.verticalLg,
            if (request.status == MembershipRequestStatus.submitted)
              AppButton.filled(
                label: strings.start_review,
                onPressed: () => _changeStatus(
                  context,
                  request,
                  MembershipRequestStatus.underReview,
                ),
              ),
            if (request.status == MembershipRequestStatus.underReview ||
                request.status ==
                    MembershipRequestStatus.needsInformation) ...[
              AppButton.outline(
                label: strings.request_information,
                onPressed: () => _changeStatus(
                  context,
                  request,
                  MembershipRequestStatus.needsInformation,
                ),
              ),
              AppGap.verticalSm,
              AppButton.filled(
                label: strings.approve,
                onPressed: () => _changeStatus(
                  context,
                  request,
                  MembershipRequestStatus.approved,
                ),
              ),
              AppGap.verticalSm,
              TextButton(
                onPressed: () => _changeStatus(
                  context,
                  request,
                  MembershipRequestStatus.rejected,
                ),
                child: Text(strings.reject),
              ),
            ],
          ],
        ),
      ),
    ),
  );
}

Future<void> _changeStatus(
    BuildContext sheetContext,
    MembershipRequest request,
    MembershipRequestStatus status,
    ) async {
  final cubit = sheetContext.read<MembershipRequestsCubit>();
  final messenger = ScaffoldMessenger.of(sheetContext);
  final updatedMessage = sheetContext.t.people.request_updated;
  final saved = await cubit.updateStatus(request, status);

  if (!sheetContext.mounted || !saved) {
    return;
  }

  Navigator.of(sheetContext).pop();
  messenger.showSnackBar(SnackBar(content: Text(updatedMessage)));
}

Future<void> _showCreateSheet(BuildContext context) async {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final stage = TextEditingController();
  final notes = TextEditingController();
  final strings = context.t.people;
  final cubit = context.read<MembershipRequestsCubit>();

  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (sheetContext) => BlocProvider.value(
      value: cubit,
      child: Builder(
        builder: (providerContext) => Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.sm,
            AppSpacing.md,
            MediaQuery.viewInsetsOf(providerContext).bottom + AppSpacing.md,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppText.heading(
                    strings.new_request,
                    fontWeight: FontWeight.w800,
                  ),
                  AppGap.verticalLg,
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(labelText: strings.full_name),
                    validator: _required,
                  ),
                  AppGap.verticalSm,
                  TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: strings.phone),
                    validator: _required,
                  ),
                  AppGap.verticalSm,
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: strings.email),
                  ),
                  AppGap.verticalSm,
                  TextFormField(
                    controller: address,
                    decoration: InputDecoration(labelText: strings.address),
                  ),
                  AppGap.verticalSm,
                  TextFormField(
                    controller: stage,
                    decoration: InputDecoration(labelText: strings.stage),
                    validator: _required,
                  ),
                  AppGap.verticalSm,
                  TextFormField(
                    controller: notes,
                    maxLines: 3,
                    decoration: InputDecoration(labelText: strings.notes),
                  ),
                  AppGap.verticalLg,
                  AppButton.filled(
                    label: strings.create_request,
                    onPressed: () async {
                      if (!(formKey.currentState?.validate() ?? false)) {
                        return;
                      }

                      final messenger = ScaffoldMessenger.of(providerContext);
                      final savedMessage = strings.request_saved;
                      final saved = await providerContext
                          .read<MembershipRequestsCubit>()
                          .create(
                        fullName: name.text,
                        phone: phone.text,
                        email: email.text,
                        address: address.text,
                        stage: stage.text,
                        notes: notes.text,
                      );

                      if (!providerContext.mounted || !saved) {
                        return;
                      }

                      Navigator.of(providerContext).pop();
                      messenger.showSnackBar(
                        SnackBar(content: Text(savedMessage)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );

  for (final controller in [name, phone, email, address, stage, notes]) {
    controller.dispose();
  }
}

String? _required(String? value) {
  return value == null || value.trim().isEmpty ? 'Required' : null;
}

String _statusLabel(
    BuildContext context,
    MembershipRequestStatus status,
    ) {
  final strings = context.t.people;
  return switch (status) {
    MembershipRequestStatus.submitted => strings.request_new,
    MembershipRequestStatus.underReview => strings.request_review,
    MembershipRequestStatus.needsInformation => strings.request_needs_info,
    MembershipRequestStatus.approved => strings.request_approved,
    MembershipRequestStatus.rejected => strings.request_rejected,
  };
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: AppText.caption(label)),
          Expanded(
            flex: 2,
            child: AppText.body(value.isEmpty ? '—' : value),
          ),
        ],
      ),
    );
  }
}

class _RequestSearchDelegate extends SearchDelegate<MembershipRequest?> {
  _RequestSearchDelegate(this.searchRequests);

  final List<MembershipRequest> Function(String query) searchRequests;

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
    final results = searchRequests(query);
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final request = results[index];
        return ListTile(
          title: Text(request.fullName),
          subtitle: Text('${request.id} · ${request.phone}'),
          trailing: const AppDirectionalChevron(),
          onTap: () => close(context, request),
        );
      },
    );
  }
}
