import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xffE4E4E4),
      radius: 50,
      child: CircleAvatar(
        backgroundColor: Color(0xff32A150),
        radius: 40,
        child: Icon(Icons.check, size: 50, color: Colors.white),
      ),
    );
  }
}
