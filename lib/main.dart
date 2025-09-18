import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const PainterDropdownDemo());
}

class PainterDropdownDemo extends StatefulWidget {
  const PainterDropdownDemo({super.key});

  @override
  State<PainterDropdownDemo> createState() => _PainterDropdownDemoState();
}

class _PainterDropdownDemoState extends State<PainterDropdownDemo> {
  String _selected = 'Smiley'; // default choice

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double painterSize = screenWidth * 2 / 3;

    CustomPainter painter;
    switch (_selected) {
      case 'Heart':
        painter = HeartPainter();
        break;
      case 'Party':
        painter = PartyFacePainter();
        break;
      case 'Smiley':
      default:
        painter = SmileyFacePainter();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Choose an Emoji to Draw")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Dropdown
          DropdownButton<String>(
            value: _selected,
            items: const [
              DropdownMenuItem(value: 'Smiley', child: Text('😊 Smiley Face')),
              DropdownMenuItem(value: 'Heart', child: Text('❤️ Heart')),
              DropdownMenuItem(value: 'Party', child: Text('🥳 Party Face')),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => _selected = value);
              }
            },
          ),

          const SizedBox(height: 100),

          // Show chosen drawing
          Center(
            child: SizedBox(
              width: painterSize,
              height: painterSize,
              child: CustomPaint(painter: painter),
            ),
          ),
        ],
      ),
    );
  }
}

class ShapesDemoApp extends StatelessWidget {
  const ShapesDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shapes Drawing Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const PainterDropdownDemo(),
    );
  }
}

class ShapesDemoScreen extends StatelessWidget {
  const ShapesDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shapes Drawing Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PainterDropdownDemo(),
            const SizedBox(height: 20),
            const Text(
              'Smiley Face',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: SmileyFacePainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Heart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: HeartPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Party Face',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: PartyFacePainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Task 1: Basic Shapes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: CustomPaint(
                painter: BasicShapesPainter(),
                size: const Size(double.infinity, 200),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Task 2: Combined Shapes (Abstract Design)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: CombinedShapesPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Task 3: Styled Shapes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: StyledShapesPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Determine the center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final squareOffset = Offset(centerX - 80, centerY);
    final circleOffset = Offset(centerX, centerY);
    final arcOffset = Offset(centerX + 80, centerY);
    final rectOffset = Offset(centerX - 160, centerY);
    final lineStart = Offset(centerX - 200, centerY - 50);
    final lineEnd = Offset(centerX - 140, centerY + 50);
    final ovalOffset = Offset(centerX + 160, centerY);

    // Draw a square
    final squarePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(center: squareOffset, width: 60, height: 60),
      squarePaint,
    );

    // Draw a circle
    final circlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(circleOffset, 30, circlePaint);

    // Draw an arc
    final arcPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(
      Rect.fromCenter(center: arcOffset, width: 60, height: 60),
      0, // start angle in radians
      2.1, // sweep angle in radians (about 120 degrees)
      false, // whether to use center
      arcPaint,
    );

