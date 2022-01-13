import 'package:carousel_slider/carousel_slider.dart';
import 'package:desafio_supera_flutter/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderGames extends StatefulWidget {
  const CarouselSliderGames({Key? key}) : super(key: key);

  @override
  _CarouselSliderGamesState createState() => _CarouselSliderGamesState();
}

class _CarouselSliderGamesState extends State<CarouselSliderGames> {
  int activeIndex = 0;
  List<Card> _carouselCards() {
    List<Card> carouselCards = dummyCarouselItems
        .map(
          (carouselItem) => Card(
            elevation: 5,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/carousel/${carouselItem.image}',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 15,
                        left: 15,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: Colors.black45,
                          child: Text(
                            carouselItem.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
    return carouselCards;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.3,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          items: _carouselCards(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: dummyCarouselItems.length,
            effect: WormEffect(
              radius: 6,
              dotWidth: 10,
              dotHeight: 10,
            ),
          ),
        ),
      ],
    );
  }
}
