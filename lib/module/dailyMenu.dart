class DailyMenu {
  int id;
  String name;

  DailyMenu(this.id, this.name);

  static List<DailyMenu> getMenu() {
    return <DailyMenu>[
      DailyMenu(1, 'Toujours'),
      DailyMenu(2, 'Seul fois'),
    ];
  }
}
