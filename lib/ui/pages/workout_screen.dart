import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:training_diet_app/model/upper_body_workout.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.white
                  ),
                ),
                subtitle: Text(
                  "Upper Body",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          color: Colors.white38,
                          size: 13,
                        ),
                        SizedBox(width: 5),
                        Text("60 mins",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.eco_sharp,
                          size: 13,
                          color: Colors.white38,
                        ),
                        SizedBox(width: 5,),
                        Text("Easy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              for(int i = 0; i < upperBody.length; i++)
                Column(
                  children: <Widget>[
                    for(int j=0; j < upperBody[i].length; j++)
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF5B4D9D),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            upperBody[i][j].imagePath??"no image",
                            width: 30,
                            height: 30,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          upperBody[i][j].name??"",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        subtitle: Text(
                          upperBody[i][j].instruction??"",
                          style: TextStyle(
                              color: Colors.white30,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
