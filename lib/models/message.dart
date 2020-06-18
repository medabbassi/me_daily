class Message {
  int _id;
  String _recipient;
  String _description;
  String _dateday;
  String _time;

  Message.withId(
      this._id, this._recipient, this._description, this._dateday, this._time);

  Message(this._recipient, this._description, this._dateday, this._time);

  int get id => _id;

  String get recipient => _recipient;

  String get description => _description;

  String get dateDay => _dateday;

  String get time => _time;

  set recipient(String newRecipient) {
    if (newRecipient.length <= 30) {
      this._recipient = newRecipient;
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
    map['recipient'] = _recipient;
    map['description'] = _description;
    map['dateday'] = _dateday;
    map['time'] = _time;

    return map;
  }

  Message.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._recipient = map['recipient'];
    this._description = map['description'];
    this._dateday = map['dateday'];
    this._time = map['time'];
  }
}
