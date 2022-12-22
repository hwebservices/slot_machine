// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Users {
  final String title;
  final String url;
  final String thumbnailUrl;

  Users({
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) =>
      Users.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Users(title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
}
