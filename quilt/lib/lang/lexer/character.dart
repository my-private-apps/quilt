
import 'dart:io';

abstract class CurrentCharacter {
  static String character(String data, int position){
    if(data.length == position){
      return null;
    } else {
      return data[position];
    }
  }
}