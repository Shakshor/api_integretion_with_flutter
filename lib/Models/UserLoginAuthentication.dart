/// items : [{"user_id":5013,"user_name":"TALHA","user_full_name":"Abu Talha","active_status":"Y","unit_dept_no":null}]
/// hasMore : false
/// limit : 25
/// offset : 0
/// count : 1
/// links : [{"rel":"self","href":"http://118.179.223.20:7002/ords/xact_erp/user/check?USER_NAME=TALHA&USER_PASSWORD=1540"},{"rel":"describedby","href":"http://118.179.223.20:7002/ords/xact_erp/metadata-catalog/user/item"},{"rel":"first","href":"http://118.179.223.20:7002/ords/xact_erp/user/check?USER_NAME=TALHA&USER_PASSWORD=1540"}]

class UserLoginAuthentication {
  UserLoginAuthentication({
      List<Items>? items, 
      bool? hasMore, 
      num? limit, 
      num? offset, 
      num? count, 
      List<Links>? links,}){
    _items = items;
    _hasMore = hasMore;
    _limit = limit;
    _offset = offset;
    _count = count;
    _links = links;
}

  UserLoginAuthentication.fromJson(dynamic json) {
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _hasMore = json['hasMore'];
    _limit = json['limit'];
    _offset = json['offset'];
    _count = json['count'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
  }
  List<Items>? _items;
  bool? _hasMore;
  num? _limit;
  num? _offset;
  num? _count;
  List<Links>? _links;
UserLoginAuthentication copyWith({  List<Items>? items,
  bool? hasMore,
  num? limit,
  num? offset,
  num? count,
  List<Links>? links,
}) => UserLoginAuthentication(  items: items ?? _items,
  hasMore: hasMore ?? _hasMore,
  limit: limit ?? _limit,
  offset: offset ?? _offset,
  count: count ?? _count,
  links: links ?? _links,
);
  List<Items>? get items => _items;
  bool? get hasMore => _hasMore;
  num? get limit => _limit;
  num? get offset => _offset;
  num? get count => _count;
  List<Links>? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['hasMore'] = _hasMore;
    map['limit'] = _limit;
    map['offset'] = _offset;
    map['count'] = _count;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// rel : "self"
/// href : "http://118.179.223.20:7002/ords/xact_erp/user/check?USER_NAME=TALHA&USER_PASSWORD=1540"

class Links {
  Links({
      String? rel, 
      String? href,}){
    _rel = rel;
    _href = href;
}

  Links.fromJson(dynamic json) {
    _rel = json['rel'];
    _href = json['href'];
  }
  String? _rel;
  String? _href;
Links copyWith({  String? rel,
  String? href,
}) => Links(  rel: rel ?? _rel,
  href: href ?? _href,
);
  String? get rel => _rel;
  String? get href => _href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rel'] = _rel;
    map['href'] = _href;
    return map;
  }

}

/// user_id : 5013
/// user_name : "TALHA"
/// user_full_name : "Abu Talha"
/// active_status : "Y"
/// unit_dept_no : null

class Items {
  Items({
      num? userId, 
      String? userName, 
      String? userFullName, 
      String? activeStatus, 
      dynamic unitDeptNo,}){
    _userId = userId;
    _userName = userName;
    _userFullName = userFullName;
    _activeStatus = activeStatus;
    _unitDeptNo = unitDeptNo;
}

  Items.fromJson(dynamic json) {
    _userId = json['user_id'];
    _userName = json['user_name'];
    _userFullName = json['user_full_name'];
    _activeStatus = json['active_status'];
    _unitDeptNo = json['unit_dept_no'];
  }
  num? _userId;
  String? _userName;
  String? _userFullName;
  String? _activeStatus;
  dynamic _unitDeptNo;
Items copyWith({  num? userId,
  String? userName,
  String? userFullName,
  String? activeStatus,
  dynamic unitDeptNo,
}) => Items(  userId: userId ?? _userId,
  userName: userName ?? _userName,
  userFullName: userFullName ?? _userFullName,
  activeStatus: activeStatus ?? _activeStatus,
  unitDeptNo: unitDeptNo ?? _unitDeptNo,
);
  num? get userId => _userId;
  String? get userName => _userName;
  String? get userFullName => _userFullName;
  String? get activeStatus => _activeStatus;
  dynamic get unitDeptNo => _unitDeptNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['user_name'] = _userName;
    map['user_full_name'] = _userFullName;
    map['active_status'] = _activeStatus;
    map['unit_dept_no'] = _unitDeptNo;
    return map;
  }

}