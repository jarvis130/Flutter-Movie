class OrderListModel {
  List<Orders> _orders;
  Paged _paged;
  int _errorCode;

  OrderListModel({List<Orders> orders, Paged paged, int errorCode}) {
    this._orders = orders;
    this._paged = paged;
    this._errorCode = errorCode;
  }

  List<Orders> get orders => _orders;
  set orders(List<Orders> orders) => _orders = orders;
  Paged get paged => _paged;
  set paged(Paged paged) => _paged = paged;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  OrderListModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      _orders = new List<Orders>();
      json['orders'].forEach((v) {
        _orders.add(new Orders.fromJson(v));
      });
    }
    _paged = json['paged'] != null ? new Paged.fromJson(json['paged']) : null;
    _errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._orders != null) {
      data['orders'] = this._orders.map((v) => v.toJson()).toList();
    }
    if (this._paged != null) {
      data['paged'] = this._paged.toJson();
    }
    data['error_code'] = this._errorCode;
    return data;
  }
}

class Orders {
  Consignee _consignee;
  String _extensionCode;
  String _tax;
  int _id;
  String _sn;
  int _total;
  Payment _payment;
  Shipping _shipping;
  Invoice _invoice;
  int _coupon;
  Score _score;
  Score _useScore;
  Cashgift _cashgift;
  int _status;
  int _createdAt;
  int _updatedAt;
  int _canceledAt;
  int _paiedAt;
  int _shippingAt;
  int _finishAt;
  List<Promos> _promos;
  List<Goods> _goods;

  Orders(
      {Consignee consignee,
        String extensionCode,
        String tax,
        int id,
        String sn,
        int total,
        Payment payment,
        Shipping shipping,
        Invoice invoice,
        int coupon,
        Score score,
        Score useScore,
        Cashgift cashgift,
        int status,
        int createdAt,
        int updatedAt,
        int canceledAt,
        int paiedAt,
        int shippingAt,
        int finishAt,
        List<Promos> promos,
        List<Goods> goods}) {
    this._consignee = consignee;
    this._extensionCode = extensionCode;
    this._tax = tax;
    this._id = id;
    this._sn = sn;
    this._total = total;
    this._payment = payment;
    this._shipping = shipping;
    this._invoice = invoice;
    this._coupon = coupon;
    this._score = score;
    this._useScore = useScore;
    this._cashgift = cashgift;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._canceledAt = canceledAt;
    this._paiedAt = paiedAt;
    this._shippingAt = shippingAt;
    this._finishAt = finishAt;
    this._promos = promos;
    this._goods = goods;
  }

  Consignee get consignee => _consignee;
  set consignee(Consignee consignee) => _consignee = consignee;
  String get extensionCode => _extensionCode;
  set extensionCode(String extensionCode) => _extensionCode = extensionCode;
  String get tax => _tax;
  set tax(String tax) => _tax = tax;
  int get id => _id;
  set id(int id) => _id = id;
  String get sn => _sn;
  set sn(String sn) => _sn = sn;
  int get total => _total;
  set total(int total) => _total = total;
  Payment get payment => _payment;
  set payment(Payment payment) => _payment = payment;
  Shipping get shipping => _shipping;
  set shipping(Shipping shipping) => _shipping = shipping;
  Invoice get invoice => _invoice;
  set invoice(Invoice invoice) => _invoice = invoice;
  int get coupon => _coupon;
  set coupon(int coupon) => _coupon = coupon;
  Score get score => _score;
  set score(Score score) => _score = score;
  Score get useScore => _useScore;
  set useScore(Score useScore) => _useScore = useScore;
  Cashgift get cashgift => _cashgift;
  set cashgift(Cashgift cashgift) => _cashgift = cashgift;
  int get status => _status;
  set status(int status) => _status = status;
  int get createdAt => _createdAt;
  set createdAt(int createdAt) => _createdAt = createdAt;
  int get updatedAt => _updatedAt;
  set updatedAt(int updatedAt) => _updatedAt = updatedAt;
  int get canceledAt => _canceledAt;
  set canceledAt(int canceledAt) => _canceledAt = canceledAt;
  int get paiedAt => _paiedAt;
  set paiedAt(int paiedAt) => _paiedAt = paiedAt;
  int get shippingAt => _shippingAt;
  set shippingAt(int shippingAt) => _shippingAt = shippingAt;
  int get finishAt => _finishAt;
  set finishAt(int finishAt) => _finishAt = finishAt;
  List<Promos> get promos => _promos;
  set promos(List<Promos> promos) => _promos = promos;
  List<Goods> get goods => _goods;
  set goods(List<Goods> goods) => _goods = goods;

