import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/transection.dart';
import 'package:intl/intl.dart';

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

class MyHomePage extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountContoler = TextEditingController();

  final List<Transection> transection = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
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
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleControler,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountContoler,
                  ),
                  TextButton(
                    onPressed: () {
                      print(titleControler.text);
                      print(amountContoler.text);
                    },
                    child: Text('Add Transection'),
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.purple),
                      overlayColor: MaterialStatePropertyAll(Colors.purple[50]),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transection.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$: ${tx.amount.toString()}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
