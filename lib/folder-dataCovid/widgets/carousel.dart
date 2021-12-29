import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DataCovidCarousel extends StatefulWidget {
  const DataCovidCarousel({Key? key}) : super(key: key);

  @override
  _DataCovidCarousel createState() => _DataCovidCarousel();
}

class _DataCovidCarousel extends State<DataCovidCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(height: 115.0),
        items: [
          "assets/images/carousel1.jpg",
          "assets/images/carousel2.jpg",
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(),
                child: Image.asset("$i"),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
