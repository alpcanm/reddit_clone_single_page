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

class Parent2 {
  String? kind;
  PostModel? data;

  Parent2({this.kind, this.data});

  Parent2.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null ? PostModel.fromJson(json['data']) : null;
  }
}

class Data1 {
  dynamic after;
  int? dist;
  String? modhash;
  String? geoFilter;
  List<Parent1>? children;
  String? before;

  Data1({this.after, this.dist, this.modhash, this.geoFilter, this.children, this.before});

  Data1.fromJson(Map<String, dynamic> json) {
    after = json['after'];
    dist = json['dist'];
    modhash = json['modhash'];
    geoFilter = json['geo_filter'];
    if (json['children'] != null) {
      children = <Parent1>[];
      json['children'].forEach((v) {
        children!.add(Parent1.fromJson(v));
      });
    }
    before = json['before'];
  }
}

class PostModel {
  String? title;
  int? thumbnailHeight;
  int? thumbnailWidth;
  String? thumbnail;
  String? selftext;
  PostModel({
    this.title,
    this.thumbnailHeight,
    this.thumbnailWidth,
    this.thumbnail,
    this.selftext,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'thumbnailHeight': thumbnailHeight,
      'thumbnailWidth': thumbnailWidth,
      'thumbnail': thumbnail,
      'selftext': selftext,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      title: map['title'] != null ? map['title'] as String : null,
      thumbnailHeight: map['thumbnailHeight'] != null ? map['thumbnailHeight'] as int : null,
      thumbnailWidth: map['thumbnailWidth'] != null ? map['thumbnailWidth'] as int : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      selftext: map['selftext'] != null ? map['selftext'] as String : null,
    );
  }

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
