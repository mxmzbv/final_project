import 'user.dart';
import '../widgets/todoslist_widget.dart';
import 'package:final_project/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';



class UserScreen extends StatefulWidget {
  const UserScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          
          title:  Text("${widget.user.name} (${widget.user.username})"),
        ),
        drawer: navDrawer(context) ,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(
                  Icons.account_circle,
                  color: Colors.blueGrey,
                  size: 150,
                ),
                const SizedBox(height: 8.0),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Телефон'),
                    subtitle: Text(widget.user.phone),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.mail),
                    title: const Text('Email'),
                    subtitle: Text(widget.user.email),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.web),
                    title: const Text('Веб-сайт'),
                    subtitle: Text(widget.user.website),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.business),
                    title: const Text('Место работы'),
                    subtitle: Text('${widget.user.company.name}, '
                        '${widget.user.company.catchPhrase}, '
                        '${widget.user.company.bs}'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.contact_mail),
                    title: const Text('Адрес'),
                    subtitle: Text('${widget.user.address.street}, '
                        '${widget.user.address.suite}, '
                        '${widget.user.address.city}, '
                        '${widget.user.address.zipcode} ('
                        '${widget.user.address.geo.lat}, '
                        '${widget.user.address.geo.lng})'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.task),
                    title: const Text('Список дел'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserTodosWidget(
                                userId: widget.user.id)
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
