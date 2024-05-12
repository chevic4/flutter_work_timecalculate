enum RouteNames {
  listMainScreen('/'),
  enterDataScreen('/enterdata'),
  editDataScreen('/editdata'),
  caclHtmlScreen('/calchtml'),
  settingScreen('/settings');

  final String path;
  const RouteNames(this.path);
}
