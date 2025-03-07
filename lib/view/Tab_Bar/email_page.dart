// import 'package:flutter/material.dart';
// import 'package:paltform_conveter/helper/Db_helper.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../../controller/home_provider.dart';
//
// class ChatsListPage extends StatelessWidget {
//   const ChatsListPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var providerTrue = Provider.of<ProviderController>(context, listen: true);
//     var providerFalse = Provider.of<ProviderController>(context, listen: false);
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListView.builder(
//         itemCount: providerTrue.contentList.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: () {
//               Uri uri = Uri.parse(
//                 'mailto: ${providerTrue.contentList[index].email}',
//               );
//               launchUrl(uri);
//             },
//             child: Card(
//               color: Colors.blue.shade50,
//               child: ListTile(
//                 leading: IconButton(
//                   /// todo logic URL loch
//                   onPressed: () {
//                     Uri uri = Uri.parse(
//                       'mailto: ${providerTrue.contentList[index].email}',
//                     );
//                     launchUrl(uri);
//                   },
//                   icon: Icon(Icons.alternate_email),color: Colors.grey.shade800,
//                 ),
//                 title: Text(
//                   providerTrue.contentList[index].name.toString(),
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey.shade800,
//                     letterSpacing: .5,
//                   ),
//                 ),
//                 subtitle: Text(
//                   providerTrue.contentList[index].email.toString(),
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: .5,
//                   ),
//                 ),
//
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/home_provider.dart';

class ChatsListPage extends StatelessWidget {
  const ChatsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<ProviderController>(context, listen: true);
    var providerFalse = Provider.of<ProviderController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: providerTrue.contentList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = providerTrue.contentList[index];

          return GestureDetector(
            onTap: () {
              Uri uri = Uri.parse('mailto:${item.email}');
              launchUrl(uri);
            },
            child: Card(
              color: Colors.blue.shade50,
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    Uri uri = Uri.parse('mailto:${item.email}');
                    launchUrl(uri);
                  },
                  icon: Icon(Icons.alternate_email, color: Colors.grey.shade800),
                ),
                title: Text(
                  item.name.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                    letterSpacing: .5,
                  ),
                ),
                subtitle: Text(
                  item.email.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _showDeleteConfirmation(context, providerFalse, item.id!);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void _showDeleteConfirmation(BuildContext context, ProviderController provider, int id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Delete"),
        content: Text("Are you sure you want to delete this contact?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              provider.deleteDataBAse(id); // Delete from DB
              provider.readDataBase(); // Refresh UI
              Navigator.of(context).pop();
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}
