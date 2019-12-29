class ProductModel {
  Product _product;
  int _errorCode;

  ProductModel({Product product, int errorCode}) {
    this._product = product;
    this._errorCode = errorCode;
  }

  Product get product => _product;
  set product(Product product) => _product = product;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  ProductModel.fromJson(Map<String, dynamic> json) {
    _product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    _errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._product != null) {
      data['product'] = this._product.toJson();
    }
    data['error_code'] = this._errorCode;
    return data;
  }
}

class Product {
  String _goodsSn;
  String _goodsName;
  int _goodsNumber;
  String _marketPrice;
  String _goodsDesc;
  int _isReal;
  String _extensionCode;
  int _isOnSale;
  int _isAloneSale;
  int _isShipping;
  int _integral;
  String _videoUrl;
  int _id;
  int _category;
  int _brand;
  int _shop;
  String _sku;
  DefaultPhoto _defaultPhoto;
//  List<Photos> _photos;
  String _name;
  String _price;
  String _currentPrice;
  Null _discount;
  bool _isExchange;
  int _exchangeScore;
  int _salesCount;
  int _score;
  int _goodStock;
  int _commentCount;
  int _isLiked;
  String _reviewRate;
//  Null _introUrl;
  String _shareUrl;
  int _createdAt;
  int _updatedAt;
  int _isCollect;
  List<Null> _promos;
  List<Null> _properties;
  List<PropertieInfo> _propertieInfo;
  List<Null> _tags;
  List<Null> _stock;
  List<Null> _attachments;

  Product(
      {String goodsSn,
        String goodsName,
        int goodsNumber,
        String marketPrice,
        String goodsDesc,
        int isReal,
        String extensionCode,
        int isOnSale,
        int isAloneSale,
        int isShipping,
        int integral,
        String videoUrl,
        int id,
        int category,
        int brand,
        int shop,
        String sku,
        DefaultPhoto defaultPhoto,
//        List<Photos> photos,
        String name,
        String price,
        String currentPrice,
        Null discount,
        bool isExchange,
        int exchangeScore,
        int salesCount,
        int score,
        int goodStock,
        int commentCount,
        int isLiked,
        String reviewRate,
//        Null introUrl,
        String shareUrl,
        int createdAt,
        int updatedAt,
        int isCollect,
        List<Null> promos,
        List<Null> properties,
        List<PropertieInfo> propertieInfo,
        List<Null> tags,
        List<Null> stock,
        List<Null> attachments}) {
    this._goodsSn = goodsSn;
    this._goodsName = goodsName;
    this._goodsNumber = goodsNumber;
    this._marketPrice = marketPrice;
    this._goodsDesc = goodsDesc;
    this._isReal = isReal;
    this._extensionCode = extensionCode;
    this._isOnSale = isOnSale;
    this._isAloneSale = isAloneSale;
    this._isShipping = isShipping;
    this._integral = integral;
    this._videoUrl = videoUrl;
    this._id = id;
    this._category = category;
    this._brand = brand;
    this._shop = shop;
    this._sku = sku;
    this._defaultPhoto = defaultPhoto;
//    this._photos = photos;
    this._name = name;
    this._price = price;
    this._currentPrice = currentPrice;
    this._discount = discount;
    this._isExchange = isExchange;
    this._exchangeScore = exchangeScore;
    this._salesCount = salesCount;
    this._score = score;
    this._goodStock = goodStock;
    this._commentCount = commentCount;
    this._isLiked = isLiked;
    this._reviewRate = reviewRate;
//    this._introUrl = introUrl;
    this._shareUrl = shareUrl;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._isCollect = isCollect;
    this._promos = promos;
    this._properties = properties;
    this._propertieInfo = propertieInfo;
    this._tags = tags;
    this._stock = stock;
    this._attachments = attachments;
  }

