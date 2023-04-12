import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MainAnimationPage extends StatefulWidget {
  @override
  State<MainAnimationPage> createState() => _MainAnimationPageState();
}

class _MainAnimationPageState extends State<MainAnimationPage> {
  double _height = 32.0;
  double _width = 8.0;
  double _angle = math.pi / 4;
  double posX = 100.0;
  double posY = 100.0;

  _onPanUpdate(details) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
    posX = details.globalPosition.dx;
    posY = details.globalPosition.dy;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
     // children: [_FirstItem()],
      children: _ItemList(),
    );
  }

  List<Widget> _ItemList(){
    const numOfItems = 10;
    const angleChangeRate = 36.0;
    const htChangeRate = 1.0;
    const wtChangeRate = 0.1;
    double tempHt = _height + (numOfItems+1 * htChangeRate);
    double tempWd = _width + (numOfItems+1 * wtChangeRate);
    double tempAngle = _angle + numOfItems+1 * angleChangeRate;
    List<Widget> items = [];
    for(var pos = numOfItems; pos > 0; pos --){
      tempHt -= htChangeRate;
      tempWd -= wtChangeRate;
      tempAngle -= angleChangeRate;
      items.add(
        _Item(
          height: tempHt,
          width: tempWd,
          angle: tempAngle
        )
      );
    }
    items.add(_FirstItem());
    return items;
  }

  Widget _Item({double? height, double? width, double? angle}) {
    return Positioned(
      top: posY,
      left: posX,
      child: Transform.rotate(
        angle: angle ?? _angle,
        child: Container(
            height: height ?? _height,
            width: width ?? _width,
            decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
          ),
      ),
    );
  }

  Widget _FirstItem({double? height, double? width, double? angle}) {
    return Positioned(
      top: posY,
      left: posX,
        child: Transform.rotate(
          angle: angle ?? _angle,
          child: GestureDetector(
            onPanUpdate: _onPanUpdate,
            child: Container(
              height: height ?? _height,
              width: width ?? _width,
              decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
            ),
          ),
        ),
    );
  }

}
