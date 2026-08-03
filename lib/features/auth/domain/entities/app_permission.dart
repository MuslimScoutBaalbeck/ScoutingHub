enum AppPermission {
  dashboardView('dashboard.view'),
  tasksView('tasks.view'),
  tasksCreate('tasks.create'),
  tasksUpdate('tasks.update'),
  tasksAssign('tasks.assign'),
  eventsView('events.view'),
  eventsManage('events.manage'),
  teamsView('teams.view'),
  teamsManage('teams.manage'),
  membersView('members.view'),
  membersManage('members.manage'),
  inventoryView('inventory.view'),
  inventoryManage('inventory.manage'),
  financeView('finance.view'),
  financeManage('finance.manage'),
  correspondenceView('correspondence.view'),
  correspondenceManage('correspondence.manage'),
  meetingsView('meetings.view'),
  meetingsManage('meetings.manage'),
  campsView('camps.view'),
  campsManage('camps.manage'),
  chantsView('chants.view'),
  chantsManage('chants.manage'),
  usersAssignRoles('users.assign_roles');

  const AppPermission(this.value);

  final String value;

  static AppPermission? fromValue(String value) {
    for (final permission in values) {
      if (permission.value == value) {
        return permission;
      }
    }

    return null;
  }
}
