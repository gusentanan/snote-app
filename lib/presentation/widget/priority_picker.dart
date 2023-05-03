import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynotes/utils/constants.dart';

class PriorityPicker extends StatefulWidget {
  final Function(int) onTap;
  final int? selectedIndex;

  PriorityPicker({required this.onTap, required this.selectedIndex});

  _PriorityPicker createState() => _PriorityPicker();
}

class _PriorityPicker extends State<PriorityPicker> {
  int? selectedIndex;
  List<String> priorityText = ['Easy', 'Medium', 'Hard'];
  List<Color> priorityColor = [colorPicker[2], colorPicker[1], colorPicker[0]];

  @override
  Widget build(BuildContext context) {
    selectedIndex ??= widget.selectedIndex;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onTap(index);
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                width: width / 3,
                height: 70,
                child: Container(
                  decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? priorityColor[index]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: selectedIndex == index
                          ? Border.all(width: 2, color: priorityColor[index])
                          : Border.all(width: 0, color: Colors.transparent)),
                  child: Center(
                    child: Text(priorityText[index],
                        style: TextStyle(
                            color:
                                selectedIndex == index ? cWhitey : cNotSoBlack,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
