import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
        bottom: 30
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          CircleAvatar(
            child: Image.asset('assets/images/user.png'),
          ),
          SizedBox(width: 10,),
          Column(
            children: [
              Text('Welcome back',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(254, 255, 254, 1),
                fontWeight: FontWeight.w600,
              ),)
            ],
          ),
        ],
      ),
    );
  }
}