class Activity {
  int _id;
  int _nbRepeats;
  String _title;
  String _description;
  String _dateday;
  String _time;

  Activity.withId(this._id, this._nbRepeats, this._title, this._description,
      this._dateday, this._time);

  Activity(this._nbRepeats, this._title, this._description, this._dateday,
      this._time);

  int get id => _id;

  int get nbRepeats => _nbRepeats;

  String get title => _title;

  String get description => _description;

  String get dateDay => _dateday;

  String get time => _time;

  set nbRepeats(int newRepeats) {
    this._nbRepeats = newRepeats;
  }

  set title(String newTitle) {
    if (newTitle.length <= 30) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 30) {
      this._description = newDescription;
    }
  }

  set dateDay(String newDateDay) {
    if (newDateDay.length <= 30) {
      this._dateday = newDateDay;
    }
  }

  set time(String newTime) {
    if (newTime.length <= 30) {
      this._time = newTime;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['nbRepeats'] = _nbRepeats;
    map['title'] = _title;
    map['description'] = _description;
    map['dateday'] = _dateday;
    map['time'] = _time;

    return map;
  }

  Activity.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nbRepeats = map['nbRepeats'];
    this._title = map['title'];
    this._description = map['description'];
    this._dateday = map['dateday'];
    this._time = map['time'];
  }
}
