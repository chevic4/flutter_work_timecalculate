enum RouteNames {
  listMainScreen('/'),
  enterDataScreen('/enterdata'),
  editDataScreen('/editdata'),
  settingScreen('/settings');

  final String path;
  const RouteNames(this.path);
}
