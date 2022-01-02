// To parse this JSON data, do
//
//     final astroDetails = astroDetailsFromJson(jsonString);

import 'dart:convert';

AstroDetails astroDetailsFromJson(String str) =>
    AstroDetails.fromJson(json.decode(str));

String astroDetailsToJson(AstroDetails data) => json.encode(data.toJson());

class AstroDetails {
  AstroDetails({
    this.data,
  });

  List<Datum> data;

  factory AstroDetails.fromJson(Map<String, dynamic> json) => AstroDetails(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.urlSlug,
    this.namePrefix,
    this.firstName,
    this.lastName,
    this.aboutMe,
    this.profliePicUrl,
    this.experience,
    this.languages,
    this.minimumCallDuration,
    this.minimumCallDurationCharges,
    this.additionalPerMinuteCharges,
    this.isAvailable,
    this.rating,
    this.skills,
    this.isOnCall,
    this.freeMinutes,
    this.additionalMinute,
    this.images,
    this.mediumImage,
  });

  int id;
  String urlSlug;
  dynamic namePrefix;
  String firstName;
  String lastName;
  String aboutMe;
  dynamic profliePicUrl;
  double experience;
  List<Language> languages;
  String minimumCallDuration;
  String minimumCallDurationCharges;
  String additionalPerMinuteCharges;
  bool isAvailable;
  dynamic rating;
  List<Skill> skills;
  bool isOnCall;
  String freeMinutes;
  String additionalMinute;
  Images images;
  String mediumImage;
  // Availability availability;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        urlSlug: json["urlSlug"],
        namePrefix: json["namePrefix"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        aboutMe: json["aboutMe"],
        profliePicUrl: json["profliePicUrl"],
        experience: json["experience"],
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        minimumCallDuration: json["minimumCallDuration"].toString(),
        minimumCallDurationCharges:
            json["minimumCallDurationCharges"].toString(),
        additionalPerMinuteCharges:
            json["additionalPerMinuteCharges"].toString(),
        isAvailable: json["isAvailable"],
        rating: json["rating"],
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        isOnCall: json["isOnCall"],
        freeMinutes: json["freeMinutes"].toString(),
        additionalMinute: json["additionalMinute"].toString(),
        images: Images.fromJson(json["images"]),
        // availability: Availability.fromJson(json["availability"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urlSlug": urlSlug,
        "namePrefix": namePrefix,
        "firstName": firstName,
        "lastName": lastName,
        "aboutMe": aboutMe,
        "profliePicUrl": profliePicUrl,
        "experience": experience,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "minimumCallDuration": minimumCallDuration,
        "minimumCallDurationCharges": minimumCallDurationCharges,
        "additionalPerMinuteCharges": additionalPerMinuteCharges,
        "isAvailable": isAvailable,
        "rating": rating,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "isOnCall": isOnCall,
        "freeMinutes": freeMinutes,
        "additionalMinute": additionalMinute,
        "images": images.toJson(),
        // "availability": availability.toJson(),
      };
}

// class Availability {
//   Availability({
//     this.days,
//     this.slot,
//   });

//   List<String> days;
//   Slot slot;

//   factory Availability.fromJson(Map<String, dynamic> json) => Availability(
//         days: List<String>.from(json["days"].map((x) => x)),
//         slot: Slot.fromJson(json["slot"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "days": List<dynamic>.from(days.map((x) => x)),
//         "slot": slot.toJson(),
//       };
// }

class Slot {
  Slot({
    this.toFormat,
    this.fromFormat,
    this.from,
    this.to,
  });

  String toFormat;
  String fromFormat;
  String from;
  String to;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        toFormat: json["toFormat"],
        fromFormat: json["fromFormat"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "toFormat": toFormat,
        "fromFormat": fromFormat,
        "from": from,
        "to": to,
      };
}

class Images {
  Images({
    this.small,
    this.large,
    this.medium,
  });

  Large small;
  Large large;
  Large medium;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: Large.fromJson(json["small"]),
        large: Large.fromJson(json["large"]),
        medium: Large.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "small": small.toJson(),
        "large": large.toJson(),
        "medium": medium.toJson(),
      };
}

class Large {
  Large({
    this.imageUrl,
    this.id,
  });

  String imageUrl;
  int id;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl == null ? null : imageUrl,
        "id": id == null ? null : id,
      };
}

class Language {
  Language({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Skill {
  Skill({
    this.id,
    this.name,
    this.description,
  });

  int id;
  String name;
  String description;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
