enum AppSetupMode {
  notSelected,
  offline,
  cloud,
  localServer;

  bool get isSelected => this != AppSetupMode.notSelected;
}