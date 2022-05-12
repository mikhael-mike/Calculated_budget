import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgets_real_app/models/transactionModel.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get grupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].time.day == weekDay.day ||
            recentTransactions[i].time.month == weekDay.month ||
            recentTransactions[i].time.year == weekDay.year) 
            {
              totalSum += recentTransactions[i].amount;
            }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }
  // const Chart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(grupedTransactionValues);
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: grupedTransactionValues.map((e) {
            return Text('${e['day']}: ${e['amount']}');
          }).toList()
        ),
      ),
    );
  }
}
