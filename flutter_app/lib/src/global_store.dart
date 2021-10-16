import 'package:flutter/material.dart';

class GlobalState extends ChangeNotifier {
  String _name = '';
  String _gender = ''; // todo: change this to enum
  int _yearsEducated = 0;
  int _score = 0;

  // name methods

  String getName() {
    return _name;
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  // gender methods
  String getGender() {
    return _gender;
  }

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  // yearsEducated methods

  int getYearsEducated() {
    return _yearsEducated;
  }

  void setYearsEducated(int yearsEdu) {
    _yearsEducated = yearsEdu;
  }

  // score methods

  int getScore() {
    return _score;
  }

  void setScore(int score) {
    _score = score;
    notifyListeners();
  }

  void addToScore(int score) {
    _score += score;
  }
}
