import 'dart:convert';

import 'package:collection/collection.dart';

class House {
  String? houseName;
  int? score;

  House({this.houseName, this.score});

  @override
  String toString() => 'House(houseName: $houseName, score: $score)';

  factory House.fromMap(Map<String, dynamic> data) => House(
        houseName: data['house-name'] as String?,
        score: data['score'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'house-name': houseName,
        'score': score,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [House].
  factory House.fromJson(String data) {
    return House.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [House] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! House) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => houseName.hashCode ^ score.hashCode;
}
