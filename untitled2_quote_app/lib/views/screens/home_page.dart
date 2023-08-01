import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untitled2_quote_app/utils/color_utils.dart';
import 'package:untitled2_quote_app/utils/quote_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? selectedCategory;

  bool isGrid = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote App"),
        backgroundColor: Color.fromRGBO(31, 65, 106, 1),
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {

          },
              icon: Icon(isGrid ?Icons.list :Icons.grid_view_rounded))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: allCategories
                    .map((e) => GestureDetector(
                  onTap: (){
               setState(() {
                 selectedCategory = e;
               });
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: selectedCategory == e ? MyColor.themeColor : Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(e),
                  ),
                ),
                ).toList(),
              ),
            ),
            Expanded(
              child:isGrid
                  ? SingleChildScrollView(
                child: StaggeredGrid.count(crossAxisCount: 2,
                children: List.generate(
                    allQuotes.length,
                        (index) => selectedCategory == "All"
                ? StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount:  index % 2 == 0 ? 1 : 1.5,
                          child: Card(
                            color: Colors.primaries[index % 18].shade700,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(allQuotes[index].quote,
                                  maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                            : Visibility(
                          visible: selectedCategory == allQuotes[index].category,
                          child: StaggeredGridTile.count(crossAxisCellCount: 1,
                              mainAxisCellCount: index % 2 == 0 ? 1 : 1.5 ,
                              child: Card(
                                color: Colors.primaries[index % 18].shade700,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(allQuotes[index].quote,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ), ),
                        ),
                ),

                ),)
                  : selectedCategory == "All"
                  ? ListView.builder(itemBuilder: (context,index)=>Row())
                  : ListView.builder(itemBuilder: (context,index)=>Row())
              // ListView.builder(
              //   itemCount: allQuotes.length,
              //     itemBuilder:(context,index)=>(allQuotes[index].category == selectedCategory)
              //         ? ListTile(
              //       leading: CircleAvatar() ,
              //       title: Text(allQuotes[index].quote),
              //      // isThreeLine: true,
              //       trailing: IconButton(
              //         onPressed: () {
              //
              //         },
              //         icon: Icon(Icons.arrow_forward_ios_outlined),
              //       ),
              //
              //     )
              //         : Container(),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
