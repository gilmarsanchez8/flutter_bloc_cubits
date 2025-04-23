import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Cubits'),
            subtitle: Text('Simple state manager'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push('/cubits');
            },
          ),
          ListTile(
            title: Text('BLoC'),
            subtitle: Text('Composite state manager'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push('/bloc');
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            title: Text('Administration'),
            subtitle: Text('Management users'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push('/new-user');
            },
          ),
        ],
      ),
    );
  }
}
