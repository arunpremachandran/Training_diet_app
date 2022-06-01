import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:training_diet_app/animation/BouncyPageRoute.dart';
import 'package:training_diet_app/model/meal.dart';
import 'package:training_diet_app/ui/pages/bottom_navbar.dart';
import 'package:training_diet_app/ui/pages/meal_detail_screen.dart';
import 'package:training_diet_app/ui/pages/workout_screen.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
          child: BottomNavbar(),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * 0.32,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const  BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 25, left: 28, right: 16, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          color: Colors.black54
                        ),
                      ),
                      subtitle: Text("Hello, David",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: ClipOval(child:
                        Image.asset("assets/user.jpg",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: _RadialProgress(
                              width: width * 0.21,
                              height: height * 0.09,
                              progress: 0.8
                          ),
                        ),
                        SizedBox(width: 50),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _IngredientProgress(
                              width: width * 0.3,
                              ingredient: "Protein",
                              progress: 0.3,
                              progressColor: Colors.green,
                              leftAmount: 72,
                            ),
                            _IngredientProgress(
                              width: width * 0.3,
                              ingredient: "Carbs",
                              progress: 0.2,
                              progressColor: Colors.red,
                              leftAmount: 252,
                            ),
                            _IngredientProgress(
                              width: width * 0.3,
                              ingredient: "Fat",
                              progress: 0.1,
                              progressColor: Colors.yellow,
                              leftAmount: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.35,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(
                      bottom: 8,
                      left: 32,
                      right: 16
                  ),
                    child: Text(
                      "MEALS FOR TODAY",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 32,
                            ),
                            for(int i=0; i < meals.length; i++)
                              _MealCard(
                                meal: meals[i],
                              ),
                          ],
                        ),
                      ),
                  ),
                  SizedBox(
                      height: 3
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,BouncyPageRouter(widget: WorkoutScreen()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10, left: 32, right: 32),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFF2000BC),
                              const Color(0xFF200087),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0, left: 16),
                              child: Text(
                                "YOUR NEXT WORKOUT",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, left: 16),
                              child: Text(
                                "Upper Body",
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF5B4D9D),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      "assets/chest.png",
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF5B4D9D),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      "assets/back.png",
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF5B4D9D),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      "assets/biceps.png",
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF5B4D9D),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      "assets/back.png",
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _MealCard extends StatelessWidget {
  final Meal? meal;

  const _MealCard({Key? key,  this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15, bottom: 10),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            BouncyPageRouter(
              widget: MealDetailScreen(
                meal: meal,
              ),
            ),
          );
        },
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max ,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    meal!.imagePath,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        meal!.mealTime,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Colors.blueGrey
                        ),),
                      Text(
                        meal!.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black
                        ),
                      ),
                      Text(
                        "${meal!.kiloCaloriesBurnt} kcal",
                        style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            color: Colors.blueGrey
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.black26,
                            size: 15,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "${meal!.timeTaken} min",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                                color: Colors.blueGrey
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String? ingredient;
  final int? leftAmount;
  final double? progress,width;
  final Color? progressColor;


  const _IngredientProgress({Key? key, this.ingredient, this.leftAmount, this.progress, this.progressColor, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(ingredient!.toUpperCase(),
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w700,
        ),),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 3, bottom: 3),
                height: 6,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.black12,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 3, bottom: 3),
                height: 6,
                width: width! * progress!,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: progressColor,
                ),
              ),
              ],
            ),
            SizedBox(width: 6,),
            Text("${leftAmount}g left",style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w700,
              ),),
          ],
        ),
      ],
    );
  }
}



class _RadialProgress extends StatelessWidget {
  final double? height, width, progress;

  const  _RadialProgress({Key? key, this.width, this.height, this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: _RadialPainter(progress: 0.7),
        child:Container(
          height: height,
          width: width,
          child: Center(
            child:RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(text: "1731", style: TextStyle(
                      fontSize:15,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF200087)
                  ),),
                  TextSpan(text: "\n"),
                  TextSpan(text: "kcal", style: TextStyle(
                      fontSize:10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF200087)
                  ),),
                ]
            ),
          ),),
        ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double ? progress;
  _RadialPainter({this.progress});
  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint()
        ..strokeWidth = 3.5
        ..color = Color(0xFF200087)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width/2, size.height/2);
    //canvas.drawCircle(center, size.width/2, paint);
    double relativeProgress = 360 * progress!;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width/2), math.radians(-90), math.radians(-relativeProgress), false, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate){

    return true;
  }
}
