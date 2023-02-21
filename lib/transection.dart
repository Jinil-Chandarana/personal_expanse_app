import 'package:flutter/foundation.dart';

class Transection {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transection({
    @required this.amount,
    @required this.date,
    @required this.id,
    @required this.title,
  });
}
