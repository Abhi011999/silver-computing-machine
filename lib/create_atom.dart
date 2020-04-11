library create_atom;

import 'package:flutter/material.dart';

import 'electrons_anim.dart';

class Atom extends StatefulWidget {
  // Scale
  final double scale;

  // Dimensions
  final double containerSize;
  final double nucleusSize;
  final double electronSize;
  final double orbitWidth;
  final double orbitHeight;
  final double orbitAnimEndHeight;
  final double orbitAnimEndHeightFactor;

  // Angles
  final double orbit1Angle;
  final double orbit2Angle;
  final double orbit3Angle;

  // Colors
  final Color nucleusColor;
  final Color orbitsColor;
  final Color electronsColor;

  // Durations
  final Duration animDuration1;
  final Duration animDuration2;
  final Duration animDuration3;

  Atom({
    this.scale = 1.0,
    this.orbit1Angle = 0.0,
    this.orbit2Angle = 45.0,
    this.orbit3Angle = -45.0,
    this.nucleusColor = Colors.black,
    this.orbitsColor = Colors.black,
    this.electronsColor = Colors.black,
    this.animDuration1 = const Duration(milliseconds: 1000),
    this.animDuration2 = const Duration(milliseconds: 2000),
    this.animDuration3 = const Duration(milliseconds: 3000),
  })  : containerSize = 215.0,
        nucleusSize = 20.0,
        electronSize = 15.0,
        orbitWidth = 107.5, // orbitWidth = containerSize / 2.0
        orbitHeight =
            207.5, // orbitHeight = containerSize - (electronSize / 2.0)
        orbitAnimEndHeight =
            200.0, // orbitAnimEndHeight = containerSize - electronSize
        orbitAnimEndHeightFactor =
            100.0; // orbitAnimEndHeightFactor = orbitAnimEndHeight / 2.0

  @override
  State<StatefulWidget> createState() => _AtomState();
}

class _AtomState extends State<Atom> {
  Widget _orbit() {
    return Center(
      child: Container(
        width: widget.orbitWidth,
        height: widget.orbitHeight,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.orbitsColor,
              width: widget.electronSize / 4.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.elliptical(widget.orbitWidth, widget.orbitHeight),
            ),
          ),
        ),
      ),
    );
  }

  Widget _nucleus() {
    return Center(
      child: Container(
        width: widget.nucleusSize,
        height: widget.nucleusSize,
        decoration: BoxDecoration(
          color: widget.nucleusColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Transform.scale( 
      scale: widget.scale,
      child: Container(
        width: widget.containerSize,
        height: widget.containerSize,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            _nucleus(),
            Transform.rotate(
              angle: widget.orbit1Angle,
              child: _orbit(),
            ),
            Transform.rotate(
              angle: widget.orbit2Angle,
              child: _orbit(),
            ),
            Transform.rotate(
              angle: widget.orbit3Angle,
              child: _orbit(),
            ),
            ElectronsAnim(widget),
          ],
        ),
      ),
    );
  }
}
