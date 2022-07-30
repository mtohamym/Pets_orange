import 'package:flutter/material.dart';
import 'package:ms_widgets/ms_widgets.dart';
import '../pages/request.dart';

class CustomCursor extends StatefulWidget {
  const CustomCursor({required Widget child});


  @override
  _CustomCursorState createState() => _CustomCursorState();
}

class _CustomCursorState extends State<CustomCursor> {
  Offset position = Offset.zero;
  late Widget child;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onEnter: (val) {
        setState(() {
          position = val.position;
        });
      },
      onExit: (val) {
        setState(() {
          position = val.position;
        });
      },
      onHover: (val) {
        setState(() {
          position = val.position;
        });
      },
      child: Stack(children: [
        RequestPage(),
        Positioned(
          top: position.dy,
          left: position.dx,
          child: SizedBox(
            height: 25,
            width: 25,
            child: Image(
              image: AssetImage("dogHand2.png"),
            ),
          ),
        ),
      ]),
    );
  }
}
