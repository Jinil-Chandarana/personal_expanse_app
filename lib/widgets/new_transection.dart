import 'package:flutter/material.dart';

class NewTransection extends StatefulWidget {
  final Function addTx;
  NewTransection(this.addTx);

  @override
  State<NewTransection> createState() => _NewTransectionState();
}

class _NewTransectionState extends State<NewTransection> {
  final titleControler = TextEditingController();
  final amountContoler = TextEditingController();

  void submitData() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountContoler.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleControler,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountContoler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: Text('Add Transection'),
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.purple),
                overlayColor: MaterialStatePropertyAll(Colors.purple[50]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