  String get goodsSn => _goodsSn;
  set goodsSn(String goodsSn) => _goodsSn = goodsSn;
  String get goodsName => _goodsName;
  set goodsName(String goodsName) => _goodsName = goodsName;
  int get goodsNumber => _goodsNumber;
  set goodsNumber(int goodsNumber) => _goodsNumber = goodsNumber;
  String get marketPrice => _marketPrice;
  set marketPrice(String marketPrice) => _marketPrice = marketPrice;
  String get goodsDesc => _goodsDesc;
  set goodsDesc(String goodsDesc) => _goodsDesc = goodsDesc;
  int get isReal => _isReal;
  set isReal(int isReal) => _isReal = isReal;
  String get extensionCode => _extensionCode;
  set extensionCode(String extensionCode) => _extensionCode = extensionCode;
  int get isOnSale => _isOnSale;
  set isOnSale(int isOnSale) => _isOnSale = isOnSale;
  int get isAloneSale => _isAloneSale;
  set isAloneSale(int isAloneSale) => _isAloneSale = isAloneSale;
  int get isShipping => _isShipping;
  set isShipping(int isShipping) => _isShipping = isShipping;
  int get integral => _integral;
  set integral(int integral) => _integral = integral;
  String get videoUrl => _videoUrl;
  set videoUrl(String videoUrl) => _videoUrl = videoUrl;
  int get id => _id;
  set id(int id) => _id = id;
  int get category => _category;
  set category(int category) => _category = category;
  int get brand => _brand;
  set brand(int brand) => _brand = brand;
  int get shop => _shop;
  set shop(int shop) => _shop = shop;
  String get sku => _sku;
  set sku(String sku) => _sku = sku;
  DefaultPhoto get defaultPhoto => _defaultPhoto;
  set defaultPhoto(DefaultPhoto defaultPhoto) => _defaultPhoto = defaultPhoto;
//  List<Photos> get photos => _photos;
//  set photos(List<Photos> photos) => _photos = photos;
  String get name => _name;
  set name(String name) => _name = name;
  String get price => _price;
  set price(String price) => _price = price;
  String get currentPrice => _currentPrice;
  set currentPrice(String currentPrice) => _currentPrice = currentPrice;
  Null get discount => _discount;
  set discount(Null discount) => _discount = discount;
  bool get isExchange => _isExchange;
  set isExchange(bool isExchange) => _isExchange = isExchange;
  int get exchangeScore => _exchangeScore;
  set exchangeScore(int exchangeScore) => _exchangeScore = exchangeScore;
  int get salesCount => _salesCount;
  set salesCount(int salesCount) => _salesCount = salesCount;
  int get score => _score;
  set score(int score) => _score = score;
  int get goodStock => _goodStock;
  set goodStock(int goodStock) => _goodStock = goodStock;
  int get commentCount => _commentCount;
  set commentCount(int commentCount) => _commentCount = commentCount;
  int get isLiked => _isLiked;
  set isLiked(int isLiked) => _isLiked = isLiked;
  String get reviewRate => _reviewRate;
  set reviewRate(String reviewRate) => _reviewRate = reviewRate;
//  Null get introUrl => _introUrl;
//  set introUrl(Null introUrl) => _introUrl = introUrl;
  String get shareUrl => _shareUrl;
  set shareUrl(String shareUrl) => _shareUrl = shareUrl;
  int get createdAt => _createdAt;
  set createdAt(int createdAt) => _createdAt = createdAt;
  int get updatedAt => _updatedAt;
  set updatedAt(int updatedAt) => _updatedAt = updatedAt;
  int get isCollect => _isCollect;
  set isCollect(int isCollect) => _isCollect = isCollect;
  List<Null> get promos => _promos;
  set promos(List<Null> promos) => _promos = promos;
  List<Null> get properties => _properties;
  set properties(List<Null> properties) => _properties = properties;
  List<PropertieInfo> get propertieInfo => _propertieInfo;
  set propertieInfo(List<PropertieInfo> propertieInfo) =>
      _propertieInfo = propertieInfo;
  List<Null> get tags => _tags;
  set tags(List<Null> tags) => _tags = tags;
  List<Null> get stock => _stock;
  set stock(List<Null> stock) => _stock = stock;
  List<Null> get attachments => _attachments;
  set attachments(List<Null> attachments) => _attachments = attachments;

