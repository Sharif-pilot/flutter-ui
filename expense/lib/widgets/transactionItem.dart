import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
class TransactionItem extends StatefulWidget {

  final  transaction;
  final Function deleteTx;
  const TransactionItem({Key key,this.transaction,this.deleteTx}):super(key: key);
  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
   Color _backgroundColor;
  @override
  void initState() {
    const colors = [
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.orange,
      Colors.cyan,
    ];
    _backgroundColor = colors[Random().nextInt(5)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Text('\$${widget.transaction.amount}'),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme
              .of(context)
              .textTheme
              .headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery
            .of(context)
            .size
            .width > 360 ? FlatButton.icon(
          onPressed: () => widget.deleteTx(widget.transaction.id),
          icon: Icon(Icons.delete),
          label: Text("Delete"),
          textColor: Theme.of(context).errorColor,
        ):IconButton(
          onPressed: () => widget.deleteTx(widget.transaction.id),
          icon: Icon(
            Icons.delete,
            color: Theme
                .of(context)
                .errorColor,
          ),
        ),
      ),
    );
  }
}
