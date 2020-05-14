import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {

  PageIndicator({Key key, this.color, this.isFirst, this.isLast, this.isSelected, this.height}): super(key: key);

  final Color color;
  final bool isFirst;
  final bool isLast;
  final bool isSelected;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(left: isFirst ? 0 : 5, right: isLast ? 0 : 5,),
      duration: Duration(milliseconds: 200),
      height: height,
      width: isSelected ? 25 : 10,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(isSelected ? Dimens.half_circle : 5))
      ),
    );
  }
}
