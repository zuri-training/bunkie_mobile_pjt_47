import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:bunkie/views/shared/shared.dart';


class CircleAvatarCarousel extends StatefulWidget {
  final String images;

  const CircleAvatarCarousel({
    Key? key,
    required this.images,
  }) : super(key: key);
  _CircleAvatarCarouselState createState() => _CircleAvatarCarouselState();
}


class _CircleAvatarCarouselState extends State<CircleAvatarCarousel> {
  List _images = [];

  int currentIndex = 0;

  Future _initImages() async {
    final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
      .where((String key) => key.contains(widget.images)).toList();
    
    setState(() => _images = imagePaths);
  }
  
  @override
  void initState() {
    super.initState();
    _initImages();
  }

  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          child: CarouselSlider.builder(
            itemCount: _images.length,
            itemBuilder: (ctx, index, realIdx) {
              return GestureDetector(
                onTap: () {}, // TODO
                child: Container(
                  margin: EdgeInsets.all(6.0),

                  child: CircleAvatar(
                    minRadius: 50,
                    maxRadius: 70,
                    backgroundImage: AssetImage(
                      _images[index]
                    )
                  ),
                )
              );
            },
            options: CarouselOptions(
              onPageChanged: (int index, reason) {
                setState(() => currentIndex = index);
              },
              aspectRatio: 22 / 5,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.2,
              scrollPhysics: BouncingScrollPhysics()
            ),
          ),
        )
      ],
    );
  }
}
