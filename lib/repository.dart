import 'package:flutter/cupertino.dart';

import 'models/record.dart';

class Repository extends ChangeNotifier {
  void replaceRecord(Record existingRec, Record newRec) {
    final i = records.indexOf(existingRec);
    records[i] = newRec;

    notifyListeners();
  }

  // example data
  List<Record> records = [
    const Record(
      title: 'First record',
      details: 'The details of the first record',
      isFavorite: false,
    ),
    const Record(
      title: 'Second record',
      details: 'The details of the second record',
      isFavorite: false,
    ),
    const Record(
      title: 'Third record',
      details: 'The details of the third record',
      isFavorite: true,
    ),
    const Record(
      title: 'Fourth record',
      details: 'The details of the fourth record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
    const Record(
      title: 'Another record',
      details: 'The details of the another record',
      isFavorite: false,
    ),
  ];

}

