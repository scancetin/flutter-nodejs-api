import 'details.dart';

class Chars {
  late int count;
  late List<Details> results;

  Chars({
    required this.count,
    required this.results,
  });

  Chars.fromJson(Map<String, dynamic> json) {
    count = json['count'] ?? 0;
    if (json['results'] != null) {
      results = <Details>[];
      json['results'].forEach((v) {
        results.add(Details.fromJson(v));
      });
    } else {
      results = <Details>[];
    }
  }
}
