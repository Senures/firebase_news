// To parse this JSON data, do
//
//     final randomUser = randomUserFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    NewsModel({
        this.status,
        this.totalResults,
        this.results,
        this.nextPage,
    });

    String? status;
    int? totalResults;
    List<Result>? results;
    int? nextPage;

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "nextPage": nextPage,
    };
}

class Result {
    Result({
        this.title,
        this.link,
        this.keywords,
        this.creator,
        this.videoUrl,
        this.description,
        this.content,
        this.pubDate,
        this.fullDescription,
        this.imageUrl,
        this.sourceId,
    });

    String? title;
    String? link;
    List<String>? keywords;
    List<String>? creator;
    dynamic? videoUrl;
    String? description;
    String? content;
    DateTime? pubDate;
    String? fullDescription;
    String? imageUrl;
    String? sourceId;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null ? null : List<String>.from(json["keywords"].map((x) => x)),
        creator: json["creator"] == null ? null : List<String>.from(json["creator"].map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"] == null ? null : json["description"],
        content: json["content"] == null ? null : json["content"],
        pubDate: DateTime.parse(json["pubDate"]),
        fullDescription: json["full_description"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        sourceId: json["source_id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "keywords": keywords == null ? null : List<dynamic>.from(keywords!.map((x) => x)),
        "creator": creator == null ? null : List<dynamic>.from(creator!.map((x) => x)),
        "video_url": videoUrl,
        "description": description == null ? null : description,
        "content": content == null ? null : content,
        "pubDate": pubDate!.toIso8601String(),
        "full_description": fullDescription,
        "image_url": imageUrl == null ? null : imageUrl,
        "source_id": sourceId,
    };
}