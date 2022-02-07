import 'dart:ui';

import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/emptycart.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            'Your Cart is Empty',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Looks like you didn\'t \n add anything yet',
            style: TextStyle(
                fontSize: 26,
                color: Theme.of(context).unselectedWidgetColor,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Shop Now',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