  Product.fromJson(Map<String, dynamic> json) {
    _goodsSn = json['goods_sn'];
    _goodsName = json['goods_name'];
    _goodsNumber = json['goods_number'];
    _marketPrice = json['market_price'];
    _goodsDesc = json['goods_desc'];
    _isReal = json['is_real'];
    _extensionCode = json['extension_code'];
    _isOnSale = json['is_on_sale'];
    _isAloneSale = json['is_alone_sale'];
    _isShipping = json['is_shipping'];
    _integral = json['integral'];
    _videoUrl = json['video_url'];
    _id = json['id'];
    _category = json['category'];
    _brand = json['brand'];
    _shop = json['shop'];
    _sku = json['sku'];
    _defaultPhoto = json['default_photo'] != null
        ? new DefaultPhoto.fromJson(json['default_photo'])
        : null;
//    if (json['photos'] != null) {
//      _photos = new List<Photos>();
//      json['photos'].forEach((v) {
//        _photos.add(new Photos.fromJson(v));
//      });
//    }
    _name = json['name'];
    _price = json['price'];
    _currentPrice = json['current_price'];
    _discount = json['discount'];
    _isExchange = json['is_exchange'];
    _exchangeScore = json['exchange_score'];
    _salesCount = json['sales_count'];
    _score = json['score'];
    _goodStock = json['good_stock'];
    _commentCount = json['comment_count'];
    _isLiked = json['is_liked'];
    _reviewRate = json['review_rate'];
//    _introUrl = json['intro_url'];
    _shareUrl = json['share_url'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isCollect = json['is_collect'];
//    if (json['promos'] != null) {
//      _promos = new List<Null>();
//      json['promos'].forEach((v) {
//        _promos.add(new Null.fromJson(v));
//      });
//    }
//    if (json['properties'] != null) {
//      _properties = new List<Null>();
//      json['properties'].forEach((v) {
//        _properties.add(new Null.fromJson(v));
//      });
//    }
    if (json['propertie_info'] != null) {
      _propertieInfo = new List<PropertieInfo>();
      json['propertie_info'].forEach((v) {
        _propertieInfo.add(new PropertieInfo.fromJson(v));
      });
    }
//    if (json['tags'] != null) {
//      _tags = new List<Null>();
//      json['tags'].forEach((v) {
//        _tags.add(new Null.fromJson(v));
//      });
//    }
//    if (json['stock'] != null) {
//      _stock = new List<Null>();
//      json['stock'].forEach((v) {
//        _stock.add(new Null.fromJson(v));
//      });
//    }
//    if (json['attachments'] != null) {
//      _attachments = new List<Null>();
//      json['attachments'].forEach((v) {
//        _attachments.add(new Null.fromJson(v));
//      });
//    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goods_sn'] = this._goodsSn;
    data['goods_name'] = this._goodsName;
    data['goods_number'] = this._goodsNumber;
    data['market_price'] = this._marketPrice;
    data['goods_desc'] = this._goodsDesc;
    data['is_real'] = this._isReal;
    data['extension_code'] = this._extensionCode;
    data['is_on_sale'] = this._isOnSale;
    data['is_alone_sale'] = this._isAloneSale;
    data['is_shipping'] = this._isShipping;
    data['integral'] = this._integral;
    data['video_url'] = this._videoUrl;
    data['id'] = this._id;
    data['category'] = this._category;
    data['brand'] = this._brand;
    data['shop'] = this._shop;
    data['sku'] = this._sku;
    if (this._defaultPhoto != null) {
      data['default_photo'] = this._defaultPhoto.toJson();
    }
//    if (this._photos != null) {
//      data['photos'] = this._photos.map((v) => v.toJson()).toList();
//    }
    data['name'] = this._name;
    data['price'] = this._price;
    data['current_price'] = this._currentPrice;
    data['discount'] = this._discount;
    data['is_exchange'] = this._isExchange;
    data['exchange_score'] = this._exchangeScore;
    data['sales_count'] = this._salesCount;
    data['score'] = this._score;
    data['good_stock'] = this._goodStock;
    data['comment_count'] = this._commentCount;
    data['is_liked'] = this._isLiked;
    data['review_rate'] = this._reviewRate;
//    data['intro_url'] = this._introUrl;
    data['share_url'] = this._shareUrl;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['is_collect'] = this._isCollect;
//    if (this._promos != null) {
//      data['promos'] = this._promos.map((v) => v.toJson()).toList();
//    }
//    if (this._properties != null) {
//      data['properties'] = this._properties.map((v) => v.toJson()).toList();
//    }
//    if (this._propertieInfo != null) {
//      data['propertie_info'] =
//          this._propertieInfo.map((v) => v.toJson()).toList();
//    }
//    if (this._tags != null) {
//      data['tags'] = this._tags.map((v) => v.toJson()).toList();
//    }
//    if (this._stock != null) {
//      data['stock'] = this._stock.map((v) => v.toJson()).toList();
//    }
//    if (this._attachments != null) {
//      data['attachments'] = this._attachments.map((v) => v.toJson()).toList();
//    }
    return data;
  }
}

class DefaultPhoto {
  Null _width;
  Null _height;
  String _thumb;
  String _large;

