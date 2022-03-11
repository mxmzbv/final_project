import 'package:flutter/material.dart';

Widget navDrawer(context) => Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    child: Image.asset("assets/Google-flutter-logo.png")),
              ],
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.people),
          title: const Text("Пользователи"),
          onTap: () {
            Navigator.pushNamed(context, '/users');
          },
        ),
        const SizedBox(
          height: 260,
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Выйти"),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ]),
    );
