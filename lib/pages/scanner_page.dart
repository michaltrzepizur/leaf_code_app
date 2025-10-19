import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:leaf_code_app/assets/app_background.dart';
import 'package:leaf_code_app/features/scanner/cubit/scanner_cubit.dart';
import 'package:leaf_code_app/features/scanner/cubit/scanner_state.dart';
import 'package:leaf_code_app/features/scanner/widgets/scan_result_display.dart';

class ScannerPage extends StatefulWidget {
  // 💡 ZMIANA: StatefulWidget
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

// 💡 NOWA KLASA STANU
class _ScannerPageState extends State<ScannerPage> {
  int _resetKey = 0;

  // 💡 ZMIANA: Kontroler musi być typu late, żebyśmy mogli go zresetować
  late MobileScannerController scannerController;

  // 💡 NOWA METODA: Do czystej inicjalizacji kontrolera
  void _initializeController() {
    scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      formats: [BarcodeFormat.all],
      detectionTimeoutMs: 1000,
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeController(); // Inicjalizujemy kontroler na start
  }

  // 💡 KRUCJALNA ZMIANA: ZAWSZE CZYŚCIMY KONTROLER PRZY OPUSZCZANIU STRONY!
  @override
  void dispose() {
    scannerController.dispose();
    super.dispose();
  }

  // 💡 Zostaw metodę _incrementResetKey na razie bez zmian, zmienimy ją w Kroku 2
  void _incrementResetKey() {
    setState(() {
      // 1. ZATRZYMUJEMY I CZYŚCIMY STARY KONTROLER
      scannerController.stop();
      scannerController.dispose();

      // 2. TWORZYMY NOWY KONTROLER I INICJALIZUJEMY GO
      _initializeController();

      // 3. ZMIENIAMY KLUCZ WIDŻETU (co wymusza rebuild MobileScanner)
      _resetKey++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ustawiamy tryb pionowy tylko na tej stronie
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Pobieramy Cubit
    final ScannerCubit scannerCubit = context.read<ScannerCubit>();

    return Scaffold(
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
                  // 🎯 BlocBuilder do wyświetlania skanera/wyniku
                  BlocBuilder<ScannerCubit, ScannerState>(
                    builder: (context, state) {
                      return state.when(
                        // Stan 'Initial' (lub po resecie)
                        initial: () {
                          // Jeśli jest stan initial, pokazujemy skaner
                          // i włączamy kontroler
                          return _buildScanner(scannerCubit);
                        },
                        // Stan 'Loading'
                        loading: () {
                          // Na czas ładowania zatrzymujemy kontroler skanera
                          scannerController.stop();
                          return _buildLoadingDisplay();
                        },
                        // Stan 'Success'
                        success: (result) {
                          // Jeśli sukces, zatrzymujemy kontroler, aby nie wariował
                          scannerController.stop();
                          return ScanResultDisplay(
                            result: result,
                            cubit:
                                scannerCubit, // Przekazujemy Cubita do przycisku reset
                          );
                        },
                        // Stan 'Failure'
                        failure: (message) {
                          // Jeśli błąd, zatrzymujemy kontroler
                          scannerController.stop();
                          return _buildFailureDisplay(message, scannerCubit);
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
    );
  }

  // --- WIDŻETY POMOCNICZE (aby kod był czytelniejszy) ---

  // Widżet Skanera
  Widget _buildScanner(ScannerCubit scannerCubit) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Właściwy Skaner
            SizedBox(
              width: 200,
              height: 200,
              child: MobileScanner(
                key: ValueKey(_resetKey),
                controller: scannerController,
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  for (final barcode in barcodes) {
                    if (barcode.rawValue != null) {
                      // 🚀 KLUCZOWA ZMIANA: WYWOŁANIE CUBITA!
                      // Cubit sam zdecyduje, czy skanowanie jest zablokowane
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
        const Text('Skanowanie...', style: TextStyle(color: Colors.white)),
      ],
    );
  }

  // Widżet Ładowania
  Widget _buildLoadingDisplay() {
    return const Column(
      children: [
        SizedBox(
            height: 100,
            child: CircularProgressIndicator(color: Colors.greenAccent)),
        SizedBox(height: 20),
        Text('Sprawdzanie kodu...', style: TextStyle(color: Colors.white)),
      ],
    );
  }

  // Widżet Błędu
  Widget _buildFailureDisplay(String message, ScannerCubit cubit) {
    return Column(
      children: [
        Text(
          'Błąd: $message',
          style: const TextStyle(color: Colors.red, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            cubit.resetScanner();
            _incrementResetKey();
          },
          icon: const Icon(Icons.restart_alt),
          label: const Text('Spróbuj ponownie'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
