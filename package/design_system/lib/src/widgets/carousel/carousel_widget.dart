import 'dart:async';

import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final List<Widget> widgets;
  const CarouselWidget({
    required this.widgets,
    super.key,
  });

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  List<Widget> get listWidget => widget.widgets;
  late PageController pageController;
  late Timer timer;

  List<Widget> get auxlistWidget => [
        if (listWidget.isNotEmpty) listWidget.last,
        ...listWidget,
        if (listWidget.isNotEmpty) listWidget.first,
      ];

  final indexCarousel = ValueNotifier<int>(1);

  @override
  void initState() {
    super.initState();

    if (auxlistWidget.isNotEmpty) {
      pageController = PageController(
        initialPage: 1,
      );
    }

    timer = Timer.periodic(
      const Duration(milliseconds: 2000),
      (timer) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInCubic,
        );
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 12),
          height: 200,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) async {
              if (0 == index) {
                indexCarousel.value = auxlistWidget.length - 2;
                await Future.delayed(const Duration(milliseconds: 300));
                pageController.jumpToPage(auxlistWidget.length - 2);
                return;
              }

              if (auxlistWidget.length - 1 == index) {
                indexCarousel.value = 1;
                await Future.delayed(const Duration(milliseconds: 300));
                pageController.jumpToPage(1);
                return;
              }

              indexCarousel.value = index;
            },
            itemBuilder: (_, index) {
              final widget = auxlistWidget[index];
              return widget;
            },
          ),
        ),
        ValueListenableBuilder<int>(
          valueListenable: indexCarousel,
          builder: (context, value, widget) {
            return SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: auxlistWidget.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const SizedBox();
                  }
                  if (index == (auxlistWidget.length - 1)) {
                    return const SizedBox();
                  }
                  return Center(
                    child: InkWell(
                      onTap: () {
                        pageController.animateToPage(index,
                            duration: const Duration(microseconds: 500),
                            curve: Curves.bounceIn);
                      },
                      child: SizedBox(
                        height: 6,
                        width: 15,
                        child: Center(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              color:
                                  value == index ? Colors.yellow : Colors.black,
                            ),
                            width: 10,
                            height: 3,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
