// To parse this JSON data, do
//
//     final TvShow = tvShowFromJson(jsonString);

import 'dart:convert';

TvShow tvShowFromJson(String str) => TvShow.fromJson(json.decode(str));

String tvShowToJson(TvShow data) => json.encode(data.toJson());

class TvShow {
  TvShow({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
    this.embedded,
  });

  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  String? status;
  int? runtime;
  int? averageRuntime;
  DateTime? premiered;
  DateTime? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  Externals? externals;
  Image? image;
  String? summary;
  int? updated;
  Links? links;
  Embedded? embedded;

  String get title => name ?? 'undefined';

  TvShow copyWith({
    int? id,
    String? url,
    String? name,
    String? type,
    String? language,
    List<String>? genres,
    String? status,
    int? runtime,
    int? averageRuntime,
    DateTime? premiered,
    DateTime? ended,
    String? officialSite,
    Schedule? schedule,
    Rating? rating,
    int? weight,
    Network? network,
    Externals? externals,
    Image? image,
    String? summary,
    int? updated,
    Links? links,
  }) =>
      TvShow(
        id: id ?? this.id,
        url: url ?? this.url,
        name: name ?? this.name,
        type: type ?? this.type,
        language: language ?? this.language,
        genres: genres ?? this.genres,
        status: status ?? this.status,
        runtime: runtime ?? this.runtime,
        averageRuntime: averageRuntime ?? this.averageRuntime,
        premiered: premiered ?? this.premiered,
        ended: ended ?? this.ended,
        officialSite: officialSite ?? this.officialSite,
        schedule: schedule ?? this.schedule,
        rating: rating ?? this.rating,
        weight: weight ?? this.weight,
        network: network ?? this.network,
        externals: externals ?? this.externals,
        image: image ?? this.image,
        summary: summary ?? this.summary,
        updated: updated ?? this.updated,
        links: links ?? this.links,
      );

