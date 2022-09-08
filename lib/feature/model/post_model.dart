// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Parent1 {
  String? kind;
  Data1? data;

  Parent1({this.kind, this.data});

  Parent1.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null ? Data1.fromJson(json['data']) : null;
  }
}

class Data1 {
  dynamic after;
  int? dist;
  String? modhash;
  String? geoFilter;
  List<PostModel>? children;
  String? before;

  Data1({this.after, this.dist, this.modhash, this.geoFilter, this.children, this.before});

  Data1.fromJson(Map<String, dynamic> json) {
    after = json['after'];
    dist = json['dist'];
    modhash = json['modhash'];
    geoFilter = json['geo_filter'];
    if (json['children'] != null) {
      children = <PostModel>[];
      json['children'].forEach((v) {
        children!.add(PostModel.fromJson(v));
      });
    }
    before = json['before'];
  }
}

class PostModel {
  String? kind;
  Data? data;

  PostModel({this.kind, this.data});

  PostModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null ? Data.fromMap(json['data']) : null;
  }
}

class Data {
  String? title;
  int? thumbnailHeight;
  int? thumbnailWidth;
  String? thumbnail;
  String? selftext;
  Data({
    this.title,
    this.thumbnailHeight,
    this.thumbnailWidth,
    this.thumbnail,
    this.selftext,
  });

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      title: map['title'] != null ? map['title'] as String : null,
      thumbnailHeight: map['thumbnailHeight'] != null ? map['thumbnailHeight'] as int : null,
      thumbnailWidth: map['thumbnailWidth'] != null ? map['thumbnailWidth'] as int : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      selftext: map['selftext'] != null ? map['selftext'] as String : null,
    );
  }
}
