import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transection.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> transections;
  final Function deletTx;
  TransectionList(this.transections, this.deletTx);

  @override
  Widget build(BuildContext context) {
    return transections.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transection add yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: constraints.maxHeight * 0.4,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transections.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 7, horizontal: 13),
                child: ListTile(
                  leading: Container(
                    child: FittedBox(
                      child: Text('\$${transections[index].amount}'),
                    ),
                    width: 80,
                    height: 50,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2.3),
                      //color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  title: Text(
                    transections[index].title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transections[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? TextButton.icon(
                          onPressed: () => deletTx(transections[index].id),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.teal,
                          ),
                          label: Text('Delete'),
                        )
                      : IconButton(
                          onPressed: () => deletTx(transections[index].id),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.teal,
                          ),
                        ),
                ),
              );
            },
          );
  }
}
