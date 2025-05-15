import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Laboris ad tempor aute officia sunt cillum do amet non ad culpa sint pariatur magna. Exercitation aliquip deserunt minim ea ipsum ut. Irure commodo nisi mollit minim id. Et occaecat ea nostrud laboris eu tempor esse. Et pariatur amet cillum quis sunt elit reprehenderit ut reprehenderit quis consectetur eu eiusmod aliquip.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Enim adipisicing officia commodo anim laborum culpa sunt consectetur aliquip excepteur. Esse nisi culpa aute amet Lorem proident sunt et pariatur ipsum do. Cillum consequat sint mollit sint eiusmod qui consequat culpa. Pariatur laborum excepteur excepteur do enim occaecat.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Amet dolor quis magna deserunt enim irure culpa minim nisi occaecat pariatur ex duis. Reprehenderit exercitation eiusmod excepteur qui elit proident reprehenderit. Ullamco tempor dolor fugiat mollit ad ut exercitation dolore pariatur enim sunt voluptate. Voluptate fugiat proident cupidatat enim irure et nostrud aliqua exercitation laboris culpa ut. Et commodo dolore quis dolor duis excepteur Lorem cupidatat enim aute ex ipsum. Reprehenderit ullamco irure ea culpa nulla sunt reprehenderit esse. Et aliqua elit id cupidatat ipsum dolor irure.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
      // print('${pageviewController.page}');
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children:
                slides
                    .map(
                      (slideData) => _Slide(
                        title: slideData.title,
                        caption: slideData.caption,
                        imageUrl: slideData.imageUrl,
                      ),
                    )
                    .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),

          endReached
              ? Positioned(
                bottom: 30,
                right: 30,
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Comenzar'),
                ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertical alignment
          crossAxisAlignment: CrossAxisAlignment.start, // horizontal aligment
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
