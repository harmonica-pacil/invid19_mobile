import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class VaksinasiCarousel extends StatefulWidget {
  const VaksinasiCarousel({Key? key}) : super(key: key);

  @override
  _VaksinasiCarousel createState() => _VaksinasiCarousel();
}

class _VaksinasiCarousel extends State<VaksinasiCarousel> {
  final List<Widget> myData = [
    Stack(children: [
      Image.network(
          'https://media.discordapp.net/attachments/891854480679780423/903346278157672508/foto3.jpeg?width=1440&height=480'),
    ]),
    Stack(
      children: [
        Image.network(
            'https://media.discordapp.net/attachments/891854480679780423/903346429978902538/foto3.jpg?width=1440&height=480'),
        
      ],
    ),
    Stack(
      children: [
        Image.network(
            'https://media.discordapp.net/attachments/891854480679780423/903346278157672508/foto3.jpeg?width=1440&height=480'),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CarouselSlider(
          options: CarouselOptions(
            height: 140.0,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
          ),
          items: myData),
    ]);
  }
}
