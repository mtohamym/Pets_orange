import 'package:flutter/material.dart';

class Filters {
  List<String>? breed;
  List<String>? ages;
  List<String>? size;
  List<String>? goodWith;
  List<String>? gender;
  List<String>? colors;
  List<String>? hairLength;
  List<String>? behaviour;

  Filters(this.breed, this.ages, this.size, this.goodWith, this.gender,
      this.colors, this.hairLength, this.behaviour);

  Filters.fromJson(Map<String, dynamic> json) {
    breed = json['breed'].cast<String>();
    ages = json['ages'].cast<String>();
    size = json['size'].cast<String>();
    goodWith = json['goodWith'].cast<String>();
    colors = json['colors'].cast<String>();
    hairLength = json['hairLength'].cast<String>();
    behaviour = json['behaviour'].cast<String>();
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['breed'] = this.breed;
    data['ages'] = this.ages;
    data['size'] = this.size;
    data['goodWith'] = this.goodWith;
    data['gender'] = this.gender;
    data['colors'] = this.colors;
    data['hairLength'] = this.hairLength;
    data['behaviour'] = this.behaviour;
    return data;
  }



}

