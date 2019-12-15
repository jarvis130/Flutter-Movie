class GoodProducts {
  List<Products> _products;
  Paged _paged;
  int _errorCode;

  GoodProducts({List<Products> products, Paged paged, int errorCode}) {
    this._products = products;
    this._paged = paged;
    this._errorCode = errorCode;
  }

  List<Products> get products => _products;
  set products(List<Products> products) => _products = products;
  Paged get paged => _paged;
  set paged(Paged paged) => _paged = paged;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  GoodProducts.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      _products = new List<Products>();
      json['products'].forEach((v) {
        _products.add(new Products.fromJson(v));
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

class Products {
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
  int _id;
  int _category;
  int _brand;
  int _shop;
  String _sku;
  DefaultPhoto _defaultPhoto;
  List<Null> _photos;
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
  String _introUrl;
  String _shareUrl;
  int _createdAt;
  int _updatedAt;
  List<Null> _promos;
  List<Properties> _properties;

  Products(
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
        int id,
        int category,
        int brand,
        int shop,
        String sku,
        DefaultPhoto defaultPhoto,
        List<Null> photos,
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
        String introUrl,
        String shareUrl,
        int createdAt,
        int updatedAt,
        List<Null> promos,
        List<Properties> properties}) {
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
    this._id = id;
    this._category = category;
    this._brand = brand;
    this._shop = shop;
    this._sku = sku;
    this._defaultPhoto = defaultPhoto;
    this._photos = photos;
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
    this._introUrl = introUrl;
    this._shareUrl = shareUrl;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._promos = promos;
    this._properties = properties;
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
  List<Null> get photos => _photos;
  set photos(List<Null> photos) => _photos = photos;
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
  String get introUrl => _introUrl;
  set introUrl(String introUrl) => _introUrl = introUrl;
  String get shareUrl => _shareUrl;
  set shareUrl(String shareUrl) => _shareUrl = shareUrl;
  int get createdAt => _createdAt;
  set createdAt(int createdAt) => _createdAt = createdAt;
  int get updatedAt => _updatedAt;
  set updatedAt(int updatedAt) => _updatedAt = updatedAt;
  List<Null> get promos => _promos;
  set promos(List<Null> promos) => _promos = promos;
  List<Properties> get properties => _properties;
  set properties(List<Properties> properties) => _properties = properties;

  Products.fromJson(Map<String, dynamic> json) {
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
    _id = json['id'];
    _category = json['category'];
    _brand = json['brand'];
    _shop = json['shop'];
    _sku = json['sku'];
    _defaultPhoto = json['default_photo'] != null
        ? new DefaultPhoto.fromJson(json['default_photo'])
        : null;
//    if (json['photos'] != null) {
//      _photos = new List<Null>();
//      json['photos'].forEach((v) {
//        _photos.add(new Null.fromJson(v));
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
    _introUrl = json['intro_url'];
    _shareUrl = json['share_url'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
//    if (json['promos'] != null) {
//      _promos = new List<Null>();
//      json['promos'].forEach((v) {
//        _promos.add(new Null.fromJson(v));
//      });
//    }
    if (json['properties'] != null) {
      _properties = new List<Properties>();
      json['properties'].forEach((v) {
        _properties.add(new Properties.fromJson(v));
      });
    }
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
    data['intro_url'] = this._introUrl;
    data['share_url'] = this._shareUrl;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
//    if (this._promos != null) {
//      data['promos'] = this._promos.map((v) => v.toJson()).toList();
//    }
    if (this._properties != null) {
      data['properties'] = this._properties.map((v) => v.toJson()).toList();
    }
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
