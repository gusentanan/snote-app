import 'package:flutter/material.dart';
import 'package:mynotes/utils/constants.dart';

class CustomToast extends StatelessWidget {
  final String msg;
  final bool isError;

  CustomToast({required this.msg, required this.isError});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: cNotSoBlack.withOpacity(0.25),
                  blurRadius: 6,
                  spreadRadius: 1),
            ],
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: isError
                      ? Colors.red.withOpacity(0.5)
                      : Colors.green.withOpacity(0.5),
                  shape: BoxShape.circle),
              child: Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.only(
                    left: 4, right: 5.5, top: 4, bottom: 4),
                decoration: BoxDecoration(
                  color: isError ? Colors.red : Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    isError ? Icons.close : Icons.done_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                msg,
                style: sSubheader,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
