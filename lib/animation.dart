import 'dart:async';
import 'dart:math';

import 'package:cat1/homePage.dart';
import 'package:flutter/material.dart';

const pal = [0XFFF2387C, 0XFF05C7F2, 0XFF04D9C4, 0XFFF2B705, 0XFFF26241];

class MyApp extends StatelessWidget {
  final List<DataItem> dataset = [
    DataItem(0.1, "Pollo", Color(pal[0])),
    DataItem(0.1, "Pizza ", Color.fromARGB(255, 10, 44, 103)),
    DataItem(0.1, "Hamburguesa ", Color(pal[2])),
    DataItem(0.055, "Bebidas", Color(pal[3])),
    DataItem(0.2, "Postres", Color(pal[4])),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Container(
        child: DonutCharWidget(dataset),
      ),
    );
  }
}

class DataItem {
  late final double value;
  late final String label;
  late final Color color;
  DataItem(this.value, this.label, this.color);
}

class DonutCharWidget extends StatefulWidget {
  final List<DataItem> dataset;
  DonutCharWidget(this.dataset);

  @override
  State<DonutCharWidget> createState() => _DonutCharWidgetState();
}

class _DonutCharWidgetState extends State<DonutCharWidget> {
  late Timer timer;
  double fullAngle = 0.0;
  double secondtoComplete = 5.0;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 5000 ~/ 60), (timer) {
      setState(() {
        fullAngle += 360 / (secondtoComplete * 1000 ~/ 60);
        if (fullAngle >= 360.0) {
          fullAngle = 360.0;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 225.0,
        ),
        CustomPaint(
          child: Container(),
          painter: DonutChartPainter(widget.dataset, fullAngle),
        ),
      ],
    );
  }
}

final linepaint = Paint()
  ..color = Colors.white
  ..strokeWidth = 3.0
  ..style = PaintingStyle.stroke;
final midpaint = Paint()
  ..color = Colors.white
  ..style = PaintingStyle.fill;
const textfieldBigStyule = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);
const labelstyle = TextStyle(
  color: Colors.black,
//  fontWeight: FontWeight.bold,
  fontSize: 12.0,
);

class DonutChartPainter extends CustomPainter {
  final List<DataItem> dataset;
  final double fullAngle;
  DonutChartPainter(this.dataset, this.fullAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2.0, size.height / 2.0);
    final radius = size.width * 0.9;
    final rect = Rect.fromCenter(center: c, width: radius, height: radius);
    var startAngle = 0.0;
    canvas.drawArc(rect, startAngle, fullAngle * pi / 180, false, linepaint);
    dataset.forEach((di) {
      var sweepAngle = di.value * fullAngle * pi / 100.0;
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = di.color;
      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
      startAngle += sweepAngle;
    });
    startAngle = 0.00;
    dataset.forEach((di) {
      var sweepAngle = di.value * fullAngle * pi / 100.0;
// dibujar lineas
      final dx = radius / 2.0 * cos(startAngle);
      final dy = radius / 2.0 * sin(startAngle);
      final p2 = c + Offset(dx, dy);
      canvas.drawLine(c, p2, linepaint);
      startAngle += sweepAngle;
    });

    startAngle = 0.00;
    dataset.forEach((di) {
      var sweepAngle = di.value * fullAngle * pi / 100.0;
      drawLabels(canvas, c, radius, startAngle, sweepAngle, di.label);
      startAngle += sweepAngle;
    });

    // dibujar en medio
    canvas.drawCircle(c, radius * 0.3, midpaint);
    // dibujar titulo
    drawTextCenterd(canvas, c, "Categorias\nPreferidas", textfieldBigStyule,
        radius * 0.6, (Size sz) {});
  }

  TextPainter mesureText(
      String s, TextStyle style, double maxWidth, TextAlign align) {
    final span = TextSpan(text: s, style: style);
    final tp = TextPainter(
        text: span, textAlign: align, textDirection: TextDirection.ltr);
    //elipsis: ",,,"
    tp.layout(minWidth: 0, maxWidth: maxWidth);
    return tp;
  }

  Size drawTextCenterd(Canvas canvas, Offset position, String text,
      TextStyle style, double maxWidth, Function(Size sz) bgCb) {
    final tp = mesureText(text, style, maxWidth, TextAlign.center);
    final pos = position + Offset(-tp.width / 2.0, -tp.height / 2.0);
    bgCb(tp.size);
    tp.paint(canvas, pos);
    return tp.size;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  void drawLabels(Canvas canvas, Offset c, double radius, double startAngle,
      double sweepAngle, String label) {
    final r = radius * 0.4;
    final dx = r * cos(startAngle + sweepAngle / 2.0);
    final dy = r * sin(startAngle + sweepAngle / 2.0);
    final position = c + Offset(dx, dy);
    drawTextCenterd(canvas, position, label, labelstyle, 100.00, (Size sz) {
      final rect = Rect.fromCenter(
          center: position, width: sz.width + 5, height: sz.height + 5);
      final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(5));
      canvas.drawRRect(rrect, midpaint);
    });
  }
}
