import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:untitled2_quote_app/models/quote_model.dart';
import 'package:untitled2_quote_app/utils/quote_utils.dart';

class QuoteDetails extends StatefulWidget {
  const QuoteDetails({Key? key}) : super(key: key);

  @override
  State<QuoteDetails> createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {

  Color? refreshColor;
  String? quotefont;
  String? fontcolor;

  int fonweight=4;

  GlobalKey imagekey = GlobalKey();


  List colors =[Colors.white,Colors.black,...Colors.primaries];

  List colorfont =[Colors.white,Colors.black,...Colors.primaries];




  @override
  Widget build(BuildContext context) {

    Quote? quote = ModalRoute.of(context)!.settings.arguments as Quote;

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
        actions: [
          IconButton(onPressed:(){
            setState(() {
              fonweight=0;
              refreshColor= Colors.grey;

            });

          } ,
            icon: Icon(Icons.refresh),
          ),
        ],

      ),
      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
            children: [
              RepaintBoundary(
                key:imagekey,
                child: Container(
                  height: h * 0.45,
                  width: w * 0.90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: refreshColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          //spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(3, 3),
                        )
                      ]
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      SelectableText(
                        quote.quote,
                        style: TextStyle(
                          fontWeight: FontWeight.values[fonweight],
                          fontFamily: "Borel" ,
                        ),
                        maxLines: 8,
                        //overflow: TextOverflow.ellipsis,
                      ),

                      const Spacer(
                        flex: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SelectableText("- ${quote.author}"
                            ,style: TextStyle(
                              fontWeight: FontWeight.values[fonweight],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  var key;
                  final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary;
                  final image = await boundary?.toImage(pixelRatio: 12);
                  final byteData = await image?.toByteData(format: ImageByteFormat.png);
                  final imageBytes = byteData?.buffer.asUint8List();

                  if(imageBytes!=null){
                    final directory = await getApplicationDocumentsDirectory();
                    final imagePath = await File("${directory.path}/quote.png").create();
                    await imagePath.writeAsBytes(imageBytes);

                    ShareExtend.share(imagePath.path, "file");
                  }


              },
                child: const Text("Share"),
              ),

              SizedBox(
                height: 15,
              ),

              Text("BackGround Color"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(colors.length, (index) =>
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              refreshColor= colors[index];
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 80,
                            margin: EdgeInsets.all(5),
                            color: colors[index],

                          ),
                        ),
                    )
                  ],

                ),
              ),

              SizedBox(
                height: 15,
              ),
              Text("Quote color font"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(colorfont.length, (index) =>
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              fontcolor = colors[index];
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 80,
                            margin: EdgeInsets.all(5),
                            color: colors[index],

                          ),
                        ),
                    )
                  ],

                ),
              ),



              const SizedBox(
                height: 15,
              ),

              Text("Slider"),
              Slider(
                min: 0,
                max: 8,
                value: fonweight.toDouble(),
                onChanged: (val){
                  setState(() {
                    fonweight = val.toInt();
                  });
                },

              ),
            ]
        ),
      ),
    );
  }
}