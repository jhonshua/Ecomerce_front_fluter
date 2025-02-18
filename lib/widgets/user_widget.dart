import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.shopping_cart, size: 20),
            onPressed: () {},
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Login / Register'),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey.shade300,
                child: Icon(Icons.person, color: Colors.white, size: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
