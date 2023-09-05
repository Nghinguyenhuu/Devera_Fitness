import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CustomRepetitions extends StatefulWidget {
  const CustomRepetitions({super.key});

  @override
  State<CustomRepetitions> createState() => _CustomRepetitionsState();
}

class _CustomRepetitionsState extends State<CustomRepetitions> {
  ScrollController controller = ScrollController();
  BehaviorSubject<int?> currentItemStream = BehaviorSubject();
  List<String> items = [''];

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
