import 'package:expenz/constant/colors.dart';
import 'package:expenz/constant/constant.dart';
import 'package:expenz/mobels/expens_modal.dart';
import 'package:expenz/mobels/income_modal.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AddnewScreen extends StatefulWidget {
  const AddnewScreen({super.key});

  @override
  State<AddnewScreen> createState() => _AddnewScreenState();
}

class _AddnewScreenState extends State<AddnewScreen> {

  //State tracke the selected Method Expense Or Income
  int _selectedMethode = 0;
  ExpensCategory _expensCategory = ExpensCategory.shopping;
  IncomeCategory _incomeCategory = IncomeCategory.freelance;
  final TextEditingController _titleController =TextEditingController();
  final TextEditingController _descriptionController =TextEditingController();
  final TextEditingController _amountController =TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethode == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              //expense and income toggle menu
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 28,
                  horizontal: 10,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethode = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethode == 0 ? kRed : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 55,
                              vertical: 10
                            ),
                            child: Text("Expense",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethode = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethode == 1 ? kGreen : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 55,
                              vertical: 10
                            ),
                            child: Text("Income",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        
              //Amount feild
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefalutPadding),
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height *0.12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("How Much?",
                      style: TextStyle(
                        color: kLightGrey.withOpacity(0.8),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                
                      const TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                        fontSize: 60,
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: "0",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                    ],
                  ),
                ),
              ),
        
              //User input data form
              Container(
                height: MediaQuery.of(context).size.height * 0.69,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3,
                ),
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    child: Column(
                      children: [
                        //Category DropDown
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: kDefalutPadding,
                              horizontal:20 ,
                            ),
                          ),
                          items: _selectedMethode ==0 ? ExpensCategory.values.map((category){
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            );
                          }).toList(): 
                          IncomeCategory.values.map((category){
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            );
                          }).toList(),
                          value: _selectedMethode ==0 ? _expensCategory:_incomeCategory ,
                          onChanged: (value){
                           setState(() {
                             _selectedMethode == 0 ? _expensCategory = 
                             value as ExpensCategory 
                             : _incomeCategory = value as IncomeCategory;
                           });
                          }),

                          const SizedBox(
                            height: 20,
                          ),

                          //Title field
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              hintText: "Title",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                              vertical: kDefalutPadding,
                              horizontal:20 ,
                            ),
                            ),
                          ),
                           const SizedBox(
                            height: 20,
                          ), 

                          //description feild
                          TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              hintText: "Description",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                              vertical: kDefalutPadding,
                              horizontal:20 ,
                            ),
                            ),
                          ),
                           const SizedBox(
                            height: 20,
                          ),

                          //Amount Field
                          TextFormField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Amount",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                              vertical: kDefalutPadding,
                              horizontal:20 ,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,), 

                       // Select Date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context, 
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2025), 
                                  lastDate: DateTime(2050),
                                ).then((value){
                                  if(value != null){
                                    setState(() {
                                      _selectedDate = value;
                                    });
                                    
                                  }
                                });
                              },  
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10
                                  ),
                                  child: Row(
                                   children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: kWhite,
                                    ),
                                    SizedBox(width: 10,),
                                    Text("Select Date",
                                    style: TextStyle(
                                      color: kWhite,
                                      fontSize: 16,                                    
                                      fontWeight: FontWeight.w500,
                                    ),
                                    ),
                                   ], 
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(_selectedDate),
                              style: const TextStyle(
                                color: kGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20,),

                        //Select Time
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context, 
                                  initialTime: TimeOfDay.now(),
                                ).then((value){
                                  if(value != null){
                                    setState(() {
                                      _selectedTime = DateTime(
                                      _selectedDate.year,
                                      _selectedDate.month,
                                      _selectedDate.day,
                                      value.hour,
                                      value.minute,
                                    );
                                  });
                                    
                                  }
                                });
                              },  
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kYellow,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10
                                  ),
                                  child: Row(
                                   children: [
                                    Icon(
                                      Icons.access_time_outlined,
                                      color: kWhite,
                                    ),
                                    SizedBox(width: 10,),
                                    Text("Select Time",
                                    style: TextStyle(
                                      color: kWhite,
                                      fontSize: 16,                                    
                                      fontWeight: FontWeight.w500,
                                    ),
                                    ),
                                   ], 
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.jm().format(_selectedTime),
                              style: const TextStyle(
                                color: kGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        const Divider(
                          color: kLightGrey,
                          thickness: 5,
                        ),

                        const SizedBox(height: 20,),

                        CustomButton(
                          buttonName: "Add", 
                          buttonColor: _selectedMethode ==0 ? kRed : kGreen,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}