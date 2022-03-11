import 'package:final_project/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import '../widgets/drawer_widget.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Пользователи"),
        ),
        drawer: navDrawer(context),
        body: FutureBuilder<List<User>>(
            future: fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Произошла ошибка!'),
                );
              } else if (snapshot.hasData) {
                return UserList(users: snapshot.data!);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({Key? key, required this.users}) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return UserListItem(user: users[index]);
      },
    );
  }
}

class UserListItem extends StatelessWidget {
  const UserListItem({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${user.id}. ${user.name}',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
          )),
      subtitle: Text(user.email),
      leading: const Icon(
        Icons.account_circle,
        color: Colors.blueGrey,
        size: 50.0,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserScreen(
                    user: user,
                  )),
        );
      },
    );
  }
}
