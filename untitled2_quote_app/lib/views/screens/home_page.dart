
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untitled2_quote_app/models/quote_model.dart';
import 'package:untitled2_quote_app/utils/color_utils.dart';
import 'package:untitled2_quote_app/utils/quote_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String  selectedCategory = "All";

  List<Quote> randomQuoteList = allQuotes;

  int n = 0;

  bool isGrid = false ;

  get themeColor => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote App"),
        backgroundColor: Color.fromRGBO(31, 65, 106, 1),
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              isGrid = !isGrid;

            });
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
                      color: selectedCategory == e ? MyColor.themeColor: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(e),
                  ),
                ),
                ).toList(),
              ),
            ),
            isGrid
                ? Expanded(
              child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      children: List.generate(
                          allQuotes.length,
                              (index) => selectedCategory == "All"
                              ? StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount:
                            index % 2 == 0 ? 1 : 1.5,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(MyRoutes.QuoteDetails,
                                    arguments: allQuotes[index])
                                    .then(
                                      (value) => setState(() {
                                   selectedCategory = "All";
                                  }),
                                );
                              },
                              child: Card(
                                color: Colors
                                    .primaries[index % 18].shade800,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        allQuotes[index].quote,
                                        maxLines: 4,
                                        overflow:
                                        TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        " - ${allQuotes[index].author}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                              : Visibility(
                              visible: selectedCategory ==
                                  allQuotes[index].category,
                              child: StaggeredGridTile.count(
                                crossAxisCellCount: 1,
                                mainAxisCellCount:
                                index % 2 == 0 ? 1 : 1.5,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        MyRoutes.QuoteDetails,
                                        arguments: allQuotes[index]);
                                  },
                                  child: Card(
                                    color: Colors.blue,
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            allQuotes[index].quote,
                                            maxLines: 4,
                                            overflow:
                                            TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            " - ${allQuotes[index].author}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ))))),
            )
                : selectedCategory == "All"
                ? SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                itemCount: allQuotes.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(
                      allQuotes[index].quote,
                      style: TextStyle(fontSize: 16),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(allQuotes[index].author),
                  ),
                ),
              ),
            )
                : SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                itemCount: allQuotes.length,
                itemBuilder: (context, index) =>
                allQuotes[index].category == selectedCategory
                    ? GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(MyRoutes.QuoteDetails,arguments: allQuotes[index]);
                  },
                  child: Card(
                    color: Colors.primaries[index % 18],
                    child: ListTile(
                      title: Text(
                        allQuotes[index].quote,
                        style: TextStyle(fontSize: 16),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(allQuotes[index].author),
                    ),
                  ),
                )
                    : Container(),
              ),
            ),
          ]),
      ),

    );
  }
}