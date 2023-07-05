import 'package:flutter/cupertino.dart';

class AppShadow {
  static BoxShadow blueShadow = BoxShadow(
    offset: Offset(0,10),
    color: Color(0xFF95ADFE).withOpacity(0.3),
    blurRadius: 22,
  );
  static BoxShadow purpleShadow = BoxShadow(
    offset: Offset(0,10),
    color: Color(0xFFC58BF2).withOpacity(0.3),
    blurRadius: 22,
  );
  static BoxShadow cardShadow = BoxShadow(
    offset: Offset(0,10),
    color: Color(0xFF1D1617).withOpacity(0.1),
    blurRadius: 40,
  );
}
