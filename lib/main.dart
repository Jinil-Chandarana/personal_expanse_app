import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart.dart';

import 'models/transection.dart';
import 'widgets/new_transection.dart';
import 'widgets/transection_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.blue[200],
        //fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpanSans',
            fontSize: 22,
            //fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transection> _userTransections = [];

  List<Transection> get _recentTransections {
    return _userTransections.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

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
        title: Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransections),
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
