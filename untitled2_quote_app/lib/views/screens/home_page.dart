import 'package:flutter/material.dart';
import 'package:untitled2_quote_app/utils/color_utils.dart';
import 'package:untitled2_quote_app/utils/quote_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote App"),
        backgroundColor: Color.fromRGBO(31, 65, 106, 1),
        foregroundColor: Colors.white,
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
                  onTap: (){},
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
            const Expanded(
              child: SingleChildScrollView(),
            ),
          ],
        ),
      ),
    );
  }
}
