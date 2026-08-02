# UI architecture

The shared UI layer follows Atomic Design.

```text
core/
├── theme/
│   └── tokens/
│       ├── app_colors.dart
│       ├── app_duration.dart
│       ├── app_radius.dart
│       ├── app_size.dart
│       ├── app_spacing.dart
│       ├── app_typography.dart
│       └── tokens.dart
└── ui/
    └── widgets/
        ├── atoms/
        ├── molecules/
        ├── organisms/
        ├── templates/
        └── widgets.dart
```

## Rules

### Tokens
Primitive design decisions only. Tokens must never import feature code or widgets.

### Atoms
Small indivisible controls such as `AppText`, `AppButton`, `AppGap`, `AppBackButton`, and `AppSquareAction`.

### Molecules
Small combinations of atoms such as a section heading, labeled field, or settings tile.

### Organisms
Larger reusable UI groups such as a page header, task card, event card, or quick-access grid.

### Templates
Page layout and composition only. Templates own scaffold structure, safe areas, width constraints, page padding, and shared backgrounds.

### Features
Feature folders own pages and business state. A feature page composes shared templates and organisms. It must not redefine global colors, spacing, radii, typography, or shared buttons.

## Usage

```dart
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';

AppPageTemplate(
  title: 'Tasks',
  body: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const AppText.heading('Tasks'),
      AppGap.verticalMd,
      AppButton.action(
        label: 'Create task',
        onPressed: createTask,
      ),
    ],
  ),
);
```

Do not use raw numeric spacing, colors, or border radii in feature pages when a token exists.