    // Draw a rectangle
    final rectPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(center: rectOffset, width: 80, height: 40),
      rectPaint,
    );

    // Draw a line
    final linePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 3;
    canvas.drawLine(lineStart, lineEnd, linePaint);

    // Draw an oval
    final ovalPaint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(center: ovalOffset, width: 80, height: 40),
      ovalPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CombinedShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Background gradient
    final backgroundGradient = RadialGradient(
      center: Alignment.center,
      radius: 0.8,
      colors: [Colors.blue.shade100, Colors.white],
    );
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..shader = backgroundGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        ),
    );

    // Draw a sun (circle with rays)
    final sunPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX, centerY - 40), 40, sunPaint);

    // Sun rays (lines)
    final rayPaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 3;
    for (int i = 0; i < 8; i++) {
      final angle = i * (pi / 4); // Use pi from dart:math
      final dx = cos(angle) * 60;
      final dy = sin(angle) * 60;
      canvas.drawLine(
        Offset(centerX, centerY - 40),
        Offset(centerX + dx, centerY - 40 + dy),
        rayPaint,
      );
    }

    // Draw a house (square with triangle roof)
    final housePaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX, centerY + 40),
        width: 80,
        height: 80,
      ),
      housePaint,
    );

    final roofPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    final roofPath = Path()
      ..moveTo(centerX - 60, centerY)
      ..lineTo(centerX + 60, centerY)
      ..lineTo(centerX, centerY - 60)
      ..close();
    canvas.drawPath(roofPath, roofPaint);

    // Draw a door (rectangle)
    final doorPaint = Paint()
      ..color = Colors.blueGrey
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX, centerY + 60),
        width: 30,
        height: 50,
      ),
      doorPaint,
    );

    // Draw windows (squares)
    final windowPaint = Paint()
      ..color = Colors.blue.shade200
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX - 25, centerY + 20),
        width: 20,
        height: 20,
      ),
      windowPaint,
    );
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX + 25, centerY + 20),
        width: 20,
        height: 20,
      ),
      windowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class StyledShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw a gradient-filled rectangle
    final rectGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Colors.red, Colors.blue],
    );
    final rect = Rect.fromCenter(
      center: Offset(centerX, centerY - 100),
      width: 200,
      height: 60,
    );
    canvas.drawRect(
      rect,
      Paint()
        ..shader = rectGradient.createShader(rect)
        ..style = PaintingStyle.fill,
    );

    // Draw a circle with a border
    final circlePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    final circleBorderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(centerX - 80, centerY), 40, circlePaint);
    canvas.drawCircle(Offset(centerX - 80, centerY), 40, circleBorderPaint);

    // Draw a transparent oval
    final ovalPaint = Paint()
      ..color = Colors.purple.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX + 80, centerY),
        width: 100,
        height: 60,
      ),
      ovalPaint,
    );

    // Draw a dashed line using a custom path effect
    final dashPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // We draw a series of short lines and spaces
    final path = Path();
    double startX = centerX - 100;
    const dashLength = 10.0;
    const spaceLength = 5.0;
    while (startX < centerX + 100) {
      path.moveTo(startX, centerY + 80);
      path.lineTo(min(startX + dashLength, centerX + 100), centerY + 80);
      startX += dashLength + spaceLength;
    }
    canvas.drawPath(path, dashPaint);

    // Draw a gradient arc
    final arcGradient = SweepGradient(
      center: Alignment.centerRight,
      startAngle: 0,
      endAngle: pi, // Use pi from dart:math
      colors: [Colors.red, Colors.yellow, Colors.green],
    );
    final arcRect = Rect.fromCenter(
      center: Offset(centerX, centerY + 100),
      width: 120,
      height: 120,
    );
    final arcPaint = Paint()
      ..shader = arcGradient.createShader(arcRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(centerX, centerY + 100),
        width: 100,
        height: 100,
      ),
      0, // start angle
      2.5, // sweep angle
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SmileyFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw a circle with a border for face
    final circlePaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    final circleBorderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(centerX, centerY), 100, circlePaint);
    canvas.drawCircle(Offset(centerX, centerY), 100, circleBorderPaint);

    // Draw a circle eye
    final lEyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX - 40, centerY - 30), 15, lEyePaint);

    // Draw a circle eye
    final rEyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX + 40, centerY - 30), 15, rEyePaint);

    // Draw an arc
    final smilePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(centerX, centerY + 30),
        width: 100,
        height: 80,
      ),
      0, // start angle in radians
      3.1, // sweep angle in radians (about 120 degrees)
      false, // whether to use center
      smilePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw left circle
    final lCirclePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX - 50, centerY - 80), 60, lCirclePaint);

    // Draw right circle
    final rCirclePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX + 50, centerY - 80), 60, rCirclePaint);

    // Draw a triangle
    final trianglePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    final trianglePath = Path()
      ..moveTo(centerX - 105, centerY - 55)
      ..lineTo(centerX + 105, centerY - 55)
      ..lineTo(centerX, centerY + 100)
      ..close();
    canvas.drawPath(trianglePath, trianglePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class PartyFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final confettiSize = 10.0;

    // Draw a circle with a border for face
    final facePaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    final faceBorderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(centerX, centerY), 100, facePaint);
    canvas.drawCircle(Offset(centerX, centerY), 100, faceBorderPaint);

    // Draw an eye
    final eyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX - 35, centerY - 30),
        width: 20,
        height: 30,
      ),
      eyePaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX + 35, centerY - 30),
        width: 20,
        height: 30,
      ),
      eyePaint,
    );

    // Draw an arc
    // final smilePaint = Paint()
    //   ..color = Colors.black
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 5;
    // canvas.drawArc(
    //   Rect.fromCenter(
    //     center: Offset(centerX, centerY + 30),
    //     width: 100,
    //     height: 80,
    //   ),
    //   0, // start angle in radians
    //   3.1, // sweep angle in radians (about 120 degrees)
    //   false, // whether to use center
    //   smilePaint,
    // );

    final mouthPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX, centerY + 50),
        width: 30,
        height: 35,
      ),
      mouthPaint,
    );

    final hatPaint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill;
    final hatPath = Path()
      ..moveTo(centerX - 80, centerY - 60)
      ..lineTo(centerX, centerY - 100)
      ..lineTo(centerX - 80, centerY - 150)
      ..close();
    canvas.drawPath(hatPath, hatPaint);

    // Draw a circle confetti pieces
    final cConfettiPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(centerX + 50, centerY - 120),
      confettiSize / 2,
      cConfettiPaint,
    );
    cConfettiPaint.color = Colors.green;
    canvas.drawCircle(
      Offset(centerX - 120, centerY - 90),
      confettiSize / 2,
      cConfettiPaint,
    );
    cConfettiPaint.color = Colors.orange;
    canvas.drawCircle(
      Offset(centerX - 150, centerY - 75),
      confettiSize / 2,
      cConfettiPaint,
    );
    cConfettiPaint.color = Colors.purple;
    canvas.drawCircle(
      Offset(centerX + 130, centerY - 100),
      confettiSize / 2,
      cConfettiPaint,
    );
    cConfettiPaint.color = Colors.red;
    canvas.drawCircle(
      Offset(centerX + 140, centerY - 60),
      confettiSize / 2,
      cConfettiPaint,
    );

    // Draw a rectangle confetti pieces
    final rConfettiPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX - 140, centerY - 110),
        width: confettiSize,
        height: confettiSize,
      ),
      rConfettiPaint,
    );
    rConfettiPaint.color = Colors.green;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX + 170, centerY - 60),
        width: confettiSize,
        height: confettiSize,
      ),
      rConfettiPaint,
    );
    rConfettiPaint.color = Colors.orange;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX + 90, centerY - 85),
        width: confettiSize,
        height: confettiSize,
      ),
      rConfettiPaint,
    );
    rConfettiPaint.color = Colors.pink;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX - 130, centerY - 60),
        width: confettiSize,
        height: confettiSize,
      ),
      rConfettiPaint,
    );
    rConfettiPaint.color = Colors.purple;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX - 100, centerY - 120),
        width: confettiSize,
        height: confettiSize,
      ),
      rConfettiPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
