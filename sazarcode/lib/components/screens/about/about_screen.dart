import 'package:flutter/material.dart';

import 'package:sazarcode/components/shared/circular_progress/circular_progress.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _SlidersView(),
            Center(
              child: Text('My knowledge'),
            )
          ],
        ),
      ),
    );
  }
}

class _SlidersView extends StatefulWidget {
  const _SlidersView();

  @override
  State<_SlidersView> createState() => _SlidersViewState();
}

class _SlidersViewState extends State<_SlidersView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation1;
  late Animation<Offset> slideAnimation2;
  late Animation<Offset> slideAnimation3;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    final slideTweenLeft = Tween<Offset>(
      begin: const Offset(-2.0, 0.0),
      end: const Offset(-1, 0.0),
    );

    final slideTweenRight = Tween<Offset>(
      begin: const Offset(2.0, 0.0),
      end: const Offset(1, 0.0),
    );

    slideAnimation1 = slideTweenLeft.animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.33),
      ),
    );
    slideAnimation2 = slideTweenRight.animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.33, 0.66),
      ),
    );
    slideAnimation3 = slideTweenLeft.animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.66, 0.99),
      ),
    );
    // Iniciar la animación con el método forward
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(),
        SlideTransition(
          position:
              slideAnimation1, // Usar la primera animación para el primer widget
          child: _CardTechDisplay(
            cardColor: Colors.indigo.withAlpha(180),
            colorsGradient: [
              Colors.indigo.shade900,
              Colors.indigo.shade500,
              Colors.indigo.shade300,
            ],
            title: 'Flutter',
            subtitle: 'Expert in in mobile applications.',
            image:
                'https://th.bing.com/th/id/R.8a50b602aa79b19775c22d02a290f51f?rik=czogydEprX9aOg&pid=ImgRaw&r=0',
            mainColorCircularProgress: Colors.indigo,
            backgroundColorCircularProgress: Colors.indigo.shade100,
            reversed: false,
            percent: 85,
          ),
        ),
        SlideTransition(
          position:
              slideAnimation2, // Usar la segunda animación para el segundo widget
          child: _CardTechDisplay(
            cardColor: Colors.red.withAlpha(180),
            colorsGradient: [
              Colors.red.shade500,
              Colors.red.shade700,
              Colors.red.shade900
            ],
            title: 'Angular',
            subtitle: 'Noob in angular',
            image:
                'https://cdn.freebiesupply.com/logos/large/2x/angular-icon-1-logo-png-transparent.png',
            mainColorCircularProgress: Colors.red,
            backgroundColorCircularProgress: Colors.red.shade100,
            reversed: true,
            percent: 40,
          ),
        ),
        SlideTransition(
          position:
              slideAnimation3, // Usar la tercera animación para el tercer widget
          child: _CardTechDisplay(
            cardColor: Colors.green.withAlpha(180),
            colorsGradient: [
              Colors.green.shade500,
              Colors.green.shade700,
              Colors.green.shade900
            ],
            title: 'Django',
            subtitle: 'Strong backend',
            image:
                'https://nextsoftware.io/files/images/logos/main/django-logo.png',
            mainColorCircularProgress: Colors.green,
            backgroundColorCircularProgress: Colors.green.shade100,
            reversed: false,
            percent: 60,
          ),
        ),
      ],
    );
  }
}

class _CardTechDisplay extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String subtitle;
  final String image;
  final List<Color> colorsGradient;
  final Color backgroundColorCircularProgress;
  final Color mainColorCircularProgress;
  final bool reversed;
  final double percent;

  const _CardTechDisplay({
    required this.cardColor,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.colorsGradient,
    required this.backgroundColorCircularProgress,
    required this.mainColorCircularProgress,
    required this.reversed,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    var borderRadius = const BorderRadius.only(
      topRight: Radius.circular(300),
      bottomRight: Radius.circular(300),
      bottomLeft: Radius.circular(30),
      topLeft: Radius.circular(30),
    );

    if (reversed) {
      borderRadius = const BorderRadius.only(
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(300),
        topLeft: Radius.circular(300),
      );
    }

    return Container(
      width: 500,
      height: 230,
      decoration: BoxDecoration(color: cardColor, borderRadius: borderRadius),
      child: Row(
        children: [
          if (reversed)
            SizedBox(
              child: CircularProgress(
                newPercent: percent,
                widget: Image.network(
                  image,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: colorsGradient,
                  stops: const [0, 0.5, 1],
                ),
                backgroundColor: backgroundColorCircularProgress,
                mainColor: mainColorCircularProgress,
                primaryStrokeWidth: 40,
                backgroundStrokeWidth: 40,
              ),
            ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          if (!reversed)
            SizedBox(
              child: CircularProgress(
                newPercent: percent,
                widget: Image.network(
                  image,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: colorsGradient,
                  stops: const [0, 0.5, 1],
                ),
                backgroundColor: backgroundColorCircularProgress,
                mainColor: mainColorCircularProgress,
                primaryStrokeWidth: 40,
                backgroundStrokeWidth: 40,
              ),
            ),
        ],
      ),
    );
  }
}
