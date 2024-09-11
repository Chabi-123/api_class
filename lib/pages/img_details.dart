import 'package:api_class/model/wp_model.dart';
import 'package:api_class/pages/FullScreen.dart';
import 'package:api_class/services/walpaper_services.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ImageDetailPage extends StatelessWidget {
  final WallpaperModel photo = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Image Detail',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: photo.imgURL,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(photo.imgURL)),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 330,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenImage(imageUrl: photo.imgURL),
                        ),
                      );



                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.7),
                      ),
                      height: 45,
                      width: 45,
                      child: Icon(
                        Icons.fullscreen,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(10),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      photo.alt,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    Gap(8),
                    Text(
                      photo.photographar,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Text(
                        'DreamLense Production',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    Gap(8),
                    Text(
                      'Photo by',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Text(
                        '  pixel  ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
            Gap(20),
            MaterialButton(
              color: Colors.white,
              height: 50,
              minWidth: 20,
              onPressed: (){
                WallpaperService().openUrl(photo.imgURL);
            },
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Download'),
                Icon(Icons.download)
            ],),
            )
          ],
        ),
      ),
    );
  }
}


