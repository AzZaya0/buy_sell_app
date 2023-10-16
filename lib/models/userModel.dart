import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id; // The ID of the user document
  final String name; // User's name
  final List<Item> items; // List of items associated with the user

  User({
    required this.id,
    required this.name,
    required this.items,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final userId = doc.id;
    final name = data['name'] as String;
    final items = (data['items'] as List).map((itemData) {
      return Item.fromFirestore(itemData);
    }).toList();

    return User(id: userId, name: name, items: items);
  }
}
class Item {
  final String name;
  final String type; // "Sold" or "Bought"
  final String date;
  final double rate;
  final int shares;

  Item({
    required this.name,
    required this.type,
    required this.date,
    required this.rate,
    required this.shares,
  });

  factory Item.fromFirestore(Map<String, dynamic> data) {
    final name = data['name'] as String;
    final type = data['type'] as String;
    final date = data['date'] as String;
    final rate = data['rate'] as double;
    final shares = data['shares'] as int;

    return Item(name: name, type: type, date: date, rate: rate, shares: shares);
  }
}
