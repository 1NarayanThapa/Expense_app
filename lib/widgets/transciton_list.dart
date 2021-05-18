import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransctionList extends StatelessWidget {
  List transctionValue;
  Function deleteFunction;

  TransctionList(this.transctionValue, this.deleteFunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540,
      child: transctionValue.isEmpty
          ? Column(
              children: [
                Text(
                  "No transction added",
                  style: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
                ),
                SizedBox(height: 20),
                Container(height: 300, child: Image.asset('image/waiting.png')),
              ],
            )
          : ListView.builder(
              itemCount: transctionValue.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                            "\$${transctionValue[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(transctionValue[index].title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                            DateFormat.yMMMd()
                                .format(transctionValue[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                            ))
                    
                      ],
                      
                    ),
          

                    
                    
                    Expanded(
                                          child: IconButton(
                       icon: Icon(
                         Icons.delete,
                         color: Colors.red,
                       ),
                       onPressed: () =>deleteFunction(transctionValue[index].id)),
                    )
                   
                  ],
                ));
              },
            ),
    );
  }
}
