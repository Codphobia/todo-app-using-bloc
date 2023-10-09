import 'package:bloc_todo/counterApp/counterapp.dart';
import 'package:bloc_todo/todoApp/list_page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const CounterApp(title: 'Counter App');
                  },
                ));
              },
              child: const Text('counter App'),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const HomeListScreen(title: 'todo App');
                  },
                ));
              },
              child: const Text('todo App'),
            )
          ],
        ),
      ),
    );
  }
}
