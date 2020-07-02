import 'package:flutter/material.dart';

class TimerComponent extends StatefulWidget {
  DateTime date;
  ValueChanged<DateTime> onSelectendTime;
  TimerComponent({
    Key key,
    this.date,
    this.onSelectendTime,
  }) : super(key: key);

  @override
  _TimerComponentState createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
  final List<String> _horurs = List.generate(24, (index) => index++).map((h) => '${h.toString().padLeft(2, '0')}').toList();
  final List<String> _min = List.generate(60, (index) => index++).map((m) => '${m.toString().padLeft(2, '0')}').toList();
  final List<String> _sec = List.generate(60, (index) => index++).map((s) => '${s.toString().padLeft(2, '0')}').toList();

  var _horurSelectend = '00';
  var _minSelectend = '00';
  var _secSelectend = '00';

  void invokeCallback() {
    var newDate = DateTime(
      widget.date.year,
      widget.date.month,
      widget.date.day,
      int.parse(_horurSelectend),
      int.parse(_minSelectend),
      int.parse(_secSelectend),
    );
    widget.onSelectendTime(newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildBox(_horurs, (String value) {
          setState(() {
            _horurSelectend = value;
            invokeCallback();
          });
        }),
        _buildBox(_min, (String value) {
          setState(() {
            _minSelectend = value;
            invokeCallback();
          });
        }),
        _buildBox(_sec, (String value) {
          setState(() {
            _secSelectend = value;
            invokeCallback();
          });
        }),
      ],
    );
  }

  Widget _buildBox(List<String> options, ValueChanged<String> onChange) {
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
        onSelectedItemChanged: (value) => onChange(value.toString().padLeft(2, '0')),
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
