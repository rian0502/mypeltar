import 'package:flutter/material.dart';


class AssetTile extends StatelessWidget {
  const AssetTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 9), // changes position of shadow
          ),
        ],
      ),
      child: const ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/dumylogo.jpg'),
        ),
        title: Text('Asset Name'),
        subtitle: Text('Asset Description'),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
