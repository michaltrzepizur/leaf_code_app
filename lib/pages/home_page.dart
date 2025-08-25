import 'package:flutter/material.dart';
import '../assets/app_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// 🔹 Tło wydzielone do osobnego pliku
          AppBackground(animation: _animation),

          /// 🔹 Pulsujący przycisk w centrum
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyanAccent.withOpacity(0.5),
                        blurRadius: 100,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: const [
                          Colors.transparent,
                          Color.fromARGB(255, 24, 255, 151),
                          Colors.transparent,
                        ],
                        stops: [
                          (_controller.value - 0.2).clamp(0.0, 1.0),
                          _controller.value,
                          (_controller.value + 0.2).clamp(0.0, 1.0),
                        ],
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.srcATop,
                    child: const Icon(
                      Icons.eco, // 👈 liść
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
