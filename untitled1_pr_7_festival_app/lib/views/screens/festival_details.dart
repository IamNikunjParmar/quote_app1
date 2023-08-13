import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:untitled1_pr_7_festival_app/model/frame_model_class.dart';
import 'package:untitled1_pr_7_festival_app/utils/color_utils.dart';
import 'package:untitled1_pr_7_festival_app/utils/festival_utils.dart';
import 'package:untitled1_pr_7_festival_app/views/componets/myback_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  Color Ncolor = Colors.black;
  GlobalKey key = GlobalKey();


  int i = 0;

  String bgImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXqc2U_43Yqt7JM8sBuxz14U4xx_dYR1tRdkRm9ejwmtm9i-rTdLZN8DIr-IusP5yju0U&usqp=CAU";




  @override
  Widget build(BuildContext context) {

    Frame frame = ModalRoute.of(context)!.settings.arguments as Frame ;

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Details page"),
        centerTitle: true,
        leading: myBackButton(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
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
        padding: EdgeInsets.all(18),
        child: RepaintBoundary(
          key:  key,
          child: Column(
            children: [
              Container(
                height: h * 0.4,
                width:  w * 1,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800,
                      offset: Offset(3,3),
                      blurRadius: 3,
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                      frame.bgimage[i % bgImage.length],
                    ),

                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

              const SizedBox(
                width: 10,
                height: 15,
              ),
              IconButton(
                onPressed: () async {
                  final boundary = key.currentContext?.findRenderObject()
                  as RenderRepaintBoundary?;
                  final image = await boundary?.toImage();
                  final byteData =
                  await image?.toByteData(format: ImageByteFormat.png);
                  final imageBytes = byteData?.buffer.asUint8List();

                  if (imageBytes != null) {
                    final directory =
                    await getApplicationDocumentsDirectory();
                    final imagePath =
                    await File('${directory.path}/container_image.png')
                        .create();
                    await imagePath.writeAsBytes(imageBytes);

                    ImageGallerySaver.saveFile(imagePath.path);
                  }
                },
                icon: Icon(Icons.save_alt),
              ),
              IconButton(
                onPressed: () async {
                  final boundary = key.currentContext?.findRenderObject()
                  as RenderRepaintBoundary?;
                  final image = await boundary?.toImage();
                  final byteData =
                  await image?.toByteData(format: ImageByteFormat.png);
                  final imageBytes = byteData?.buffer.asUint8List();

                  if (imageBytes != null) {
                    final directory =
                    await getApplicationDocumentsDirectory();
                    final imagePath =
                    await File('${directory.path}/container_image.png')
                        .create();
                    await imagePath.writeAsBytes(imageBytes);

                    ShareExtend.share(imagePath.path, "file");
                  }
                },
                icon: Icon(Icons.share),
              ),
            ],
          ),
              SizedBox(
                height: 20,
              ),
              Text(
                "BackGround color",
                style: TextStyle(fontSize: 20, ),
              ),
              const SizedBox(
                height: 10,
              ),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               children: List.generate(Colors.primaries.length,
                       (index) =>  GestureDetector(
                         onTap: () {
                           setState(() {
                             Ncolor = Colors.primaries[index];
                           });
                         },
                         child: Container(
                           height: 45,
                           width: 80,
                           margin: EdgeInsets.only(left: 5),
                           decoration: BoxDecoration(
                             color: Colors.primaries[index % 18],
                             borderRadius: BorderRadius.circular(10),
                           ),

                         ),
                       ),
                       ),
             ),
           ),
           const SizedBox(
             height: 30,
           ),
              Text("Select Background",
                  style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
          GestureDetector(
            onTap: () {
              setState(() {
                i++;
                bgImage = frame.bgimage[i % (frame.bgimage.length)];
              });
            },
            child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyappBar,
                  borderRadius: BorderRadius.circular(50),
                ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(bgImage),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Change Background",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
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
