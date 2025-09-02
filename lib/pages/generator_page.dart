import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import '../assets/app_background.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final GlobalKey _globalKey = GlobalKey();
  String _generatedCode = '';
  bool _isQrCode = true;
  final double _scrollOffset = 0.0;

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
    _textController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _generateCode() {
    setState(() {
      _generatedCode = _textController.text;
    });
  }

  void _selectQrCode() {
    setState(() {
      _isQrCode = true;
      _generatedCode = _textController.text;
    });
  }

  void _selectBarcode() {
    setState(() {
      _isQrCode = false;
      _generatedCode = _textController.text;
    });
  }

  Future<void> _saveImage() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        RenderRepaintBoundary boundary = _globalKey.currentContext!
            .findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage();
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();

        final result =
            await ImageGallerySaver.saveImage(pngBytes, quality: 100);

        if (mounted) {
          if (result['isSuccess'] == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Kod został zapisany!')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Błąd podczas zapisu.')),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Wystąpił błąd: $e')),
          );
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Brak uprawnień do zapisu.')),
        );
      }
      openAppSettings();
    }
  }

  bool _isValidBarcodeData(String data) {
    if (data.isEmpty) {
      return false;
    }
    final pattern =
        RegExp(r'^[a-zA-Z0-9\s!@#$%^&*()_+\-=\[\]{}|\\;:"<>,./?`~]*$');
    return pattern.hasMatch(data);
  }

  Widget _buildBarcodeWidget() {
    if (_isValidBarcodeData(_generatedCode)) {
      return BarcodeWidget(
        barcode: Barcode.code128(),
        data: _generatedCode,
        width: 200,
        height: 80,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      );
    } else {
      return const Text(
        'Kod kreskowy nie może zawierać polskich znaków.',
        style: TextStyle(fontSize: 14, color: Colors.black),
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          AppBackground(animation: _animation, scrollOffset: _scrollOffset),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Wprowadź treść',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    style: const TextStyle(color: Colors.white),
                    onChanged: (_) => _generateCode(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildGradientButton(
                        'QR Code',
                        _isQrCode,
                        _selectQrCode,
                        Alignment.topLeft,
                      ),
                      _buildGradientButton(
                        'Kod Kreskowy',
                        !_isQrCode,
                        _selectBarcode,
                        Alignment.bottomRight,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (_generatedCode.isNotEmpty)
                    RepaintBoundary(
                      key: _globalKey,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _isQrCode
                            ? QrImageView(
                                data: _generatedCode,
                                version: QrVersions.auto,
                                size: 200.0,
                                backgroundColor: Colors.white,
                              )
                            : _buildBarcodeWidget(),
                      ),
                    ),
                  if (_generatedCode.isEmpty)
                    const Text(
                      'Wprowadź tekst, aby wygenerować kod',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  if (_generatedCode.isNotEmpty)
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        _buildSaveButton(),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientButton(
    String label,
    bool isActive,
    VoidCallback onPressed,
    Alignment alignment,
  ) {
    const Color mainColor = Color(0xCC00F0FF);
    const Color secondaryColor = Color.fromARGB(255, 24, 255, 151);

    return InkWell(
      onTap: onPressed,
      child: Container(
        constraints: const BoxConstraints(minWidth: 150.0, minHeight: 45.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.white54, width: 1),
          gradient: isActive
              ? LinearGradient(
                  begin: alignment,
                  end: alignment == Alignment.topLeft
                      ? Alignment.bottomRight
                      : Alignment.topLeft,
                  colors: const [mainColor, secondaryColor],
                )
              : LinearGradient(
                  begin: alignment,
                  end: alignment == Alignment.topLeft
                      ? Alignment.bottomRight
                      : Alignment.topLeft,
                  colors: [
                    if (alignment == Alignment.topLeft)
                      mainColor.withOpacity(0.0),
                    if (alignment == Alignment.bottomRight)
                      secondaryColor.withOpacity(0.0),
                    Colors.transparent,
                    if (alignment == Alignment.topLeft)
                      mainColor.withOpacity(0.0),
                    if (alignment == Alignment.bottomRight)
                      secondaryColor.withOpacity(0.0),
                  ],
                ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: 150,
      height: 45,
      child: ElevatedButton(
        onPressed: _saveImage,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5,
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xCC00F0FF),
                Color.fromARGB(255, 24, 255, 151),
              ],
            ),
          ),
          child: Container(
            constraints: const BoxConstraints(minWidth: 150.0, minHeight: 45.0),
            alignment: Alignment.center,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.save, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Zapisz',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
