// To parse this JSON data, do
//
//     final episodes = episodesFromJson(jsonString);

import 'dart:convert';

Episodes episodesFromJson(String str) => Episodes.fromJson(json.decode(str));

String episodesToJson(Episodes data) => json.encode(data.toJson());

class Episodes {
  Info? info;
  List<EpisodesResult>? results;

  Episodes({
    this.info,
    this.results,
  });

  factory Episodes.fromJson(Map<String, dynamic> json) => Episodes(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        results: json["results"] == null
            ? []
            : List<EpisodesResult>.from(
                json["results"]!.map((x) => EpisodesResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Info {
  int? count;
  int? pages;
  String? next;
  dynamic prev;

  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

class EpisodesResult {
  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? characters;
  String? url;
  DateTime? created;

  EpisodesResult({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  factory EpisodesResult.fromJson(Map<String, dynamic> json) => EpisodesResult(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: json["characters"] == null
            ? []
            : List<String>.from(json["characters"]!.map((x) => x)),
        url: json["url"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": characters == null
            ? []
            : List<dynamic>.from(characters!.map((x) => x)),
        "url": url,
        "created": created?.toIso8601String(),
      };
}
