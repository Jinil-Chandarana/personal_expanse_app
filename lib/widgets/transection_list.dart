import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transection.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> transections;
  TransectionList(this.transections);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transections.isEmpty
          ? Column(
              children: [
                Text(
                  'No transection add yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
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
                  ),
                );
              },
            ),
    );
  }
}
