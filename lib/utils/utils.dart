import 'package:lpinyin/lpinyin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/colors.dart';

class Utils {
  static String getPinyin(String str) {
    return PinyinHelper.getShortPinyin(str).substring(0, 1).toUpperCase();
  }

  static Color getCircleBg(String str) {
    String pinyin = getPinyin(str);
    return getCircleAvatarBg(pinyin);
  }
  static Color getCircleAvatarBg(String key) {
    return circleAvatarMap[key];
  }
}
