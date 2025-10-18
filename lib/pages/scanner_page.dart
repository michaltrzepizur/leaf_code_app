import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import do SystemChrome
import 'package:flutter_bloc/flutter_bloc.dart'; // Ważny import dla Cubita
import 'package:mobile_scanner/mobile_scanner.dart';

// Poprawne ścieżki bezwzględne, bo jesteśmy w lib/pages/
import 'package:leaf_code_app/assets/app_background.dart';
import 'package:leaf_code_app/features/scanner/cubit/scanner_cubit.dart';
import 'package:leaf_code_app/features/scanner/cubit/scanner_state.dart';
import 'package:leaf_code_app/features/scanner/widgets/scan_result_display.dart';


// Zmieniamy z StatefulWidget na prosty StatelessWidget
class ScannerPage extends StatelessWidget {
   ScannerPage({super.key});

  // Usunięty 'const' z kontrolera, aby uniknąć błędu
  final MobileScannerController scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    formats: [BarcodeFormat.all],
    detectionTimeoutMs: 1000,
  );

  @override
  Widget build(BuildContext context) {
    // ⚠️ WAŻNE: Ustawiamy tryb pionowy tylko na tej stronie
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Pobieramy Cubit. Mamy pewność, że istnieje, bo wstrzyknęliśmy go w home_page.dart
    final ScannerCubit scannerCubit = context.read<ScannerCubit>();

    return BlocListener<ScannerCubit, ScannerState>(
      // BlocListener używamy do akcji jednorazowych (np. przejście na inną stronę, pokazanie snackbara)
      listener: (context, state) {
        // Tu na razie nie ma żadnej logiki jednorazowej, ale zostawiamy miejsce.
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Skaner Leaf Code',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Stack(
          children: [
            // Tło
            const AppBackground(
                scrollOffset: 0.0, animation: AlwaysStoppedAnimation(1.0)),

            // Warstwa UI z wyśrodkowanym skanerem
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Właściwy Skaner
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: MobileScanner(
                            controller: scannerController,
                            onDetect: (capture) {
                              final List<Barcode> barcodes = capture.barcodes;
                              for (final barcode in barcodes) {
                                if (barcode.rawValue != null) {
                                  // 🚀 KLUCZOWA ZMIANA: WYWOŁANIE CUBITA!
                                  scannerCubit.scanCode(barcode.rawValue!);
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

                    // 🎯 BlocBuilder do wyświetlania wyniku skanowania
                    BlocBuilder<ScannerCubit, ScannerState>(
                      builder: (context, state) {
                        // Dzięki FREEZED, możemy użyć eleganckiej metody 'when'
                        return state.when(
                          initial: () => const Text('Skanowanie...',
                              style: TextStyle(color: Colors.white)),
                          loading: () => const CircularProgressIndicator(
                              color: Colors.greenAccent),
                          failure: (message) => Text('Błąd: $message',
                              style: const TextStyle(color: Colors.red)),
                          success: (result) {
                            // Gdy Cubit osiągnie stan Success, używamy nowego widżetu
                            return ScanResultDisplay(result: result);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}