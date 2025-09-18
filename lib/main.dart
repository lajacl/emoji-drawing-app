import 'package:flutter/material.dart';

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
