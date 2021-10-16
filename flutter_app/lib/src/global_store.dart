import 'package:flutter/material.dart';

class GlobalState extends ChangeNotifier {
  String _name = '';
  String _gender = 'male'; // todo: change this to enum
  int _age = 0;
  int _yearsEducated = 0;
  int _score = 0;

  // common methods

  void resetState () {
    _name = '';
    _gender = 'male';
    _age = 0;
    _yearsEducated = 0;
    _score = 0;
  }

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
    // DEBUG
    print('gender set to $_gender');
  }

  // age methods
  int getAge() {
    return _age;
  }

  void setAge(int age) {
    _age = age;
    notifyListeners();
    // DEBUG
    print('age set to $_age');
  }

  // yearsEducated methods

  int getYearsEducated() {
    return _yearsEducated;
  }

  void setYearsEducated(int yearsEdu) {
    _yearsEducated = yearsEdu;
    notifyListeners();
    // DEBUG
    print('yearsEducated set to $_yearsEducated');
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
    _score = _score + score;
    notifyListeners();
    // DEBUG
    print('score set to $_score');
  }
}
