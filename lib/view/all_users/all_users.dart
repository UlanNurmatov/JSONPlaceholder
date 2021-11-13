import 'package:flutter/material.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/providers/users_provider.dart';
import 'package:provider/provider.dart';
import 'package:test_app/view/user_details/user_details.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UsersProvider(), child: usersScaffold);
  }

  final Widget usersScaffold = Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Consumer<UsersProvider>(builder: (context, usersProvider, child) {
        if (usersProvider.status == FetchStatus.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (usersProvider.status == FetchStatus.Fetched) {
          return UsersList(usersProvider.users);
        } else if (usersProvider.status == FetchStatus.Error) {
          Center(child: Text('Error'));
        } else {
          return Center(child: Text('Something went wrong'));
        }
        return Center(child: Text('Something went wrong'));
      }));
}

class UsersList extends StatelessWidget {
  final List<User> users;
  UsersList(this.users);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person_rounded)),
              title:
                  Text(users[index].username, style: TextStyle(fontSize: 18)),
              subtitle: Text(users[index].name, style: TextStyle(fontSize: 16)),
              onTap: () {
                final userDetails = UserDetails(users[index]);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => userDetails));
              },
            ),
          );
        },
        itemCount: users.length);
  }
}
