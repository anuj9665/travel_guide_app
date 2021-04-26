import 'package:flutter/material.dart';

class EntryButton extends StatelessWidget {
  final String assetName;
  final Color color;
  final String text;
  final Function onTap;

  const EntryButton({this.assetName, this.color, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        height: 80,
        width: 270,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40.0),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), 
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 15.0,),
            )
          ],
        ),
      ),
    );
  }
}
