# Authorization API Contract

The Flutter application treats scouting positions and technical authorization as separate concepts.

- **Position:** Human-readable scouting responsibility, such as `storekeeper`, `rover_leader`, or `medic`.
- **Role:** Spatie role used to group permissions.
- **Permission:** Stable API capability string used by the Flutter UI and Laravel policies.
- **Assignment:** A position held by the user inside a specific organizational unit.

## Authentication response

```json
{
  "token": "sanctum-token",
  "token_type": "Bearer",
  "user": {
    "id": 1,
    "name": "Demo Scout",
    "email": "demo@example.com",
    "roles": ["inventory-manager", "rover-leader"],
    "permissions": [
      "dashboard.view",
      "inventory.view",
      "inventory.manage",
      "tasks.view"
    ],
    "assignments": [
      {
        "id": 1,
        "organization_id": 1,
        "unit_id": 10,
        "unit_name": "Baalbek Troop",
        "position_code": "storekeeper",
        "position_name": "Storekeeper",
        "roles": ["inventory-manager"],
        "is_primary": true
      }
    ]
  }
}
```

## Laravel resource example

```php
return [
    'id' => $user->getKey(),
    'name' => $user->name,
    'email' => $user->email,
    'roles' => $user->getRoleNames()->values(),
    'permissions' => $user->getAllPermissions()
        ->pluck('name')
        ->values(),
    'assignments' => ScoutAssignmentResource::collection(
        $user->assignments()
            ->with(['position', 'organizationalUnit'])
            ->active()
            ->get(),
    ),
];
```

## Rules

1. Flutter checks permissions, not position names, before showing management actions.
2. Laravel policies and middleware remain the authority. Hiding a Flutter button is not security.
3. Permission names are stable dot-separated strings, for example `inventory.manage`.
4. A user may have multiple roles and multiple scoped scouting assignments.
5. Assignments identify organizational responsibility; Spatie roles identify technical access.
6. The backend should return the effective permission list after resolving direct and role permissions.
