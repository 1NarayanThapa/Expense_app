import 'package:appbar_floating_button/widgets/char_bar.dart';
import 'package:flutter/material.dart';
import '../models/transction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Transction> rtransction;
  Chart(this.rtransction);

  List<Map<String, Object>> get values {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));

      var totalsum = 0.0;

      for (var i = 0; i < rtransction.length; i++) {
        if (rtransction[i].date.day == weekday.day &&
            rtransction[i].date.month == weekday.month &&
            rtransction[i].date.year == weekday.year) {
          totalsum += rtransction[i].amount;

          print(DateFormat.E().format(weekday));

          print(totalsum);
        }
      }

      return ({'day': DateFormat.E().format(weekday).substring(0,1), 'amount': totalsum});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(values);
    return Card(
        elevation: 8,
        margin: EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: values.map((e) {
          return Flexible(
            fit:FlexFit.tight,
                      child: ChartBar(
              label: e['day'],
              spendAmount: e['amount'],
              spendAmountPer:totalSpend ==0?0: (e['amount']as double)/ totalSpend,
            ),
          );
        }).toList()));
  }

  double get totalSpend {
    return values.fold(0.0, (sum, element) {
      return sum + element['amount'];
    });
  }
}
