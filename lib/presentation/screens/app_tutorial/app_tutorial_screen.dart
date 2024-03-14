import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption: 'Laboris consequat irure id minim sit eiusmod duis ea ut laborum.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Entrega la comida',
    caption: 'Sint est fugiat incididunt esse nisi ullamco in.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Disfruta tu pedido',
    caption: 'Exercitation commodo eiusmod proident qui cupidatat.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatelessWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: [
          for (var slide in slides) _Slide(slideInfo: slide),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slideInfo;

  const _Slide({
    required this.slideInfo,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
