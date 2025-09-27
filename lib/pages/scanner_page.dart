import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import do SystemChrome
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../assets/app_background.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String _scannedData = '';

  @override
  void initState() {
    super.initState();
    // Zablokowanie orientacji na pionową przy wejściu na stronę
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
    // Przywrócenie domyślnej orientacji (wszystkie) przy opuszczeniu strony
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Skaner',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Animowane tło
          AppBackground(animation: _animation, scrollOffset: 0.0),
          // Warstwa UI z wyśrodkowanym skanerem
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Skaner
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: MobileScanner(
                          controller: MobileScannerController(
                            detectionSpeed: DetectionSpeed.normal,
                            // Upewniamy się, że skaner obsługuje wszystkie formaty, w tym QR.
                            formats: const [BarcodeFormat.all],
                            detectionTimeoutMs: 1000,
                          ),
                          onDetect: (capture) {
                            final List<Barcode> barcodes = capture.barcodes;
                            for (final barcode in barcodes) {
                              if (barcode.rawValue != null) {
                                setState(() {
                                  _scannedData = barcode.rawValue!;
                                });
                              }
                            }
                          },
                        ),
                      ),
                      // Ramka na skaner
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _scannedData.isEmpty
                          ? 'Skanowanie...'
                          : 'Kod: $_scannedData',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
