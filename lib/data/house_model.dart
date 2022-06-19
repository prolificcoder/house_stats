import 'dart:convert';

import 'package:collection/collection.dart';

class House {
  String? houseName;
  int? score;
  int? position = 0; //Custom property

  House({this.houseName, this.score, this.position});

  @override
  String toString() =>
      'House(houseName: $houseName, score: $score, position: $position)';

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

  List<House> sortHousesByPosition(List<House> houses) {
    for (var i = 0; i < houses.length; i++) {
      for (var j = 0; j < houses.length; j++) {
        if (houses[i].score! < houses[j].score!) {
          var temp = houses[i];
          houses[i] = houses[j];
          houses[j] = temp;
        }
      }
    }
    for (var i = 0; i < houses.length; i++) {
      houses[i].position = houses.length - i;
    }
    return houses;
  }
}
