import 'package:api_class/model/HandMade1.dart';
import 'package:api_class/services/handmadeService.dart';
import 'package:flutter/material.dart';
class Handmadepage extends StatelessWidget {
  const Handmadepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hand made ui without using fromMap function'
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: FutureBuilder<List<UserModel>>(
                future: UserServices().fetchUserData(6),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                          color: Colors.yellow,
                        ));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final users = snapshot.data!;
                    return ListView.builder(
                      itemCount: users.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return ListTile(
                          title:
                          Text("${user.title} ${user.firstName} ${user.lastName}"),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No data found'));
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
