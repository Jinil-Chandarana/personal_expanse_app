import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/widgets/chart.dart';

import 'models/transection.dart';
import 'widgets/new_transection.dart';
import 'widgets/transection_list.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
// to restrict landscape mode :
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.teal[500],
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

  bool _showChart = false;

  List<Transection> get _recentTransections {
    return _userTransections.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

  void _addNewTransection(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transection(
      amount: txAmount,
      title: txTitle,
      date: chosenDate,
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

  void _deleteTransection(String id) {
    setState(() {
      _userTransections.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscap =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appbar = AppBar(
      title: Text('Personal Expenses'),
    );

    final txList = Container(
      height: (MediaQuery.of(context).size.height -
              appbar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.8,
      child: TransectionList(_userTransections, _deleteTransection),
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscap)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Chart'),
                  Switch(
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                          // print(_showChart);
                        });
                      }),
                ],
              ),
            if (!isLandscap)
              Container(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(_recentTransections),
              ),
            if (!isLandscap) txList,
            if (isLandscap)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appbar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.8,
                      child: Chart(_recentTransections),
                    )
                  : txList
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
