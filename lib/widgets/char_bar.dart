import 'package:flutter/material.dart';
import './char_bar.dart';

class ChartBar extends StatelessWidget {
  String label;
  double spendAmount;
  double spendAmountPer;

  ChartBar({this.label, this.spendAmount, this.spendAmountPer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(child: Text('\$${spendAmount.toStringAsFixed(0)}')),
        ),
        SizedBox(height: 5),
        Container(
            height: 60,
            width: 10,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                       color: Color.fromRGBO(220, 220, 220, 1),
                        border: Border.all(color: Colors.grey, width: 10)),
                       
                  
                  ),
                  FractionallySizedBox(heightFactor: spendAmountPer,
                  child:Container(decoration: BoxDecoration(color:Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),)

                  )


                ],
              ),
            )),
            SizedBox(height:4),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(label),
            )
      ],
    );
  }
}
