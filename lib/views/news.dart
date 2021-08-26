import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ylabstutorial/controllers/newsController.dart';
import 'package:intl/intl.dart';
import 'package:ylabstutorial/views/newsarticle.dart';

import '../main.dart';

class NewsView extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'News',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () => Get.to(Home()),
                    icon: Icon(
                      Icons.cloud,
                      color: Colors.black,
                    ))
              ],
            ),
            body: Container(
              child: Obx(() {
                return ListView.builder(
                  itemCount: newsController.newsArticle.length,
                  itemBuilder: (context, index) {
                    var article = newsController.newsArticle[index];
                    var formattedTime = DateFormat('dd MMM - HH:mm')
                        .format(article.publishedAt);
                    return Container(
                      height: 120,
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(article.urlToImage,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 120,
                                child: InkWell(
                                  onTap: () =>
                                      Get.to(NewsArticle(), arguments: [
                                    article.urlToImage,
                                    article.content,
                                    article.publishedAt,
                                    article.title,
                                    article.author
                                  ]),
                                  child: Card(
                                      child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(formattedTime),
                                          Text(
                                            article.title != null
                                                ? article.title
                                                : 'null',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            article.description != null
                                                ? article.description
                                                : 'null',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ]),
                                  )),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    );
                  },
                );
              }),
            )));
  }
}
