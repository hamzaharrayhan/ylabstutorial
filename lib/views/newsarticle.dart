import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ylabstutorial/views/news.dart';

class NewsArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formattedTime = DateFormat('dd MMM - HH:mm').format(Get.arguments[2]);
    return ScreenUtilInit(
      builder: () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Article',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Get.to(NewsView()),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(Get.arguments[0]),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Card(
                            child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(formattedTime,
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                Text(Get.arguments[3],
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                Text(Get.arguments[4],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(Get.arguments[1],
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                              ]),
                        ))
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
