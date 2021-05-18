import 'package:appbar_floating_button/widgets/new_transction.dart';
import 'package:appbar_floating_button/widgets/transciton_list.dart';
import 'package:flutter/material.dart';

import './models/transction.dart';
import './widgets/chart.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.purple),
    title: "expense_planner",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Transction> transction = [
    // Transction(id: '1', title: 'shoes', amount: 499, date: DateTime.now()),
    // Transction(id: '2', title: 'Bag', amount: 1000, date: DateTime.now()),
  ];

  List<Transction> get values {
    return transction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void inputMethod(String titletx, double amounttx, DateTime datepicker) {
    final tx = Transction(
      amount: amounttx,
      title: titletx,
      id: DateTime.now().toString(),
      date: datepicker,
    );

    setState(() {
      transction.add(tx);
    });
  }

  void inputFunction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              // onTap: (){},
              // behavior: HitTestBehavior.opaque,

              child: NewTransction(
            inputMethod,
          ));
        });
  }

  void deleteFunction(String id){

    setState(() {
          transction.removeWhere((element) => element.id==id);
      
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 35,
          ),
          onPressed: () => inputFunction(context),
        ),
        appBar: AppBar(actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                size: 35,
              ),
              onPressed: () => inputFunction(context)),
        ], centerTitle: true, title: Text("expense_planner")),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
                child: Container(
                    color: Colors.blue,
                    // width: double.infinity,
                    child: Chart(values))),
            TransctionList(
              transction,deleteFunction
            )
          ],
        ));
  }
}
