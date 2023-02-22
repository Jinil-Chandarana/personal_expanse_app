import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart_bar.dart';
import '../models/transection.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transection> recentTransections;
  Chart(this.recentTransections);

  List<Map<String, Object>> get groupedTransectionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0;

      for (var i = 0; i < recentTransections.length; i++) {
        if (recentTransections[i].date.day == weekDay.day &&
            recentTransections[i].date.month == weekDay.month &&
            recentTransections[i].date.year == weekDay.year) {
          totalSum += recentTransections[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpanding {
    return groupedTransectionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransectionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(13),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTransectionValues.map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpanding == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpanding,
                  ),
                );
              }).toList()),
        ),
      ),
    );
  }
}
