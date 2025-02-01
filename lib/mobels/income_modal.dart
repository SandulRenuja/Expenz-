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
    required this.description});
}