// import 'package:api_class/model/HandMade1.dart';
// import 'package:api_class/services/handmadeService.dart';
// import 'package:flutter/material.dart';
// class Handmadepage extends StatelessWidget {
//   const Handmadepage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//             'Hand made ui without using fromMap function'
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Card(
//               child: FutureBuilder<List<UserModel>?>(
//                 future: UserServices().fetchDataUsingFromMap(5),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data == null) {
//                     return Center(child: Text('No data found'));
//                   } else {
//                     return ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         final person = snapshot.data![index];
//                         return ListTile(
//                           title: Text("${person.firstName}"),
//                         );
//                       },
//                     );
//                   }
//                 },
//               )
//
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
