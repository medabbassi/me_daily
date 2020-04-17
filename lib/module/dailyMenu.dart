class DailyMenu {
  int id;
  String name;

  DailyMenu(this.id, this.name);

  static List<DailyMenu> getMenu() {
    return <DailyMenu>[
      DailyMenu(1, 'Does not repeat'),
      DailyMenu(2, 'Daily'),
      DailyMenu(3, 'Weekly '),
      DailyMenu(4, 'Monthly'),
      DailyMenu(5, 'Annually'),
      DailyMenu(6, 'Every weekend'),
      DailyMenu(7, 'Every weekday'),
    ];
  }
}
