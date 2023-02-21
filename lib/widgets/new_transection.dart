import 'package:flutter/material.dart';

class NewTransection extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountContoler = TextEditingController();
  final Function addTx;
  NewTransection(this.addTx);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountContoler,
            ),
            TextButton(
              onPressed: () {
                print(titleControler.text);
                print(amountContoler.text);
                addTx(
                  titleControler.text,
                  double.parse(amountContoler.text),
                );
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
