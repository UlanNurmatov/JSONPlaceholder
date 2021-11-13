import 'package:flutter/material.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/view/user_details/albums_preview.dart';
import 'package:test_app/view/user_details/posts_preview.dart';

class UserDetails extends StatelessWidget {
  final User user;
  UserDetails(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.username)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    child: ListTile(
                        title:
                            Text(user.name, style: TextStyle(fontSize: 26)))),
                Card(
                    child: ListTile(
                        leading: Icon(Icons.email_rounded),
                        title: Text(user.email.toLowerCase(),
                            style: TextStyle(fontSize: 18)))),
                Card(
                    child: ListTile(
                        leading: Icon(Icons.phone_android_rounded),
                        title:
                            Text(user.phone, style: TextStyle(fontSize: 18)))),
                Card(
                    child: ListTile(
                        leading: Icon(Icons.contact_mail_rounded),
                        title: Text(user.website,
                            style: TextStyle(fontSize: 18)))),
                Card(
                    child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.work_rounded),
                      title: Text(user.company.name,
                          style: TextStyle(fontSize: 20)),
                      subtitle: Text(
                        user.company.bs,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.format_quote_rounded),
                      title: Text(user.company.catchPhrase,
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic)),
                    )
                  ],
                )),
                Card(
                    child: Column(
                  children: [
                    ListTile(
                        dense: true,
                        leading: Icon(Icons.location_pin),
                        title: Text(user.address.city,
                            style: TextStyle(fontSize: 18)),
                        subtitle: Text(
                            '${user.address.suite} ${user.address.street}, ${user.address.zipcode}',
                            style: TextStyle(fontSize: 16))),
                  ],
                )),
                PostsPreview(user.id),
                AlbumsPreview(user.id),
              ],
            )
          ],
        ),
      ),
    );
  }
}
