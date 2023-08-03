import 'package:flutter/material.dart';

class QuoteDetails extends StatefulWidget {
  const QuoteDetails({Key? key}) : super(key: key);

  @override
  State<QuoteDetails> createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {

 // List QuoteColor = [Colors.white,Colors.black,Colors.primaries.length];



  @override
  Widget build(BuildContext context) {

   // Map data = ModalRoute.of(context)!.settings.arguments as Map;

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;


    return Scaffold(
      appBar: AppBar(
        title: Text("Quote Details"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(31, 65, 106, 1),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h * 0.5,
              width:  s .width,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4,4),
                    color: Colors.black,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Text("",
                  // quote.quote,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "play fair",
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     // Text("-${quote.author}"),

                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Quote Color",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 15,
            ),

          ],
        ),
      ),
    );
  }
}
