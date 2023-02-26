import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submitData() {
    final enteredTitile = titlecontroller.text;
    final enteredAmount = double.parse(amountcontroller.text);

    if (enteredTitile.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitile, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              controller: titlecontroller,
              // onSubmitted: (_) => submitData(),
            ),
            SizedBox(
              height: 2.h,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              // onSubmitted: (_) => submitData(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('No Date Chosen !'),
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 22.w,
            ),
            ElevatedButton(
              onPressed: submitData,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 44,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                elevation: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
