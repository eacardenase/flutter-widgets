import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
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

final _slides = <_SlideInfo>[
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

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageController = PageController(initialPage: 0);
  int activePage = 0;
  var endReached = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: _slides.length,
              onPageChanged: (value) {
                if (value == _slides.length - 1) {
                  endReached = true;
                }

                setState(() {
                  activePage = value;
                });
              },
              itemBuilder: (context, index) {
                final slide = _slides[index];

                return _Slide(slideInfo: slide);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Positioned(
              top: 10,
              right: 10,
              child: TextButton(
                onPressed: () => context.pop(),
                child: const Text('Skip'),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  _slides.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: activePage == index
                            ? Theme.of(context).colorScheme.primary
                            : Colors.black26,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            endReached
                ? Positioned(
                    bottom: 30,
                    right: 30,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(milliseconds: 500),
                      child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Start'),
                      ),
                    ),
                  )
                : const SizedBox()
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
