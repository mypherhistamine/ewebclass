import 'package:ewebclass/controllers/filedownload.dart';
import 'package:ewebclass/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseMaterials extends StatefulWidget {
  static const routeName = "/courseMaterial";
  @override
  _CourseMaterialsState createState() => _CourseMaterialsState();
}

class _CourseMaterialsState extends State<CourseMaterials> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var fileIsDownloading = false;
    final fileDownloaderController = Get.put(FileDownloadController());

    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(context),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Class Materials",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.all(16),
            //   height: size.height * 0.3,
            //   width: size.width * 0.8,
            //   child: Card(
            //     elevation: 5,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(10.0),
            //           child: Text(
            //             'NetCom DA-2',
            //             style: TextStyle(fontSize: 25),
            //           ),
            //         ),
            //         SizedBox(height: 10),
            //         Container(
            //           child: Center(
            //             child: Container(
            //               child: Icon(
            //                 Icons.picture_as_pdf,
            //                 size: 100,
            //                 color: Colors.red,
            //               ),
            //             ),
            //           ),
            //         ),
            //         Spacer(),
            //         Container(
            //           height: 40,
            //           // decoration: BoxDecoration(
            //           //   border: Border.all(
            //           //     color: Colors.black,
            //           //   ),
            //           // ),
            //           child: Row(
            //             children: [
            //               Spacer(),
            //               Obx(
            //                 () => !fileDownloaderController.fileIsDownload.value
            //                     ? IconButton(
            //                         icon: Icon(
            //                           Icons.file_download,
            //                           size: 30,
            //                           color: Colors.blueAccent,
            //                         ),
            //                         onPressed: () async {
            //                           print("pressed");
            //                           await fileDownloaderController
            //                               .downloadFile();
            //                           await buildShowDialog(context);
            //                         },
            //                       )
            //                     : CircularProgressIndicator(),
            //               ),
            //               SizedBox(width: 16)
            //             ],
            //           ),
            //         ),
            //         SizedBox(height: 20)
            //       ],
            //     ),
            //   ),
            //   // color: Colors.red,
            // )

            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return CustomCardBuilder(
                    fileDownloaderController: fileDownloaderController,
                    size: size,
                  );
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => new AlertDialog(
      title: new Text('Message'),
      content: Text('Your file is saved.'),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pop(); // dismisses only the dialog and returns nothing
          },
          child: new Text('OK'),
        ),
      ],
    ),
  );
}

class CustomCardBuilder extends StatefulWidget {
  final size;
  final fileDownloaderController;
  CustomCardBuilder({Key key, this.size, this.fileDownloaderController});

  @override
  _CustomCardBuilderState createState() => _CustomCardBuilderState();
}

class _CustomCardBuilderState extends State<CustomCardBuilder> {
  var fileDownloading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      height: widget.size.height * 0.3,
      width: widget.size.width * 0.8,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'NetCom DA-2',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Center(
                child: Container(
                  child: Icon(
                    Icons.picture_as_pdf,
                    size: 100,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 40,
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Colors.black,
              //   ),
              // ),
              child: Row(
                children: [
                  Spacer(),
                  Obx(
                    () => !widget.fileDownloaderController.fileIsDownload.value
                        ? IconButton(
                            icon: Icon(
                              Icons.file_download,
                              size: 30,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () async {
                              print("pressed");
                              await widget.fileDownloaderController
                                  .downloadFile();
                              await buildShowDialog(context);
                            },
                          )
                        : CircularProgressIndicator(),
                  ),
                  SizedBox(width: 16)
                ],
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
      // color: Colors.red,
    );
  }
}
