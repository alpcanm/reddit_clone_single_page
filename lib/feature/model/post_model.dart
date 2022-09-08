// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

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

class PostModel extends Equatable {
  late String kind;
  late Data data;

  PostModel({
    required this.kind,
    required this.data,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = Data.fromMap(json['data']);
  }

  @override
  List<Object> get props => [kind, data];
}

class Data extends Equatable {
  final String title;
  final int thumbnailHeight;
  final int thumbnailWidth;
  final String thumbnail;
  final String selftext;

  const Data({
    required this.title,
    required this.thumbnailHeight,
    required this.thumbnailWidth,
    required this.thumbnail,
    required this.selftext,
  });

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      title: map['title'] != null ? map['title'] as String : "",
      thumbnailHeight: map['thumbnailHeight'] != null ? map['thumbnailHeight'] as int : 0,
      thumbnailWidth: map['thumbnailWidth'] != null ? map['thumbnailWidth'] as int : 0,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : "",
      selftext: map['selftext'] != null ? map['selftext'] as String : "",
    );
  }

  @override
  List<Object> get props {
    return [
      title,
      thumbnailHeight,
      thumbnailWidth,
      thumbnail,
      selftext,
    ];
  }
}
