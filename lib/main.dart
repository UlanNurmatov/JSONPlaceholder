import 'package:flutter/material.dart';
import 'package:test_app/providers/users_provider.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(title: 'Users'),
    );
  }
}

class FirstScreen extends StatelessWidget {
  FirstScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UsersProvider(), child: UsersScaffold());
  }
}

class UsersScaffold extends StatelessWidget {
  const UsersScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: Builder(builder: (context) {
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
            //color: Colors.black12,
            child: ListTile(
                leading: Icon(Icons.person_rounded),
                title:
                    Text(users[index].username, style: TextStyle(fontSize: 18)),
                subtitle:
                    Text(users[index].name, style: TextStyle(fontSize: 16))),
          );
        },
        itemCount: users.length);
  }
}
