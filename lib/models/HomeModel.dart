import 'package:movie/models/ProductModel.dart';

class HomeModel {
  List<Product> _hotProducts;
  List<Product> _recentlyProducts;
  List<Product> _bestProducts;
  int _errorCode;

  HomeModel(
      {List<Product> hotProducts,
        List<Product> recentlyProducts,
        List<Product> bestProducts,
        int errorCode}) {
    this._hotProducts = hotProducts;
    this._recentlyProducts = recentlyProducts;
    this._bestProducts = bestProducts;
    this._errorCode = errorCode;
  }

  List<Product> get hotProducts => _hotProducts;
  set hotProducts(List<Product> hotProducts) => _hotProducts = hotProducts;
  List<Product> get recentlyProducts => _recentlyProducts;
  set recentlyProducts(List<Product> recentlyProducts) =>
      _recentlyProducts = recentlyProducts;
  List<Product> get bestProducts => _bestProducts;
  set bestProducts(List<Product> bestProducts) =>
      _bestProducts = bestProducts;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['hot_products'] != null) {
      _hotProducts = new List<Product>();
      json['hot_products'].forEach((v) {
        _hotProducts.add(new Product.fromJson(v));
      });
    }
    if (json['recently_products'] != null) {
      _recentlyProducts = new List<Product>();
      json['recently_products'].forEach((v) {
        _recentlyProducts.add(new Product.fromJson(v));
      });
    }
    if (json['best_products'] != null) {
      _bestProducts = new List<Product>();
      json['best_products'].forEach((v) {
        _bestProducts.add(new Product.fromJson(v));
      });
    }
    _errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._hotProducts != null) {
      data['hot_products'] = this._hotProducts.map((v) => v.toJson()).toList();
    }
    if (this._recentlyProducts != null) {
      data['recently_products'] =
          this._recentlyProducts.map((v) => v.toJson()).toList();
    }
    if (this._bestProducts != null) {
      data['best_products'] =
          this._bestProducts.map((v) => v.toJson()).toList();
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
