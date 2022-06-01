import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_diet_app/model/meal.dart';


class MealDetailScreen extends StatelessWidget {
  final Meal? meal;
  const MealDetailScreen({Key? key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color(0xFFE9E9E9),
            expandedHeight: 200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30),),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30),),
                child:Image.asset(
                    meal!.imagePath,
                    fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              SizedBox(height: 10,),
              ListTile(
                title: Text(
                  meal!.mealTime,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                    color: Colors.black54
                  ),
                ),
                subtitle: Text(
                  meal!.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: Colors.black
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(width: 18,),
                        Text("${meal!.kiloCaloriesBurnt}  kcal",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                            Icons.access_time,
                            color: Colors.grey,
                            size: 15,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${meal!.timeTaken}  mins",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "INGREDIENTS",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: Colors.blueGrey
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for(int i=0; i< meal!.ingredients.length; i++)
                      Padding(
                        padding: EdgeInsets.only(bottom: 4, top: 10),
                        child: Text(meal!.ingredients[i],
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "PREPARATIONS",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: Colors.blueGrey
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(meal!.preparation,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
            ),
          ),
        ],
      ),
    );
  }
}
