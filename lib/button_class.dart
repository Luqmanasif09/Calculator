import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String Btn_txt;
  final Color C;
  final Function Oper;

  /// final Function func;

  Button(this.Btn_txt, this.C, this.Oper);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(13),
      width: 73,
      height: MediaQuery.of(context).size.height * 0.08,
      child: RaisedButton(
        color: C,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Text(
          Btn_txt,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Oper(Btn_txt);
        },
      ),
    );
  }
}
