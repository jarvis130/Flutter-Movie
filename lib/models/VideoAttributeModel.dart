class VideoAttributeModel {
  List<Map> _videoarea;
  List<Map> _videotype;
  int _errorCode;

  VideoAttributeModel(
      {List<Map> videoarea, List<Map> videotype, int errorCode}) {
    this._videoarea = videoarea;
    this._videotype = videotype;
    this._errorCode = errorCode;
  }

  List<Map> get videoarea => _videoarea;
  set videoarea(List<Map> videoarea) => _videoarea = videoarea;
  List<Map> get videotype => _videotype;
  set videotype(List<Map> videotype) => _videotype = videotype;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  VideoAttributeModel.fromJson(Map<String, dynamic> json) {
    if (json['videoarea'] != null) {
      _videoarea = new List<Map>();
      json['videoarea'].forEach((v) {
        Map map = new Map();
        map['title'] = v['title'];
        map['value'] = v['value'];
        _videoarea.add(map);
      });
    }
    if (json['videotype'] != null) {
      _videotype = new List<Map>();
      json['videotype'].forEach((v) {
        Map map = new Map();
        map['title'] = v['title'];
        map['value'] = v['value'];
        _videotype.add(map);
      });
    }
    _errorCode = json['error_code'];
  }

}