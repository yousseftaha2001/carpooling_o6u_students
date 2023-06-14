class GetLocationModel {
  GetLocationModel({
      this.htmlAttributions, 
      this.result, 
      this.status,});

  GetLocationModel.fromJson(dynamic json) {
    // if (json['html_attributions'] != null) {
    //   htmlAttributions = [];
    //   json['html_attributions'].forEach((v) {
    //     htmlAttributions?.add(Dynamic.fromJson(v));
    //   });
    // }
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
  }
  List<dynamic>? htmlAttributions;
  Result? result;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (htmlAttributions != null) {
      map['html_attributions'] = htmlAttributions?.map((v) => v.toJson()).toList();
    }
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['status'] = status;
    return map;
  }

}

class Result {
  Result({
      this.addressComponents, 
      this.adrAddress, 
      this.businessStatus, 
      this.currentOpeningHours, 
      this.formattedAddress, 
      this.formattedPhoneNumber, 
      this.geometry, 
      this.icon, 
      this.iconBackgroundColor, 
      this.iconMaskBaseUri, 
      this.internationalPhoneNumber, 
      this.name, 
      this.openingHours, 
      this.photos, 
      this.placeId, 
      this.plusCode, 
      this.rating, 
      this.reference, 
      this.reviews, 
      this.types, 
      this.url, 
      this.userRatingsTotal, 
      this.utcOffset, 
      this.vicinity, 
      this.website, 
      this.wheelchairAccessibleEntrance,});

  Result.fromJson(dynamic json) {
    if (json['address_components'] != null) {
      addressComponents = [];
      json['address_components'].forEach((v) {
        addressComponents?.add(AddressComponents.fromJson(v));
      });
    }
    adrAddress = json['adr_address'];
    businessStatus = json['business_status'];
    currentOpeningHours = json['current_opening_hours'] != null ? CurrentOpeningHours.fromJson(json['current_opening_hours']) : null;
    formattedAddress = json['formatted_address'];
    formattedPhoneNumber = json['formatted_phone_number'];
    geometry = json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    icon = json['icon'];
    iconBackgroundColor = json['icon_background_color'];
    iconMaskBaseUri = json['icon_mask_base_uri'];
    internationalPhoneNumber = json['international_phone_number'];
    name = json['name'];
    openingHours = json['opening_hours'] != null ? OpeningHours.fromJson(json['opening_hours']) : null;
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    placeId = json['place_id'];
    plusCode = json['plus_code'] != null ? PlusCode.fromJson(json['plus_code']) : null;
    rating = json['rating'];
    reference = json['reference'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
    types = json['types'] != null ? json['types'].cast<String>() : [];
    url = json['url'];
    userRatingsTotal = json['user_ratings_total'];
    utcOffset = json['utc_offset'];
    vicinity = json['vicinity'];
    website = json['website'];
    wheelchairAccessibleEntrance = json['wheelchair_accessible_entrance'];
  }
  List<AddressComponents>? addressComponents;
  String? adrAddress;
  String? businessStatus;
  CurrentOpeningHours? currentOpeningHours;
  String? formattedAddress;
  String? formattedPhoneNumber;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? internationalPhoneNumber;
  String? name;
  OpeningHours? openingHours;
  List<Photos>? photos;
  String? placeId;
  PlusCode? plusCode;
  num? rating;
  String? reference;
  List<Reviews>? reviews;
  List<String>? types;
  String? url;
  num? userRatingsTotal;
  num? utcOffset;
  String? vicinity;
  String? website;
  bool? wheelchairAccessibleEntrance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (addressComponents != null) {
      map['address_components'] = addressComponents?.map((v) => v.toJson()).toList();
    }
    map['adr_address'] = adrAddress;
    map['business_status'] = businessStatus;
    if (currentOpeningHours != null) {
      map['current_opening_hours'] = currentOpeningHours?.toJson();
    }
    map['formatted_address'] = formattedAddress;
    map['formatted_phone_number'] = formattedPhoneNumber;
    if (geometry != null) {
      map['geometry'] = geometry?.toJson();
    }
    map['icon'] = icon;
    map['icon_background_color'] = iconBackgroundColor;
    map['icon_mask_base_uri'] = iconMaskBaseUri;
    map['international_phone_number'] = internationalPhoneNumber;
    map['name'] = name;
    if (openingHours != null) {
      map['opening_hours'] = openingHours?.toJson();
    }
    if (photos != null) {
      map['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    map['place_id'] = placeId;
    if (plusCode != null) {
      map['plus_code'] = plusCode?.toJson();
    }
    map['rating'] = rating;
    map['reference'] = reference;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    map['types'] = types;
    map['url'] = url;
    map['user_ratings_total'] = userRatingsTotal;
    map['utc_offset'] = utcOffset;
    map['vicinity'] = vicinity;
    map['website'] = website;
    map['wheelchair_accessible_entrance'] = wheelchairAccessibleEntrance;
    return map;
  }

}

class Reviews {
  Reviews({
      this.authorName, 
      this.authorUrl, 
      this.language, 
      this.originalLanguage, 
      this.profilePhotoUrl, 
      this.rating, 
      this.relativeTimeDescription, 
      this.text, 
      this.time, 
      this.translated,});

  Reviews.fromJson(dynamic json) {
    authorName = json['author_name'];
    authorUrl = json['author_url'];
    language = json['language'];
    originalLanguage = json['original_language'];
    profilePhotoUrl = json['profile_photo_url'];
    rating = json['rating'];
    relativeTimeDescription = json['relative_time_description'];
    text = json['text'];
    time = json['time'];
    translated = json['translated'];
  }
  String? authorName;
  String? authorUrl;
  String? language;
  String? originalLanguage;
  String? profilePhotoUrl;
  num? rating;
  String? relativeTimeDescription;
  String? text;
  num? time;
  bool? translated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author_name'] = authorName;
    map['author_url'] = authorUrl;
    map['language'] = language;
    map['original_language'] = originalLanguage;
    map['profile_photo_url'] = profilePhotoUrl;
    map['rating'] = rating;
    map['relative_time_description'] = relativeTimeDescription;
    map['text'] = text;
    map['time'] = time;
    map['translated'] = translated;
    return map;
  }

}

class PlusCode {
  PlusCode({
      this.compoundCode, 
      this.globalCode,});

