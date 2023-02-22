import 'package:flutter/material.dart';

import 'models/transection.dart';
import 'widgets/new_transection.dart';
import 'widgets/transection_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startNewTransection(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: NewTransection(_addNewTransection),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            TransectionList(_userTransections),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTransection(context),
      ),
    );
  }
}
