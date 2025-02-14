import 'package:flutter/material.dart';

enum IncomeCategory{
  freelance,
  salary,
  passive,
  sales,
}

//category images
final Map<IncomeCategory , String>incomeCategoryImages = {
  IncomeCategory.freelance:"assets/images/freelance.png",
  IncomeCategory.salary:"assets/images/salary.png",
  IncomeCategory.passive:"assets/images/car.png",
  IncomeCategory.sales:"assets/images/onboard_3.png",
};

//Category Colors
final Map<IncomeCategory , Color>incomeCategoryColor = {
  IncomeCategory.freelance: Color(0xffe57373),
  IncomeCategory.salary: Color(0xff00A86B),
  IncomeCategory.passive: Color(0xff64b5f6),
  IncomeCategory.sales: Color(0xffffd45f),
};
class Income{
  final int id;
  final String title;
  final double amount;
  final IncomeCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income(
    {required this.id, 
    required this.title, 
    required this.amount, 
    required this.category, 
    required this.date, 
    required this.time, 
    required this.description}
  );

  //Covert the Income object in to ajson object
  Map<String, dynamic>toJSON(){
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category.index,
      'date':date.toIso8601String(),
      'time':time.toIso8601String(),
      'description': description,
    };
  }

  //Create  a Income object from a JSON object
  factory Income.fromJSON(Map<String, dynamic> json){
    return Income(
      id: json['id'], 
      title: json['title'], 
      amount: json['amount'], 
      category: IncomeCategory.values[json['category']], 
      date: DateTime.parse(json['date']), 
      time: DateTime.parse(json['time']), 
      description: json['description'],
    );
  }
}