class KefuSettingsModel {
  List<KefuSettings> _kefuSettings;
  int _errorCode;

  KefuSettingsModel({List<KefuSettings> kefuSettings, int errorCode}) {
    this._kefuSettings = kefuSettings;
    this._errorCode = errorCode;
  }

  List<KefuSettings> get kefuSettings => _kefuSettings;
  set kefuSettings(List<KefuSettings> kefuSettings) =>
      _kefuSettings = kefuSettings;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  KefuSettingsModel.fromJson(Map<String, dynamic> json) {
    if (json['kefuSettings'] != null) {
      _kefuSettings = new List<KefuSettings>();
      json['kefuSettings'].forEach((v) {
        _kefuSettings.add(new KefuSettings.fromJson(v));
      });
    }
    _errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._kefuSettings != null) {
      data['kefuSettings'] = this._kefuSettings.map((v) => v.toJson()).toList();
    }
    data['error_code'] = this._errorCode;
    return data;
  }
}

class KefuSettings {
  int _id;
  String _title;
  String _subtitle;
  String _content;
  String _logoUrl;

  KefuSettings(
      {int id, String title, String subtitle, String content, String logoUrl}) {
    this._id = id;
    this._title = title;
    this._subtitle = subtitle;
    this._content = content;
    this._logoUrl = logoUrl;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;
  String get subtitle => _subtitle;
  set subtitle(String subtitle) => _subtitle = subtitle;
  String get content => _content;
  set content(String content) => _content = content;
  String get logoUrl => _logoUrl;
  set logoUrl(String logoUrl) => _logoUrl = logoUrl;

  KefuSettings.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _subtitle = json['subtitle'];
    _content = json['content'];
    _logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['subtitle'] = this._subtitle;
    data['content'] = this._content;
    data['logo_url'] = this._logoUrl;
    return data;
  }
}
