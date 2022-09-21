//u need to make changes to do your task.

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/widgets/user_widget.dart';
import 'dart:convert';

import 'models/company.dart';
import 'models/user.dart'; // for using json.decode()

void main() {
  runApp(MyApp());
}

List<String> images = [
  'assets/user.png',
  'assets/user1.png',
  'assets/user2.png',
  'assets/user3.jpg',
  'assets/user4.jpg',
  'assets/user5.png',
  'assets/user6.png',
  'assets/user1.png',
  'assets/user.png',
  'assets/user2.png',
];

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),

      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The list that contains information about photos
  List _loadedUsers = [];
  List<User> users = [];

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/users';

    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);

    for (var i = 0; i < data.length; i++) {
      users.add(User(
          username: data[i]['username'],
          name: data[i]['name'],
          email: data[i]['email'],
          phone: data[i]['phone'],
          website: data[i]['website'],
          company: Company(
            companyName: data[i]['company']['name'],
            catchPhrase: data[i]['company']['catchPhrase'],
            bs: data[i]['company']['bs'],
          )));
    }

    setState(() {
      _loadedUsers = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IMDAT company'),
        ),
        body: SafeArea(
            child: _loadedUsers.isEmpty
                ? Center(
                    child: ElevatedButton(
                      onPressed: _fetchData,
                      child: Container(
                          width: 150,
                          height: 100,
                          child: Center(
                              child: const Text(
                            'Load Users',
                            style: TextStyle(fontSize: 20),
                          ))),
                    ),
                  )
                // The ListView that displays photos
                : ListView.builder(
                    itemCount: _loadedUsers.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserWidget(
                                          username: users[index].username,
                                          name: users[index].name,
                                          email: users[index].email,
                                          phone: users[index].phone,
                                          website: users[index].website,
                                          company: users[index].company,
                                          image: images[index],
                                        )));
                          },
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.pink.shade100,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20,
                                child: Image.asset(images[index]),
                              ),
                              title: Text(_loadedUsers[index]['username']),
                              subtitle: Text('${_loadedUsers[index]["name"]}'),
                            ),
                          ),
                        ),
                      );
                    },
                  )));
  }
}
