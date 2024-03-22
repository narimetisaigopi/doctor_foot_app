import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_foot_app/models/user_model.dart';
import 'package:doctor_foot_app/utils/constants/firebase_constatns.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
        centerTitle: true,
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
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final userModel = UserModel.fromJson(
                  users[index].data()! as Map<String, dynamic>);
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.transparent,
                      blurRadius: 5,
                      offset: Offset(-2, -2),
                    ),
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(5, 5),
                      color: Colors.grey.shade200,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person,
                        size: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(userModel.mobileNumber),
                      Text(Jiffy.parse(userModel.timestamp.toString())
                          .fromNow()),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
