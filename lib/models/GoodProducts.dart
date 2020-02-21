import 'package:movie/models/ProductModel.dart';

class GoodProducts {
  List<Product> _products;
  Paged _paged;
  int _errorCode;

  GoodProducts({List<Product> products, Paged paged, int errorCode}) {
    this._products = products;
    this._paged = paged;
    this._errorCode = errorCode;
  }

  List<Product> get products => _products;
  set products(List<Product> products) => _products = products;
  Paged get paged => _paged;
  set paged(Paged paged) => _paged = paged;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  GoodProducts.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      _products = new List<Product>();
      json['products'].forEach((v) {
        _products.add(new Product.fromJson(v));
      });
    }
    _paged = json['paged'] != null ? new Paged.fromJson(json['paged']) : null;
    _errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._products != null) {
      data['products'] = this._products.map((v) => v.toJson()).toList();
    }
    if (this._paged != null) {
      data['paged'] = this._paged.toJson();
    }
    data['error_code'] = this._errorCode;
    return data;
  }
}

class DefaultPhoto {
  int _width;
  int _height;
  String _thumb;
  String _large;

  DefaultPhoto({int width, int height, String thumb, String large}) {
    this._width = width;
    this._height = height;
    this._thumb = thumb;
    this._large = large;
  }

  int get width => _width;
  set width(int width) => _width = width;
  int get height => _height;
  set height(int height) => _height = height;
  String get thumb => _thumb;
  set thumb(String thumb) => _thumb = thumb;
  String get large => _large;
  set large(String large) => _large = large;

  DefaultPhoto.fromJson(Map<String, dynamic> json) {
    _width = json['width'];
    _height = json['height'];
    _thumb = json['thumb'];
    _large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this._width;
    data['height'] = this._height;
    data['thumb'] = this._thumb;
    data['large'] = this._large;
    return data;
  }
}

class Properties {
  int _id;
  String _name;
  List<Attrs> _attrs;
  bool _isMultiselect;

  Properties({int id, String name, List<Attrs> attrs, bool isMultiselect}) {
    this._id = id;
    this._name = name;
    this._attrs = attrs;
    this._isMultiselect = isMultiselect;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  List<Attrs> get attrs => _attrs;
  set attrs(List<Attrs> attrs) => _attrs = attrs;
  bool get isMultiselect => _isMultiselect;
  set isMultiselect(bool isMultiselect) => _isMultiselect = isMultiselect;

  Properties.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    if (json['attrs'] != null) {
      _attrs = new List<Attrs>();
      json['attrs'].forEach((v) {
        _attrs.add(new Attrs.fromJson(v));
      });
    }
    _isMultiselect = json['is_multiselect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    if (this._attrs != null) {
      data['attrs'] = this._attrs.map((v) => v.toJson()).toList();
    }
    data['is_multiselect'] = this._isMultiselect;
    return data;
  }
}

class Attrs {
  int _attrId;
  int _attrPrice;
  int _id;
  String _attrName;
  bool _isMultiselect;

  Attrs(
      {int attrId,
        int attrPrice,
        int id,
        String attrName,
        bool isMultiselect}) {
    this._attrId = attrId;
    this._attrPrice = attrPrice;
    this._id = id;
    this._attrName = attrName;
    this._isMultiselect = isMultiselect;
  }

  int get attrId => _attrId;
  set attrId(int attrId) => _attrId = attrId;
  int get attrPrice => _attrPrice;
  set attrPrice(int attrPrice) => _attrPrice = attrPrice;
  int get id => _id;
  set id(int id) => _id = id;
  String get attrName => _attrName;
  set attrName(String attrName) => _attrName = attrName;
  bool get isMultiselect => _isMultiselect;
  set isMultiselect(bool isMultiselect) => _isMultiselect = isMultiselect;

  Attrs.fromJson(Map<String, dynamic> json) {
    _attrId = json['attr_id'];
    _attrPrice = json['attr_price'];
    _id = json['id'];
    _attrName = json['attr_name'];
    _isMultiselect = json['is_multiselect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attr_id'] = this._attrId;
    data['attr_price'] = this._attrPrice;
    data['id'] = this._id;
    data['attr_name'] = this._attrName;
    data['is_multiselect'] = this._isMultiselect;
    return data;
  }
}

class Paged {
  int _total;
  int _page;
  int _size;
  int _more;

  Paged({int total, int page, int size, int more}) {
    this._total = total;
    this._page = page;
    this._size = size;
    this._more = more;
  }

  int get total => _total;
  set total(int total) => _total = total;
  int get page => _page;
  set page(int page) => _page = page;
  int get size => _size;
  set size(int size) => _size = size;
  int get more => _more;
  set more(int more) => _more = more;

  Paged.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    _page = json['page'];
    _size = json['size'];
    _more = json['more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this._total;
    data['page'] = this._page;
    data['size'] = this._size;
    data['more'] = this._more;
    return data;
  }
}
