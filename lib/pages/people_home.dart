import 'package:api_class/model/people_model.dart';
import 'package:api_class/services/userservices.dart';
import 'package:flutter/material.dart';
class PeopleHome extends StatelessWidget {
  const PeopleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text('Details',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: FutureBuilder<PeopleModel?>(
        future: UserServices().fetchPeopleData(5), // Fetching 5 users for grid
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data found'));
          } else {
            // Building a GridView for fetched data
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items per row
                childAspectRatio: 0.75, // Aspect ratio for each item
              ),
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) {
                final person = snapshot.data!.results![index];
                return Card(
                  color: Colors.cyan[800],
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: person.picture?.thumbnail != null
                            ? NetworkImage(person.picture!.thumbnail!)
                            : AssetImage('assets/placeholder.png')
                        as ImageProvider,
                      ),
                      SizedBox(height: 15),
                      Text(
                        '${person.name?.first ?? 'No first name'} ${person.name?.last ?? 'No last name'}',
                        style: TextStyle(
                            color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone,color: Colors.red,),
                          SizedBox(width: 10,),
                          Text(
                            person.phone ?? 'No phone number',
                            style: TextStyle(color: Colors.white,fontSize: 14,),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,color: Colors.yellow,),
                          Text(
                            '${person.location?.city ?? 'No city'}, ${person.location?.country ?? 'No country'}',
                            style: TextStyle(fontSize: 14, color: Colors.white,),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      // FutureBuilder<PeopleModel?>(
      //   future: UserServices().fetchPeopleData(5),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else if (!snapshot.hasData || snapshot.data == null) {
      //       return Center(child: Text('No data found'));
      //     } else {
      //       return ListView.builder(
      //         itemCount: snapshot.data!.results!.length,
      //         itemBuilder: (context, index) {
      //           final person = snapshot.data!.results![index];
      //           return ListTile(
      //             leading: CircleAvatar(
      //               backgroundImage:
      //               NetworkImage(person.picture?.thumbnail ?? ''),
      //             ),
      //             title: Text('${person.name?.first} ${person.name?.last}'),
      //             subtitle: Text(person.email ?? ''),
      //           );
      //         },
      //       );
      //     }
      //   },
      // ),
    );

  }
}