  Orders.fromJson(Map<String, dynamic> json) {
    _consignee = json['consignee'] != null
        ? new Consignee.fromJson(json['consignee'])
        : null;
    _extensionCode = json['extension_code'];
    _tax = json['tax'];
    _id = json['id'];
    _sn = json['sn'];
    _total = json['total'];
    _payment =
    json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
    _shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    _invoice =
    json['invoice'] != null ? new Invoice.fromJson(json['invoice']) : null;
    _coupon = json['coupon'];
    _score = json['score'] != null ? new Score.fromJson(json['score']) : null;
    _useScore = json['use_score'] != null
        ? new Score.fromJson(json['use_score'])
        : null;
    _cashgift = json['cashgift'] != null
        ? new Cashgift.fromJson(json['cashgift'])
        : null;
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _canceledAt = json['canceled_at'];
    _paiedAt = json['paied_at'];
    _shippingAt = json['shipping_at'];
    _finishAt = json['finish_at'];
    if (json['promos'] != null) {
      _promos = new List<Promos>();
      json['promos'].forEach((v) {
        _promos.add(new Promos.fromJson(v));
      });
    }
    if (json['goods'] != null) {
      _goods = new List<Goods>();
      json['goods'].forEach((v) {
        _goods.add(new Goods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._consignee != null) {
      data['consignee'] = this._consignee.toJson();
    }
    data['extension_code'] = this._extensionCode;
    data['tax'] = this._tax;
    data['id'] = this._id;
    data['sn'] = this._sn;
    data['total'] = this._total;
    if (this._payment != null) {
      data['payment'] = this._payment.toJson();
    }
    if (this._shipping != null) {
      data['shipping'] = this._shipping.toJson();
    }
    if (this._invoice != null) {
      data['invoice'] = this._invoice.toJson();
    }
    data['coupon'] = this._coupon;
    if (this._score != null) {
      data['score'] = this._score.toJson();
    }
    if (this._useScore != null) {
      data['use_score'] = this._useScore.toJson();
    }
    if (this._cashgift != null) {
      data['cashgift'] = this._cashgift.toJson();
    }
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['canceled_at'] = this._canceledAt;
    data['paied_at'] = this._paiedAt;
    data['shipping_at'] = this._shippingAt;
    data['finish_at'] = this._finishAt;
    if (this._promos != null) {
      data['promos'] = this._promos.map((v) => v.toJson()).toList();
    }
    if (this._goods != null) {
      data['goods'] = this._goods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Consignee {
  String _name;
  String _mobile;
  String _tel;
  String _zipCode;
  bool _regions;
  String _address;

  Consignee(
      {String name,
        String mobile,
        String tel,
        String zipCode,
        bool regions,
        String address}) {
    this._name = name;
    this._mobile = mobile;
    this._tel = tel;
    this._zipCode = zipCode;
    this._regions = regions;
    this._address = address;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get mobile => _mobile;
  set mobile(String mobile) => _mobile = mobile;
  String get tel => _tel;
  set tel(String tel) => _tel = tel;
  String get zipCode => _zipCode;
  set zipCode(String zipCode) => _zipCode = zipCode;
  bool get regions => _regions;
  set regions(bool regions) => _regions = regions;
  String get address => _address;
  set address(String address) => _address = address;

  Consignee.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _mobile = json['mobile'];
    _tel = json['tel'];
    _zipCode = json['zip_code'];
    _regions = json['regions'];
    _address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['mobile'] = this._mobile;
    data['tel'] = this._tel;
    data['zip_code'] = this._zipCode;
    data['regions'] = this._regions;
    data['address'] = this._address;
    return data;
  }
}

class Payment {
  String _name;

  Payment({String name}) {
    this._name = name;
  }

  String get name => _name;
  set name(String name) => _name = name;

  Payment.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    return data;
  }
}

class Shipping {
  int _id;
  String _code;
  String _name;
  String _desc;
  String _price;
  String _tracking;

  Shipping(
      {int id,
        String code,
        String name,
        String desc,
        String price,
        String tracking}) {
    this._id = id;
    this._code = code;
    this._name = name;
    this._desc = desc;
    this._price = price;
    this._tracking = tracking;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get code => _code;
  set code(String code) => _code = code;
  String get name => _name;
  set name(String name) => _name = name;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  String get price => _price;
  set price(String price) => _price = price;
  String get tracking => _tracking;
  set tracking(String tracking) => _tracking = tracking;

  Shipping.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
    _desc = json['desc'];
    _price = json['price'];
    _tracking = json['tracking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['code'] = this._code;
    data['name'] = this._name;
    data['desc'] = this._desc;
    data['price'] = this._price;
    data['tracking'] = this._tracking;
    return data;
  }
}

class Invoice {
  String _type;
  String _content;
  String _title;

  Invoice({String type, String content, String title}) {
    this._type = type;
    this._content = content;
    this._title = title;
  }

  String get type => _type;
  set type(String type) => _type = type;
  String get content => _content;
  set content(String content) => _content = content;
  String get title => _title;
  set title(String title) => _title = title;

  Invoice.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _content = json['content'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['content'] = this._content;
    data['title'] = this._title;
    return data;
  }
}

class Score {
  int _score;

  Score({int score}) {
    this._score = score;
  }

  int get score => _score;
  set score(int score) => _score = score;

  Score.fromJson(Map<String, dynamic> json) {
    _score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this._score;
    return data;
  }
}

class Cashgift {
  int _price;

  Cashgift({int price}) {
    this._price = price;
  }

  int get price => _price;
  set price(int price) => _price = price;

  Cashgift.fromJson(Map<String, dynamic> json) {
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this._price;
    return data;
  }
}

class Promos {
  String _promo;
  String _price;

  Promos({String promo, String price}) {
    this._promo = promo;
    this._price = price;
  }

  String get promo => _promo;
  set promo(String promo) => _promo = promo;
  String get price => _price;
  set price(String price) => _price = price;

  Promos.fromJson(Map<String, dynamic> json) {
    _promo = json['promo'];
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promo'] = this._promo;
    data['price'] = this._price;
    return data;
  }
}

class Goods {
  int _id;
  Product _product;
  String _property;
  int _attachment;
  int _totalAmount;
  String _totalPrice;
  String _productPrice;
  bool _isReviewed;

  Goods(
      {int id,
        Product product,
        String property,
        int attachment,
        int totalAmount,
        String totalPrice,
        String productPrice,
        bool isReviewed}) {
    this._id = id;
    this._product = product;
    this._property = property;
    this._attachment = attachment;
    this._totalAmount = totalAmount;
    this._totalPrice = totalPrice;
    this._productPrice = productPrice;
    this._isReviewed = isReviewed;
  }

  int get id => _id;
  set id(int id) => _id = id;
  Product get product => _product;
  set product(Product product) => _product = product;
  String get property => _property;
  set property(String property) => _property = property;
  int get attachment => _attachment;
  set attachment(int attachment) => _attachment = attachment;
  int get totalAmount => _totalAmount;
  set totalAmount(int totalAmount) => _totalAmount = totalAmount;
  String get totalPrice => _totalPrice;
  set totalPrice(String totalPrice) => _totalPrice = totalPrice;
  String get productPrice => _productPrice;
  set productPrice(String productPrice) => _productPrice = productPrice;
  bool get isReviewed => _isReviewed;
  set isReviewed(bool isReviewed) => _isReviewed = isReviewed;

  Goods.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    _property = json['property'];
    _attachment = json['attachment'];
    _totalAmount = json['total_amount'];
    _totalPrice = json['total_price'];
    _productPrice = json['product_price'];
    _isReviewed = json['is_reviewed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._product != null) {
      data['product'] = this._product.toJson();
    }
    data['property'] = this._property;
    data['attachment'] = this._attachment;
    data['total_amount'] = this._totalAmount;
    data['total_price'] = this._totalPrice;
    data['product_price'] = this._productPrice;
    data['is_reviewed'] = this._isReviewed;
    return data;
  }
}

class Product {
  int _id;
  String _name;
  String _price;
  List<Photos> _photos;

  Product({int id, String name, String price, List<Photos> photos}) {
    this._id = id;
    this._name = name;
    this._price = price;
    this._photos = photos;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get price => _price;
  set price(String price) => _price = price;
  List<Photos> get photos => _photos;
  set photos(List<Photos> photos) => _photos = photos;

  Product.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
    if (json['photos'] != null) {
      _photos = new List<Photos>();
      json['photos'].forEach((v) {
        _photos.add(new Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['price'] = this._price;
    if (this._photos != null) {
      data['photos'] = this._photos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  int _width;
  int _height;
  String _thumb;
  String _large;

  Photos({int width, int height, String thumb, String large}) {
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

  Photos.fromJson(Map<String, dynamic> json) {
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
