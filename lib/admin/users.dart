import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/user_model.dart';
import 'package:flutter/material.dart';

import '../utils/constants/firebase_constants.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
        //centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersCollectionReference.orderBy('timestamp').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching users'));
          }
          final users = snapshot.data?.docs ?? [];
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final userModel = UserModel.fromJson(
                  users[index].data()! as Map<String, dynamic>);
              return Card(
                child: ListTile(
                  title: Text(userModel.userName),
                  subtitle: Text(userModel.mobileNumber),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
