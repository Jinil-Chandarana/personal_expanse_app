import 'package:flutter/material.dart';

class NewTransection extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountContoler = TextEditingController();
  final Function addTx;
  NewTransection(this.addTx);

  void submitData() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountContoler.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    addTx(
      enteredTitle,
      enteredAmount,
    );
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
              onPressed: () {
                print(titleControler.text);
                print(amountContoler.text);
                submitData;
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
    );
  }
}
