import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class _SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  _SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <_SlideInfo>[
  _SlideInfo(
    title: 'Busca la comida',
    caption: 'Laboris consequat irure id minim sit eiusmod duis ea ut laborum.',
    imageUrl: 'assets/images/1.png',
  ),
  _SlideInfo(
    title: 'Entrega la comida',
    caption: 'Sint est fugiat incididunt esse nisi ullamco in.',
    imageUrl: 'assets/images/2.png',
  ),
  _SlideInfo(
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              physics: const BouncingScrollPhysics(),
              children: [
                for (var slide in slides) _Slide(slideInfo: slide),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => context.pop(),
                child: const Text('Skip'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final _SlideInfo slideInfo;

  const _Slide({
    required this.slideInfo,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(
                slideInfo.imageUrl,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              slideInfo.title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              slideInfo.caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
