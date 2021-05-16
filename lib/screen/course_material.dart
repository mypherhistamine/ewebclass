import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewebclass/controllers/filedownload.dart';
import 'package:ewebclass/controllers/userdata.dart';
import 'package:ewebclass/model/document.dart';
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
    final authController = Get.put(StudentData());
    final docStream = FirebaseFirestore.instance
        .collection('users')
        .doc(authController.authResultId.value)
        .collection("class_materials")
        .snapshots();

    final docFuture = FirebaseFirestore.instance
        .collection('users')
        .doc(authController.authResultId.value)
        .collection("class_materials")
        .get();

    final fakeFuture = Future.delayed(Duration(seconds: 3));

    @override
    void dispose() {
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Class Materials"),
      ),
      drawer: MyDrawer(context),
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         fit: BoxFit.fill,
        //         image: NetworkImage(
        //           'https://image.shutterstock.com/shutterstock/photos/721703848/display_1500/stock-photo-colorful-flower-on-dark-tropical-foliage-nature-background-721703848.jpg',
        //         ))),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //     "Class Materials",
            //     style: TextStyle(fontSize: 20),
            //   ),
            // ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: docStream,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  // var resilt = snapshot.data.docs;
                  // print(resilt[1]['title']);
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("An Error Occured"),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (ctx, i) {
                        return CustomCardBuilder(
                          docModel: Documents(
                            cloudStorageLocation: "loda",
                            fileName: snapshot.data.docs[i]['title'],
                            fileSize: snapshot.data.docs[i]['file_size'],
                            iconToDisplay: snapshot.data.docs[i]['icon'],
                          ),
                          fileDownloaderController: fileDownloaderController,
                          size: size,
                          indexKey: i,
                        );
                      },
                      itemCount: snapshot.data.docs.length,
                    );
                  }
                  return Container();
                },
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
      title: new Text('File Downloaded'),
      content: Text(
          'Your file has been saved in the Downloads folder of your device'),
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
  final indexKey;
  final Documents docModel;
  CustomCardBuilder(
      {Key key,
      this.size,
      this.fileDownloaderController,
      this.indexKey,
      this.docModel});

  @override
  _CustomCardBuilderState createState() => _CustomCardBuilderState();
}

class _CustomCardBuilderState extends State<CustomCardBuilder> {
  var fileDownloading = false;
  final fileDownloderController = FileDownloadController();

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
                '${widget.docModel.fileName}',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                      'assets/icons/${widget.docModel.iconToDisplay}'),
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
                key: Key(widget.indexKey.toString()),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("File Size : ${widget.docModel.fileSize} MB"),
                  ),
                  Spacer(),
                  !fileDownloading
                      ? IconButton(
                          icon: Icon(
                            Icons.file_download,
                            size: 30,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () async {
                            setState(() {
                              fileDownloading = true;
                            });
                            print("pressed");

                            //download the file
                            // await widget.fileDownloaderController
                            //     .downloadFile();
                            await fileDownloderController.downloadFileExample(
                              fileName: widget.docModel.fileName,
                              cloudStorageLocation:
                                  widget.docModel.cloudStorageLocation,
                            );

                            //show the finish downloaded dialog
                            await buildShowDialog(context);
                            setState(() {
                              fileDownloading = false;
                            });
                          },
                        )
                      : CircularProgressIndicator(),
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
