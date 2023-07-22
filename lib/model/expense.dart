import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormat = DateFormat("dd-MMM-yyyy");

enum Category { food, sports, leisure, travel, fuel }

const categoryIcons = {
  Category.food: Icons.dining_outlined,
  Category.sports: Icons.sports_cricket_outlined,
  Category.leisure: Icons.movie_filter_outlined,
  Category.travel: Icons.flight_takeoff,
  Category.fuel: Icons.local_gas_station_outlined,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate => dateFormat.format(date);
}
