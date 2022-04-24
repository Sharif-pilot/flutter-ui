import 'package:expense/models/transaction.dart';
import 'package:expense/widgets/transactionItem.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Text(
            "No transactions added yet!",
            style: Theme
                .of(context)
                .textTheme
                .headline6,
          ),
          SizedBox(height: 30),
          Container(
            height: constraints.maxHeight * 0.6,
            child: Image.asset(
              "assets/images/waiting.png",
              fit: BoxFit.cover,
            ),
          )
        ],
      );
    })
        : ListView(
      children:  transactions.map((e)=>TransactionItem(transaction: e,deleteTx: deleteTx,key: ValueKey(e.id) )).toList(),
    );/*ListView.builder(
      itemBuilder: (context, index) {
        return TransactionItem(transactions[index], deleteTx);
      },
      itemCount: transactions.length,
    );*/
  }
}
//     return Card(
//                   child: Row(
//                     children: [
//                       Container(
//                         child: Text(
//                           "\$${transactions[index].amount.toStringAsFixed(2)}",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Theme.of(context).primaryColor),
//                         ),
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 10, horizontal: 15),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 2, color: Theme.of(context).primaryColor),
//                         ),
//                         padding: const EdgeInsets.all(10),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             transactions[index].title,
//                             style: Theme.of(context).textTheme.headline6,
//                           ),
//                           Text(
//                             DateFormat.yMMMMEEEEd()
//                                 .format(transactions[index].date),
//                             style: TextStyle(color: Colors.grey[500]),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 );
