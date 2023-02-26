import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  DateTime? _selectedDate;

  void submitData() {
    if (amountcontroller.text.isEmpty) {
      return;
    }
    final enteredTitile = titlecontroller.text;
    final enteredAmount = double.parse(amountcontroller.text);

    if (enteredTitile.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitile, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _DatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No Date Chosen !'
                        : DateFormat.yMd().format(_selectedDate!),
                  ),
                ),
                TextButton(
                  onPressed: _DatePicker,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
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