  factory TvShow.fromJson(Map<String, dynamic> json) => TvShow(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        language: json["language"] == null ? null : json["language"],
        genres: json["genres"] == null
            ? null
            : List<String>.from(json["genres"].map((x) => x)),
        status: json["status"] == null ? null : json["status"],
        runtime: json["runtime"] == null ? null : json["runtime"],
        averageRuntime:
            json["averageRuntime"] == null ? null : json["averageRuntime"],
        premiered: json["premiered"] == null
            ? null
            : DateTime.parse(json["premiered"]),
        ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
        officialSite:
            json["officialSite"] == null ? null : json["officialSite"],
        schedule: json["schedule"] == null
            ? null
            : Schedule.fromJson(json["schedule"]),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        weight: json["weight"] == null ? null : json["weight"],
        network:
            json["network"] == null ? null : Network.fromJson(json["network"]),
        externals: json["externals"] == null
            ? null
            : Externals.fromJson(json["externals"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        summary: json["summary"] == null ? null : json["summary"],
        updated: json["updated"] == null ? null : json["updated"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "language": language == null ? null : language,
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres?.map((x) => x) ?? []),
        "status": status == null ? null : status,
        "runtime": runtime == null ? null : runtime,
        "averageRuntime": averageRuntime == null ? null : averageRuntime,
        "premiered": premiered == null
            ? null
            : "${premiered?.year.toString().padLeft(4, '0')}-${premiered?.month.toString().padLeft(2, '0')}-${premiered?.day.toString().padLeft(2, '0')}",
        "ended": ended == null
            ? null
            : "${ended?.year.toString().padLeft(4, '0')}-${ended?.month.toString().padLeft(2, '0')}-${ended?.day.toString().padLeft(2, '0')}",
        "officialSite": officialSite == null ? null : officialSite,
        "schedule": schedule == null ? null : schedule?.toJson(),
        "rating": rating == null ? null : rating?.toJson(),
        "weight": weight == null ? null : weight,
        "network": network == null ? null : network?.toJson(),
        "externals": externals == null ? null : externals?.toJson(),
        "image": image == null ? null : image?.toJson(),
        "summary": summary == null ? null : summary,
        "updated": updated == null ? null : updated,
        "_links": links == null ? null : links?.toJson(),
      };
}

class Embedded {
  Embedded({
    this.episodes,
  });

  List<Episode>? episodes;

  Embedded copyWith({
    List<Episode>? episodes,
  }) =>
      Embedded(
        episodes: episodes ?? this.episodes,
      );

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
        episodes: json["episodes"] == null
            ? null
            : List<Episode>.from(
                json["episodes"].map((x) => Episode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "episodes": episodes == null
            ? null
            : List<dynamic>.from(episodes!.map((x) => x.toJson())),
      };
}

class Episode {
  Episode({
    this.id,
    this.url,
    this.name,
    this.season,
    this.number,
    this.type,
    this.airdate,
    this.airtime,
    this.airstamp,
    this.runtime,
    this.rating,
    this.image,
    this.summary,
    this.links,
  });

  int? id;
  String? url;
  String? name;
  int? season;
  int? number;
  String? type;
  DateTime? airdate;
  String? airtime;
  DateTime? airstamp;
  int? runtime;
  Rating? rating;
  Image? image;
  String? summary;
  EpisodeLinks? links;

  Episode copyWith({
    int? id,
    String? url,
    String? name,
    int? season,
    int? number,
    String? type,
    DateTime? airdate,
    String? airtime,
    DateTime? airstamp,
    int? runtime,
    Rating? rating,
    Image? image,
    String? summary,
    EpisodeLinks? links,
  }) =>
      Episode(
        id: id ?? this.id,
        url: url ?? this.url,
        name: name ?? this.name,
        season: season ?? this.season,
        number: number ?? this.number,
        type: type ?? this.type,
        airdate: airdate ?? this.airdate,
        airtime: airtime ?? this.airtime,
        airstamp: airstamp ?? this.airstamp,
        runtime: runtime ?? this.runtime,
        rating: rating ?? this.rating,
        image: image ?? this.image,
        summary: summary ?? this.summary,
        links: links ?? this.links,
      );

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        name: json["name"] == null ? null : json["name"],
        season: json["season"] == null ? null : json["season"],
        number: json["number"] == null ? null : json["number"],
        type: json["type"] == null ? null : json["type"],
        airdate:
            json["airdate"] == null ? null : DateTime.parse(json["airdate"]),
        airtime:
            json["airtime"] == null ? null : json["airtime"],
        airstamp:
            json["airstamp"] == null ? null : DateTime.parse(json["airstamp"]),
        runtime: json["runtime"] == null ? null : json["runtime"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        summary: json["summary"] == null ? null : json["summary"],
        links: json["_links"] == null
            ? null
            : EpisodeLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "name": name == null ? null : name,
        "season": season == null ? null : season,
        "number": number == null ? null : number,
        "type": type == null ? null : type,
        "airdate": airdate == null
            ? null
            : "${airdate!.year.toString().padLeft(4, '0')}-${airdate!.month.toString().padLeft(2, '0')}-${airdate!.day.toString().padLeft(2, '0')}",
        "airtime": airtime == null ? null : airtime,
        "airstamp": airstamp == null ? null : airstamp!.toIso8601String(),
        "runtime": runtime == null ? null : runtime,
        "rating": rating == null ? null : rating!.toJson(),
        "image": image == null ? null : image!.toJson(),
        "summary": summary == null ? null : summary,
        "_links": links == null ? null : links!.toJson(),
      };
}

class Externals {
  Externals({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  int? tvrage;
  int? thetvdb;
  String? imdb;

  Externals copyWith({
    int? tvrage,
    int? thetvdb,
    String? imdb,
  }) =>
      Externals(
        tvrage: tvrage ?? this.tvrage,
        thetvdb: thetvdb ?? this.thetvdb,
        imdb: imdb ?? this.imdb,
      );

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"] == null ? null : json["tvrage"],
        thetvdb: json["thetvdb"] == null ? null : json["thetvdb"],
        imdb: json["imdb"] == null ? null : json["imdb"],
      );

  Map<String, dynamic> toJson() => {
        "tvrage": tvrage == null ? null : tvrage,
        "thetvdb": thetvdb == null ? null : thetvdb,
        "imdb": imdb == null ? null : imdb,
      };
}

class Image {
  Image({
    this.medium,
    this.original,
  });

  String? medium;
  String? original;

  Image copyWith({
    String? medium,
    String? original,
  }) =>
      Image(
        medium: medium ?? this.medium,
        original: original ?? this.original,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"] == null ? null : json["medium"],
        original: json["original"] == null ? null : json["original"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium == null ? null : medium,
        "original": original == null ? null : original,
      };
}

class Links {
  Links({
    this.self,
    this.previousepisode,
  });

  Previousepisode? self;
  Previousepisode? previousepisode;

  Links copyWith({
    Previousepisode? self,
    Previousepisode? previousepisode,
  }) =>
      Links(
        self: self ?? this.self,
        previousepisode: previousepisode ?? this.previousepisode,
      );

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null
            ? null
            : Previousepisode.fromJson(json["self"]),
        previousepisode: json["previousepisode"] == null
            ? null
            : Previousepisode.fromJson(json["previousepisode"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null ? null : self?.toJson(),
        "previousepisode":
            previousepisode == null ? null : previousepisode?.toJson(),
      };
}

class Previousepisode {
  Previousepisode({
    this.href,
  });

  String? href;

  Previousepisode copyWith({
    String? href,
  }) =>
      Previousepisode(
        href: href ?? this.href,
      );

  factory Previousepisode.fromJson(Map<String, dynamic> json) =>
      Previousepisode(
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
      };
}

class Network {
  Network({
    this.id,
    this.name,
    this.country,
  });

  int? id;
  String? name;
  Country? country;

  Network copyWith({
    int? id,
    String? name,
    Country? country,
  }) =>
      Network(
        id: id ?? this.id,
        name: name ?? this.name,
        country: country ?? this.country,
      );

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "country": country == null ? null : country?.toJson(),
      };
}

class Country {
  Country({
    this.name,
    this.code,
    this.timezone,
  });

  String? name;
  String? code;
  String? timezone;

  Country copyWith({
    String? name,
    String? code,
    String? timezone,
  }) =>
      Country(
        name: name ?? this.name,
        code: code ?? this.code,
        timezone: timezone ?? this.timezone,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] == null ? null : json["name"],
        code: json["code"] == null ? null : json["code"],
        timezone: json["timezone"] == null ? null : json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "code": code == null ? null : code,
        "timezone": timezone == null ? null : timezone,
      };
}

class Rating {
  Rating({
    this.average,
  });

  double? average;

  Rating copyWith({
    double? average,
  }) =>
      Rating(
        average: average ?? this.average,
      );

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"] == null ? null : json["average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "average": average == null ? null : average,
      };
}

class Schedule {
  Schedule({
    this.time,
    this.days,
  });

  String? time;
  List<String>? days;

  Schedule copyWith({
    String? time,
    List<String>? days,
  }) =>
      Schedule(
        time: time ?? this.time,
        days: days ?? this.days,
      );

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json["time"] == null ? null : json["time"],
        days: json["days"] == null
            ? null
            : List<String>.from(json["days"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "time": time == null ? null : time,
        "days":
            days == null ? null : List<dynamic>.from(days?.map((x) => x) ?? []),
      };
}

class EpisodeLinks {
    EpisodeLinks({
        this.self,
    });

    Previousepisode? self;

    EpisodeLinks copyWith({
        Previousepisode? self,
    }) => 
        EpisodeLinks(
            self: self ?? this.self,
        );

    factory EpisodeLinks.fromJson(Map<String, dynamic> json) => EpisodeLinks(
        self: Previousepisode.fromJson(json["self"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self!.toJson(),
    };
}
