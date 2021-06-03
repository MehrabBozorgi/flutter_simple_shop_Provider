import 'package:flutter/material.dart';

final FirstScreenCard1=RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(25),
);
final FirstScreenCard2=RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(25),
    bottomLeft: Radius.circular(25),
    topLeft: Radius.circular(5),
    topRight: Radius.circular(5),
  ),
);