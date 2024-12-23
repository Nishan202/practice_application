import 'package:flutter/material.dart';

class WhatsappTile extends StatelessWidget {
  String name;
  String description;
  String? image;
  String time;
  String? unreadCount;

  WhatsappTile({super.key, required this.name, required this.description, this.image, required this.time, this.unreadCount});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
            image: DecorationImage(
          image: NetworkImage(image!),
          fit: BoxFit.cover,
        )),
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        description,
        style: const TextStyle(fontSize: 15),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 7,
          ),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.green[600],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                unreadCount!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
