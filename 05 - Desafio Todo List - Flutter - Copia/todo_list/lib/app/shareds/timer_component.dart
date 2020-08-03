import 'package:flutter/material.dart';

class TimerComponent extends StatefulWidget {
  @override
  _TimerComponentState createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
  @override
  Widget build(BuildContext context) {
    final List<String> _horurs = List.generate(24, (index) => index++).map((h) => '${h.toString().padLeft(2, '0')}').toList();
    final List<String> _min = List.generate(60, (index) => index++).map((m) => '${m.toString().padLeft(2, '0')}').toList();
    final List<String> _sec = List.generate(60, (index) => index++).map((s) => '${s.toString().padLeft(2, '0')}').toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildBox(_horurs),
        _buildBox(_min),
        _buildBox(_sec),
      ],
    );
  }

  Widget _buildBox(List<String> options) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(2, 5),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      child: ListWheelScrollView(
        itemExtent: 50,
        perspective: 0.01,
        offAxisFraction: 1.5,
        physics: FixedExtentScrollPhysics(),
        children: options
            .map((e) => Center(
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