  PlusCode.fromJson(dynamic json) {
    compoundCode = json['compound_code'];
    globalCode = json['global_code'];
  }
  String? compoundCode;
  String? globalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['compound_code'] = compoundCode;
    map['global_code'] = globalCode;
    return map;
  }

}

class Photos {
  Photos({
      this.height, 
      this.htmlAttributions, 
      this.photoReference, 
      this.width,});

  Photos.fromJson(dynamic json) {
    height = json['height'];
    htmlAttributions = json['html_attributions'] != null ? json['html_attributions'].cast<String>() : [];
    photoReference = json['photo_reference'];
    width = json['width'];
  }
  num? height;
  List<String>? htmlAttributions;
  String? photoReference;
  num? width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = height;
    map['html_attributions'] = htmlAttributions;
    map['photo_reference'] = photoReference;
    map['width'] = width;
    return map;
  }

}

class OpeningHours {
  OpeningHours({
      this.openNow, 
      this.periods, 
      this.weekdayText,});

  OpeningHours.fromJson(dynamic json) {
    openNow = json['open_now'];
    if (json['periods'] != null) {
      periods = [];
      json['periods'].forEach((v) {
        periods?.add(Periods.fromJson(v));
      });
    }
    weekdayText = json['weekday_text'] != null ? json['weekday_text'].cast<String>() : [];
  }
  bool? openNow;
  List<Periods>? periods;
  List<String>? weekdayText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['open_now'] = openNow;
    if (periods != null) {
      map['periods'] = periods?.map((v) => v.toJson()).toList();
    }
    map['weekday_text'] = weekdayText;
    return map;
  }

}

class Periods {
  Periods({
      this.close, 
      this.open,});

  Periods.fromJson(dynamic json) {
    close = json['close'] != null ? Close.fromJson(json['close']) : null;
    open = json['open'] != null ? Open.fromJson(json['open']) : null;
  }
  Close? close;
  Open? open;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (close != null) {
      map['close'] = close?.toJson();
    }
    if (open != null) {
      map['open'] = open?.toJson();
    }
    return map;
  }

}

class Open {
  Open({
      this.day, 
      this.time,});

  Open.fromJson(dynamic json) {
    day = json['day'];
    time = json['time'];
  }
  num? day;
  String? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['time'] = time;
    return map;
  }

}

class Close {
  Close({
      this.day, 
      this.time,});

  Close.fromJson(dynamic json) {
    day = json['day'];
    time = json['time'];
  }
  num? day;
  String? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['time'] = time;
    return map;
  }

}

class Geometry {
  Geometry({
      this.location, 
      this.viewport,});

  Geometry.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    viewport = json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null;
  }
  Location? location;
  Viewport? viewport;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (viewport != null) {
      map['viewport'] = viewport?.toJson();
    }
    return map;
  }

}

class Viewport {
  Viewport({
      this.northeast, 
      this.southwest,});

  Viewport.fromJson(dynamic json) {
    northeast = json['northeast'] != null ? Northeast.fromJson(json['northeast']) : null;
    southwest = json['southwest'] != null ? Southwest.fromJson(json['southwest']) : null;
  }
  Northeast? northeast;
  Southwest? southwest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (northeast != null) {
      map['northeast'] = northeast?.toJson();
    }
    if (southwest != null) {
      map['southwest'] = southwest?.toJson();
    }
    return map;
  }

}

class Southwest {
  Southwest({
      this.lat, 
      this.lng,});

  Southwest.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

class Northeast {
  Northeast({
      this.lat, 
      this.lng,});

  Northeast.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

class Location {
  Location({
      this.lat, 
      this.lng,});

  Location.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  double? lat;
  double? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

class CurrentOpeningHours {
  CurrentOpeningHours({
      this.openNow, 
      this.periods, 
      this.weekdayText,});

  CurrentOpeningHours.fromJson(dynamic json) {
    openNow = json['open_now'];
    if (json['periods'] != null) {
      periods = [];
      json['periods'].forEach((v) {
        periods?.add(Periods.fromJson(v));
      });
    }
    weekdayText = json['weekday_text'] != null ? json['weekday_text'].cast<String>() : [];
  }
  bool? openNow;
  List<Periods>? periods;
  List<String>? weekdayText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['open_now'] = openNow;
    if (periods != null) {
      map['periods'] = periods?.map((v) => v.toJson()).toList();
    }
    map['weekday_text'] = weekdayText;
    return map;
  }

}



class AddressComponents {
  AddressComponents({
      this.longName, 
      this.shortName, 
      this.types,});

  AddressComponents.fromJson(dynamic json) {
    longName = json['long_name'];
    shortName = json['short_name'];
    types = json['types'] != null ? json['types'].cast<String>() : [];
  }
  String? longName;
  String? shortName;
  List<String>? types;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['long_name'] = longName;
    map['short_name'] = shortName;
    map['types'] = types;
    return map;
  }

}