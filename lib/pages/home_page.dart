import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../assets/app_background.dart';
import '../features/generator/cubit/generator_page.dart';
import 'scanner_page.dart';
import '../features/scanner/cubit/scanner_cubit.dart';
import '../services/url_checker_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _dragPosition = 0.0;
  IconData centerIcon = Icons.eco;
  final double _swipeThreshold = 50.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPosition += details.delta.dy;
      if (_dragPosition < -_swipeThreshold) {
        centerIcon = Icons.edit;
      } else if (_dragPosition > _swipeThreshold) {
        centerIcon = Icons.camera_alt;
      } else {
        centerIcon = Icons.eco;
      }
    });
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
    if (_dragPosition < -_swipeThreshold) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const GeneratorPage()),
      );
    } else if (_dragPosition > _swipeThreshold) {
      // ZMIANA TUTAJ: Zastępujemy proste MaterialPageRoute zagnieżdżeniem w BlocProvider
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BlocProvider<ScannerCubit>(
            // Wstrzykujemy Serwis bezpieczeństwa do Cubita!
            create: (context) => ScannerCubit(
              UrlCheckerService(),
            ),
            child: ScannerPage(), // ScannerPage ma teraz dostęp do Cubita
          ),
        ),
      );
    }
    setState(() {
      _dragPosition = 0.0;
      centerIcon = Icons.eco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AppBackground(animation: _animation, scrollOffset: _dragPosition),
          Center(
            child: GestureDetector(
              onVerticalDragUpdate: _handleVerticalDragUpdate,
              onVerticalDragEnd: _handleVerticalDragEnd,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                transform: Matrix4.translationValues(0, _dragPosition, 0),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    final double lerpFactor = (_dragPosition.abs() > 0)
                        ? (_dragPosition.clamp(-120.0, 120.0) / 120.0 + 1) / 2
                        : _controller.value;

                    final Color glowColor = Color.lerp(
                      const Color(0xCC00F0FF),
                      const Color.fromARGB(255, 24, 255, 151),
                      lerpFactor,
                    )!;

                    return Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: glowColor.withOpacity(0.5),
                            blurRadius: 100,
                            // Używamy animation.value do pulsowania blasku
                            spreadRadius: _animation.value * 20,
                          ),
                        ],
                      ),
                      // 💡 Dodajemy Transform.scale z powrotem, by ikona "oddychała"
                      child: Transform.scale(
                        scale: _animation.value,
                        child: Icon(
                          centerIcon,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
