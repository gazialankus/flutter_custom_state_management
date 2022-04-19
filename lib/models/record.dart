import 'package:flutter/foundation.dart';

@immutable
class Record {
  const Record({
    required this.title,
    required this.details,
    required this.isFavorite,
  });

  Record.withFavorite(Record other, this.isFavorite) :
    title = other.title,
    details = other.details;

  final String title;
  final String details;
  final bool isFavorite;
}
