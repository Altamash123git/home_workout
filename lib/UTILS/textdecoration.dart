import 'dart:ui';

import 'package:flutter/material.dart';

import 'appcolors.dart';

import 'package:flutter/material.dart';

TextStyle mTextStyle12({
  Color mcolor = const Color(0xff1e1e1e),
  mFontWeight = FontWeight.normal,
  mdecoration = TextDecoration.none,
}) {
  return TextStyle(
    fontSize: 16,
    fontWeight: mFontWeight,
    // color: mcolor,

    decoration: mdecoration,

    shadows: [
      Shadow(
        offset: Offset(-0.3, 2.0),
        blurRadius: 2.5,
        color: Colors.grey,
      )
    ],
  );
}

TextStyle mTextStyle16({
  Color mcolor = const Color(0xff1e1e1e),
  mFontWeight = FontWeight.w900,
  mdecoration = TextDecoration.none,
}) {
  return TextStyle(
    fontSize: 18,
    letterSpacing: 0.3,
    foreground: Paint()
      ..strokeCap = StrokeCap.round
      ..color = mcolor,
    fontWeight: mFontWeight,
    // color: mcolor,

    shadows: [
      Shadow(offset: Offset(0, 3.0), blurRadius: 1, color: Colors.grey)
    ],
  );
}

TextStyle mTextStyle14(
    {Color mcolor = const Color(0xff1e1e1e), mFontWeight = FontWeight.normal}) {
  return TextStyle(
    fontSize: 18,
    fontWeight: mFontWeight,
    // color: mcolor,

    //decoration: mdecoration,

    shadows: [
      Shadow(offset: Offset(0, 2.0), blurRadius: 4, color: Color(0xff000000))
    ],
  );
}

TextStyle mTextStyle18({
  Color mcolor = const Color(0xffAE0019),
  mFontWeight = FontWeight.w900,
}) {
  return TextStyle(color: mcolor, fontSize: 18, fontWeight: FontWeight.w900);
}

TextStyle DrawerTextStyle(
    {Color mcolor = const Color(0xff1e1e1e),
    mFontWeight = FontWeight.w700,
    mfontSize = 18.0}) {
  return TextStyle(
    color: mcolor,
    fontWeight: mFontWeight,
    fontSize: mfontSize,
  );
}

TextStyle HomeTextStyle(
    {Color mcolor = const Color(0xff1e1e1e),
    mFontWeight = FontWeight.w900,
    mfontSize = 22.0}) {
  return TextStyle(
    color: mcolor,
    fontSize: mfontSize,
    fontWeight: FontWeight.w700,
    /*shadows: [
      Shadow(
          offset: Offset(0, 2.5),
          blurRadius: 4,



          color: Colors.grey


      )
    ],*/
  );
}

TextStyle profileTextStyle(
    {Color mcolor = const Color(0xff1e1e1e),
    mFontWeight = FontWeight.w900,
    mfontSize = 18.0}) {
  return TextStyle(
    color: mcolor,
    fontSize: mfontSize,
    fontWeight: FontWeight.w700,
    /*shadows: [
      Shadow(
          offset: Offset(0, 2.5),
          blurRadius: 4,



          color: Colors.grey


      )
    ],*/
  );
}
//box-shadow: 0px 4px 4px 0px #00000040;