  DefaultPhoto({Null width, Null height, String thumb, String large}) {
    this._width = width;
    this._height = height;
    this._thumb = thumb;
    this._large = large;
  }

  Null get width => _width;
  set width(Null width) => _width = width;
  Null get height => _height;
  set height(Null height) => _height = height;
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

class PropertieInfo {
  int _attrId;
  int _catId;
  String _attrName;
  int _attrInputType;
  int _attrType;
  String _attrValues;
  int _attrIndex;
  int _sortOrder;
  int _isLinked;
  int _attrGroup;
  Pivot _pivot;

  PropertieInfo(
      {int attrId,
        int catId,
        String attrName,
        int attrInputType,
        int attrType,
        String attrValues,
        int attrIndex,
        int sortOrder,
        int isLinked,
        int attrGroup,
        Pivot pivot}) {
    this._attrId = attrId;
    this._catId = catId;
    this._attrName = attrName;
    this._attrInputType = attrInputType;
    this._attrType = attrType;
    this._attrValues = attrValues;
    this._attrIndex = attrIndex;
    this._sortOrder = sortOrder;
    this._isLinked = isLinked;
    this._attrGroup = attrGroup;
    this._pivot = pivot;
  }

  int get attrId => _attrId;
  set attrId(int attrId) => _attrId = attrId;
  int get catId => _catId;
  set catId(int catId) => _catId = catId;
  String get attrName => _attrName;
  set attrName(String attrName) => _attrName = attrName;
  int get attrInputType => _attrInputType;
  set attrInputType(int attrInputType) => _attrInputType = attrInputType;
  int get attrType => _attrType;
  set attrType(int attrType) => _attrType = attrType;
  String get attrValues => _attrValues;
  set attrValues(String attrValues) => _attrValues = attrValues;
  int get attrIndex => _attrIndex;
  set attrIndex(int attrIndex) => _attrIndex = attrIndex;
  int get sortOrder => _sortOrder;
  set sortOrder(int sortOrder) => _sortOrder = sortOrder;
  int get isLinked => _isLinked;
  set isLinked(int isLinked) => _isLinked = isLinked;
  int get attrGroup => _attrGroup;
  set attrGroup(int attrGroup) => _attrGroup = attrGroup;
  Pivot get pivot => _pivot;
  set pivot(Pivot pivot) => _pivot = pivot;

  PropertieInfo.fromJson(Map<String, dynamic> json) {
    _attrId = json['attr_id'];
    _catId = json['cat_id'];
    _attrName = json['attr_name'];
    _attrInputType = json['attr_input_type'];
    _attrType = json['attr_type'];
    _attrValues = json['attr_values'];
    _attrIndex = json['attr_index'];
    _sortOrder = json['sort_order'];
    _isLinked = json['is_linked'];
    _attrGroup = json['attr_group'];
    _pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attr_id'] = this._attrId;
    data['cat_id'] = this._catId;
    data['attr_name'] = this._attrName;
    data['attr_input_type'] = this._attrInputType;
    data['attr_type'] = this._attrType;
    data['attr_values'] = this._attrValues;
    data['attr_index'] = this._attrIndex;
    data['sort_order'] = this._sortOrder;
    data['is_linked'] = this._isLinked;
    data['attr_group'] = this._attrGroup;
    if (this._pivot != null) {
      data['pivot'] = this._pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int _goodsId;
  int _attrId;

  Pivot({int goodsId, int attrId}) {
    this._goodsId = goodsId;
    this._attrId = attrId;
  }

  int get goodsId => _goodsId;
  set goodsId(int goodsId) => _goodsId = goodsId;
  int get attrId => _attrId;
  set attrId(int attrId) => _attrId = attrId;

  Pivot.fromJson(Map<String, dynamic> json) {
    _goodsId = json['goods_id'];
    _attrId = json['attr_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goods_id'] = this._goodsId;
    data['attr_id'] = this._attrId;
    return data;
  }
}
