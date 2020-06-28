class Activity {

  int _id;
  String _title;
  String _description;
  String _date;
  String _repeat;

  Activity(this._title, this._date, this._repeat, [this._description]);

  Activity.withId(this._id, this._title, this._date, this._repeat,
      [this._description]);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  String get date => _date;

  String get repeat => _repeat;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set date(String newDate) {
    if (newDate.length <= 255) {
      this._date = newDate;
    }
  }

  set repeat(String newValue) {
    if (newValue.length <= 255) {
      this._repeat = newValue;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['repeat'] = _repeat;

    return map;
  }

  // Extract a Note object from a Map object
  Activity.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._date = map['date'];
    this._repeat = map['repeat'];
  }
}









