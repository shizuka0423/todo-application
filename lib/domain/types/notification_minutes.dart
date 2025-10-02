enum NotificationMinutes {
  none(null, "なし"),
  same(0, "予定の時刻"),
  fiveMinute(5, "5分前"),
  tenMinute(10, "10分前"),
  half(30, "30分前");

  const NotificationMinutes(this.minutes, this.text);
  final int? minutes;
  final String text;
}
