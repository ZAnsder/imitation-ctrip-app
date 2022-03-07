import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_navigator/dao/home_dao.dart';
import 'package:flutter_navigator/model/home_model.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final List _imageUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
  ];
  int appBarAlpha = 0;
  String resultString = 'xx';

  void _onScroll(offset) {
    double alpha = offset / 100 * 255;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 255) {
      alpha = 255;
    }

    setState(() {
      appBarAlpha = alpha.toInt();
    });
  }

  loadData() async {
    try {
      HomeModel result = await HomeDao.fetch();
      setState(() {
        resultString = json.encode(result);
      });
    } catch (e) {
      resultString = e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Color.fromARGB(appBarAlpha, 255, 255, 255),
        title: const Text('首页'),
        elevation: 0,
        backgroundColor: Color.fromARGB(appBarAlpha, 33, 150, 243),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: NotificationListener(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification &&
                scrollNotification.depth == 0) {
              _onScroll(scrollNotification.metrics.pixels);
            }
            return true;
          },
          child: ListView(
            children: [
              SizedBox(
                height: 160,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return Image.network(
                      _imageUrls[index],
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: _imageUrls.length,
                  autoplay: true,
                  pagination: const SwiperPagination(),
                ),
              ),
              SizedBox(
                height: 800,
                child: ListTile(
                  title: Text(resultString),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
