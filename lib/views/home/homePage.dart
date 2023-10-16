import 'package:buy_sell_app/models/userModel.dart';
import 'package:buy_sell_app/views/home/tabs/blockDeals.dart';
import 'package:buy_sell_app/views/home/tabs/bulkDeals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            final users = snapshot.data!.docs.map((doc) => User.fromFirestore(doc)).toList();

            if (users.isEmpty) {
              return Text('No users found.');
            }

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('User ID: ${user.id}'),
                    subtitle: Text('Username: ${user.name}'),
                    // Display other user data as needed
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
