import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  late final scrollController = ScrollController();
  var isLoading = false;
  var isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;

    super.dispose();
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 2000));

    if (!isMounted) return;

    setState(() {
      addFiveImages();
      isLoading = false;
    });

    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      // 0, // moves to the start of the list view
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future<void> refreshImages() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!isMounted) return;

    final lastId = imagesIds.last;

    imagesIds.clear();

    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: refreshImages,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            itemCount: imagesIds.length,
            controller: scrollController,
            itemBuilder: (context, index) {
              return FadeInImage(
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300',
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh),
              )
            : FadeIn(
                child: const Icon(Icons.chevron_left),
              ),
      ),
    );
  }
}
