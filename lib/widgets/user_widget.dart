import 'package:flutter/material.dart';

import '../models/company.dart';

class UserWidget extends StatelessWidget {
  const UserWidget(
      {super.key,
      this.username,
      this.company,
      this.email,
      this.name,
      this.phone,
      this.website,
      this.image});

  final String? username;
  final String? name;
  final String? email;
  final String? phone;
  final String? website;
  final Company? company;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(username!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 40),
            child: Text(
              "Information".toUpperCase(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 10, bottom: 20),
            child: CircleAvatar(
              radius: 70,
              child: Image.asset(image!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("""Name:   $name""",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Text("""Email:   $email""",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Text("""Phone Number:   $phone""",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Text(""""Website:   $website""",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Text("""Working Company:   ${company!.companyName!}""",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Text("""Company CatchPhrase:   ${company!.catchPhrase!}""",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Text("""Company bs:    ${company!.bs!} """,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
