import 'transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<transaction> transactions = [
    transaction(
        id: 't1', amount: 50.99, title: 'New Shoes', date: DateTime.now()),
    transaction(
        id: 't2', amount: 40.99, title: 'New Cloths', date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.amber,
              child: Text(
                'Chart!',
                textAlign: TextAlign.center,
              ),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        tx.amount.toString(),
                      ),
                    ),
                    Column(
                      children: [
                        Text(tx.title),
                        Text(
                          tx.date.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
