import 'package:flutter/material.dart';
import 'package:widgets_real_app/models/transactionModel.dart';
import 'package:widgets_real_app/widgets/chart.dart';
import 'package:widgets_real_app/widgets/new_transaction.dart';
import 'package:widgets_real_app/widgets/transaction_list.dart';
import 'package:widgets_real_app/widgets/Remove_user_transactions.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App', 
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(titleLarge: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 18)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(titleLarge: TextStyle(fontFamily: 'OpenSans', fontSize: 20, fontWeight: FontWeight.bold,))
        )
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
  // final List<Transaction> transactions= [

    final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'Show shes', amount: 69.99, time: DateTime.now()),
    // Transaction(
    //     id: 't2',
    //     title: 'Weekly Groceres',
    //     amount: 16.53,
    //     time: DateTime.now()),
  ];

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((element) {
      return element.time.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txamount) {
    final newText = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txamount, time: DateTime.now());

    setState(() {
      _userTransactions.add(newText);
    });
  }


  void startAddNewTrransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, 
    builder: (_) {
      return GestureDetector(child: 
      NewTransaction(_addNewTransaction),
      behavior: HitTestBehavior.opaque,
      );
    });
  }

  // const MyHomePage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Flutter App', style: TextStyle(fontFamily: 'Open Sans'),),
        actions: <Widget>[
          IconButton(onPressed: () => {
            startAddNewTrransaction(context)
          }, icon: Icon(Icons.add)),
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Chart(_recentTransaction),
               TransactionList(_userTransactions),
              ],
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () => {
        startAddNewTrransaction(context)
      }),
      );
  }
}