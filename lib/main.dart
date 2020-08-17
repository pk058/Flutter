import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0xFFE7E2F6),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7E2F6),
      body: Container(
      padding: EdgeInsets.only(left: 15,top: 70,bottom: 10,right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Practice",
                  style:TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold)
              ),
              InkWell(
                onTap: (){
                  debugPrint("Menu Clicked");
                },
                child: Image.asset("Assets/menu.png",
                height: 40,
                width: 30,),
              ),
            ],
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  debugPrint("Assingment Clicked");
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Assingment", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),),
                  height: 45,
                  width: 140,
                  decoration: BoxDecoration(
                    color:Color(0xff00A284),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  debugPrint("Test Clicked");
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Test", style: TextStyle(
                      fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),),
                  height: 45,
                  width: 140,
                  decoration: BoxDecoration(
                      color:Color(0xffD0DCEC),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40,),
          Align(
            alignment: Alignment.topLeft,
            child: Text("New Assingment",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              )
            ),
          ),
          Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 4
                ),
                  itemCount: newAssingment.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(left: 08),
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xffE7E2F6),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${newAssingment[index].sub} Assingment",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 3,),
                              SizedBox(
                                width: 190,
                                child: Text("${newAssingment[index].topic}",
                                  softWrap:   false,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      color: Color(0xff00A284),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  ),),
                              ),
                              SizedBox(height: 3,),
                              Text("Updated on: ${newAssingment[index].date}",
                                style: TextStyle(
                                    fontSize: 12
                                ),)
                            ],
                          ),
                          SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                              debugPrint("Details Clicked");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Details", style: TextStyle(
                                  fontSize: 15
                              ),),
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                  color:Color(0xff00A284),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              )
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Pending Assingment",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 4,
                  ),
                  itemCount: pendingAssingment.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(left: 08),
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xffE7E2F6),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${pendingAssingment[index].sub} Assingment",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 3,),
                              SizedBox(
                                width: 190,
                                child: Text("${pendingAssingment[index].topic}",
                                  softWrap:   false,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      color: Color(0xff00A284),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  ),),
                              ),
                              SizedBox(height: 3,),
                              Text("Updated on: ${pendingAssingment[index].date}",
                                style: TextStyle(
                                    fontSize: 12,
                                  color: Colors.red
                                ),)
                            ],
                          ),
                          SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                              debugPrint("Details Clicked");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Details", style: TextStyle(
                                  fontSize: 15
                              ),),
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                  color:Color(0xff00A284),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              )
          ),
        ],
      ),  
      ),
    );
  }
}
