import 'package:flutter/material.dart';
import 'package:widgets_real_app/widgets/transaction_list.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;


  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // late String titleInput;
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

   

    if(enteredTitle.isEmpty || enteredAmount <=0 ) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();

    void presentDatePicker() {
      showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime.now());
    }
  }

  // const NewTransaction({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   // titleInput = val;
              // } ,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
              // onChanged: (val) => amountInput = val,
            ),
            RaisedButton(onPressed: null,),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
                // print(titleInput);
                // print(amountInput);
                // print(titleController.text);
                
              
            ),
          ],
        ),
      ),
    );
  }
}
