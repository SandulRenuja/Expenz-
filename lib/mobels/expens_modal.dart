import 'package:flutter/material.dart';

enum ExpensCategory{
  shopping,
  subscriptions,
  food,
  health,
  transport,
}

//Category images
final Map<ExpensCategory, String>expenseCategoryImages = {
  ExpensCategory.food:"assets/images/restaurant.png",
  ExpensCategory.transport:"assets/images/car.png",
  ExpensCategory.health:"assets/images/health.png",
  ExpensCategory.shopping:"assets/images/bag.png",
  ExpensCategory.subscriptions:"assets/images/bill.png",
};

//Categoty Color
final Map <ExpensCategory,Color>expenseCAtegoryColors ={
  ExpensCategory.food: Color(0xffe57373),
  ExpensCategory.transport:Color(0xff81c784),
  ExpensCategory.health:Color(0xff64b5f6),
  ExpensCategory.shopping:Color(0xffffd54f),
  ExpensCategory.subscriptions:Color(0xff9575cd),
};



//Modal
class Expense{
  final int id;
  final String title;
  final double amount;
  final ExpensCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expense({
    required this.id, 
    required this.title,
     required this.amount, 
     required this.category,
      required this.date,
      required this.time, 
      required this.description
      });


  //Convert the Expense Object to a JSON object
  Map<String, dynamic> toJSON(){
    return{
      'id': id,
      'title': title,
      'amount': amount,
      'category': category.index,
      'date':date.toIso8601String(),
      'time':time.toIso8601String(),
      'description': description,
    };
  }

  //Create an Expense object from a JSON object
  factory Expense.fromJSON(Map<String, dynamic> json){
    return Expense(
      id: json['id'], 
      title: json['title'], 
      amount: json['amount'], 
      category: ExpensCategory.values[json['category']], 
      date: DateTime.parse(json['date']), 
      time: DateTime.parse(json['time']), 
      description: json['description'],
    );
  }
}