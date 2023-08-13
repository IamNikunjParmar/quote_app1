import 'package:flutter/material.dart';
import 'package:untitled1_pr_7_festival_app/model/frame_model_class.dart';
import 'package:untitled1_pr_7_festival_app/utils/color_utils.dart';
import 'package:untitled1_pr_7_festival_app/utils/festival_utils.dart';
import 'package:untitled1_pr_7_festival_app/views/screens/route_utils.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  String?  selectedCategory ;

  @override
  Widget build(BuildContext context) {


    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;


    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
       // elevation: 5,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: MyappBar,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: AppBShadow,
                blurRadius: 3,
                offset: Offset(3,3),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            // childAspectRatio: 2 / 2,
          ),
          children: List.generate(
            allFrameData.length,
                (index) => GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed(MyRoutes.DetailsPage,
                      arguments: allFrameData[index]);
                });
              },
              child:Container(
                height: h * 0.2,
                width:  w * 1,
                decoration: BoxDecoration(
                  color: MyappBar,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800,
                      blurRadius: 5,
                      offset: Offset(
                        3,3
                      ),
                    ),
                  ],

                ),
                //margin: EdgeInsets.all(4),
                alignment: Alignment.center,
                child: Text(allFrameData[index].category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}