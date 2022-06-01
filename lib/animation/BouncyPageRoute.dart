import 'package:flutter/cupertino.dart';

import '../ui/pages/workout_screen.dart';

class BouncyPageRouter extends PageRouteBuilder{
  final Widget widget;
  BouncyPageRouter({required this.widget}): super(
      transitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child){
        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic);
        return ScaleTransition(
          alignment: Alignment.center,
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
        return widget;
      }
  );
}


