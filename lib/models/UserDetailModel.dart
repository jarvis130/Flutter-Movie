class UserDetailModel {
  User _user;
  List<Videos> _videos;
  Paged _paged;
  int _errorCode;

  UserDetailModel(
      {User user, List<Videos> videos, Paged paged, int errorCode}) {
    this._user = user;
    this._videos = videos;
    this._paged = paged;
    this._errorCode = errorCode;
  }

  User get user => _user;
  set user(User user) => _user = user;
  List<Videos> get videos => _videos;
  set videos(List<Videos> videos) => _videos = videos;
  Paged get paged => _paged;
  set paged(Paged paged) => _paged = paged;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['videos'] != null) {
      _videos = new List<Videos>();
      json['videos'].forEach((v) {
        _videos.add(new Videos.fromJson(v));
      });
    }
    _paged = json['paged'] != null ? new Paged.fromJson(json['paged']) : null;
    _errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._user != null) {
      data['user'] = this._user.toJson();
    }
    if (this._videos != null) {
      data['videos'] = this._videos.map((v) => v.toJson()).toList();
    }
    if (this._paged != null) {
      data['paged'] = this._paged.toJson();
    }
    data['error_code'] = this._errorCode;
    return data;
  }
}

class User {
  int _id;
  int _age;
  Rank _rank;
  int _gender;
  String _username;
  String _nickname;
  String _mobile;
  String _avatar;
  bool _mobileBinded;
  int _joinedAt;
  bool _isAuth;
  bool _isCompleted;
  int _isAttention;

  User(
      {int id,
        int age,
        Rank rank,
        int gender,
        String username,
        String nickname,
        String mobile,
        String avatar,
        bool mobileBinded,
        int joinedAt,
        bool isAuth,
        int isAttention,
        bool isCompleted}) {
    this._id = id;
    this._age = age;
    this._rank = rank;
    this._gender = gender;
    this._username = username;
    this._nickname = nickname;
    this._mobile = mobile;
    this._avatar = avatar;
    this._mobileBinded = mobileBinded;
    this._joinedAt = joinedAt;
    this._isAuth = isAuth;
    this._isAttention = isAttention;
    this._isCompleted = isCompleted;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get age => _age;
  set age(int age) => _age = age;
  Rank get rank => _rank;
  set rank(Rank rank) => _rank = rank;
  int get gender => _gender;
  set gender(int gender) => _gender = gender;
  String get username => _username;
  set username(String username) => _username = username;
  String get nickname => _nickname;
  set nickname(String nickname) => _nickname = nickname;
  String get mobile => _mobile;
  set mobile(String mobile) => _mobile = mobile;
  String get avatar => _avatar;
  set avatar(String avatar) => _avatar = avatar;
  bool get mobileBinded => _mobileBinded;
  set mobileBinded(bool mobileBinded) => _mobileBinded = mobileBinded;
  int get joinedAt => _joinedAt;
  set joinedAt(int joinedAt) => _joinedAt = joinedAt;
  bool get isAuth => _isAuth;
  set isAuth(bool isAuth) => _isAuth = isAuth;
  bool get isCompleted => _isCompleted;
  set isCompleted(bool isCompleted) => _isCompleted = isCompleted;
  int get isAttention => _isAttention;
  set isAttention(int isAttention) => _isAttention = isAttention;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _age = json['age'];
    _rank = json['rank'] != null ? new Rank.fromJson(json['rank']) : null;
    _gender = json['gender'];
    _username = json['username'];
    _nickname = json['nickname'];
    _mobile = json['mobile'];
    _avatar = json['avatar'];
    _mobileBinded = json['mobile_binded'];
    _joinedAt = json['joined_at'];
    _isAuth = json['is_auth'];
    _isCompleted = json['is_completed'];
    _isAttention = json['is_attention'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['age'] = this._age;
    if (this._rank != null) {
      data['rank'] = this._rank.toJson();
    }
    data['gender'] = this._gender;
    data['username'] = this._username;
    data['nickname'] = this._nickname;
    data['mobile'] = this._mobile;
    data['avatar'] = this._avatar;
    data['mobile_binded'] = this._mobileBinded;
    data['joined_at'] = this._joinedAt;
    data['is_auth'] = this._isAuth;
    data['is_completed'] = this._isCompleted;
    data['is_attention'] = this._isAttention;
    return data;
  }
}

class Rank {
  int _id;
  String _name;
  String _desc;
  int _scoreMin;
  int _scoreMax;

  Rank({int id, String name, String desc, int scoreMin, int scoreMax}) {
    this._id = id;
    this._name = name;
    this._desc = desc;
    this._scoreMin = scoreMin;
    this._scoreMax = scoreMax;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  int get scoreMin => _scoreMin;
  set scoreMin(int scoreMin) => _scoreMin = scoreMin;
  int get scoreMax => _scoreMax;
  set scoreMax(int scoreMax) => _scoreMax = scoreMax;

  Rank.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _desc = json['desc'];
    _scoreMin = json['score_min'];
    _scoreMax = json['score_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['desc'] = this._desc;
    data['score_min'] = this._scoreMin;
    data['score_max'] = this._scoreMax;
    return data;
  }
}

class Videos {
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
  int _userId;
  int _id;
  int _category;
  int _brand;
  int _shop;
  String _sku;
  DefaultPhoto _defaultPhoto;
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

  Videos(
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
        int userId,
        int id,
        int category,
        int brand,
        int shop,
        String sku,
        DefaultPhoto defaultPhoto,
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
        int updatedAt}) {
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
    this._userId = userId;
    this._id = id;
    this._category = category;
    this._brand = brand;
    this._shop = shop;
    this._sku = sku;
    this._defaultPhoto = defaultPhoto;
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
  int get userId => _userId;
  set userId(int userId) => _userId = userId;
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

  Videos.fromJson(Map<String, dynamic> json) {
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
    _userId = json['user_id'];
    _id = json['id'];
    _category = json['category'];
    _brand = json['brand'];
    _shop = json['shop'];
    _sku = json['sku'];
    _defaultPhoto = json['default_photo'] != null
        ? new DefaultPhoto.fromJson(json['default_photo'])
        : null;
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
    data['user_id'] = this._userId;
    data['id'] = this._id;
    data['category'] = this._category;
    data['brand'] = this._brand;
    data['shop'] = this._shop;
    data['sku'] = this._sku;
    if (this._defaultPhoto != null) {
      data['default_photo'] = this._defaultPhoto.toJson();
    }
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
