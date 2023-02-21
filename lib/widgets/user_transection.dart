import 'package:flutter/material.dart';

import '../models/transection.dart';
import 'new_transection.dart';
import 'transection_list.dart';

class UserTransection extends StatefulWidget {
  const UserTransection({Key key}) : super(key: key);

  @override
  State<UserTransection> createState() => _UserTransectionState();
}

class _UserTransectionState extends State<UserTransection> {
  final List<Transection> _userTransections = [
    Transection(
      id: '1',
      amount: 100.0,
      title: 'dinner',
      date: DateTime.now(),
    ),
    Transection(
      id: '2',
      amount: 500.0,
      title: 'fruit',
      date: DateTime.now(),
    ),
  ];

  void _addNewTransection(String txTitle, double txAmount) {
    final newTx = Transection(
      amount: txAmount,
      title: txTitle,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransections.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransection(_addNewTransection),
        TransectionList(_userTransections),
      ],
    );
  }
}
