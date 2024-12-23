import 'package:flutter/material.dart';
import 'package:practice_application/Widgets/whatsapp_tile.dart';

class WhatsappScreen extends StatefulWidget {
  const WhatsappScreen({super.key});

  @override
  State<WhatsappScreen> createState() => _WhatsappScreenState();
}

class _WhatsappScreenState extends State<WhatsappScreen> {
  List<Map<String, dynamic>> userData = [
    {
      "image":
          'https://goldenglobes.com/wp-content/uploads/2023/10/17-tomcruiseag.jpg?w=600?w=600',
      "name": 'Nishan',
      "message": "Hello, I'm Nishan",
      "unreadCount": "1",
      "time": "12.43 am"
    },
    {
      "image":
          'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTErSOXz2pZ4E3-QzTqwB4JAR2TdFW-pt0mPQ8IDG5cN7KQaq2Tw04wrin0jyENsgQ11TGRuiWPTCZ-1uJ_3k8Svg',
      "name": 'Aditya',
      "message": "Hello, I'm Aditya",
      "unreadCount": "20",
      "time": "12.58 pm"
    },
    {
      "image":
          'https://static.toiimg.com/thumb/msid-114329479,width-400,height-225,resizemode-72/114329479.jpg',
      "name": 'Debraj',
      "message": "Hello, I'm Debraj",
      "unreadCount": "4",
      "time": "09.50 pm"
    },
    {
      "image":
          'https://in.bmscdn.com/iedb/artist/images/website/poster/large/shahid-kapoor-2094-1680754317.jpg',
      "name": 'Arindam',
      "message": "Hello, I'm Arindam",
      "unreadCount": "3",
      "time": "10.50 am"
    },
    {
      "image":
          'https://m.media-amazon.com/images/M/MV5BOGJkMzRiYmQtOTVjNy00MWU3LTg5YjctNjcwMmZlNGIwMjhmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
      "name": 'Gourab',
      "message": "Hello, I'm Gourab",
      "unreadCount": "5",
      "time": "04.30 pm"
    },
    {
      "image":
          'https://i.pinimg.com/736x/08/f1/a6/08f1a6ec3517982c2bebf0f6f1161598.jpg',
      "name": 'Sushovan',
      "message": "Hello, I'm Sushovan",
      "unreadCount": "2",
      "time": "10.00 am"
    },
    {
      "image":
          'https://images.indianexpress.com/2023/12/Salman-Khan-old-days-1600.jpg',
      "name": 'Subhankar',
      "message": "Hello, I'm Subhankar",
      "unreadCount": "1",
      "time": "08.33 am"
    },
    {
      "image":
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg/220px-Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg',
      "name": 'Supriyo',
      "message": "Hello, I'm Supriyo",
      "unreadCount": "8",
      "time": "02.30 am"
    },
    {
      "image":
          'https://media.themoviedb.org/t/p/w500/ymYNHV9luwgyrw17NXHqbOWTQkg.jpg',
      "name": 'Suchindram',
      "message": "Hello, I'm Suchindram",
      "unreadCount": "10",
      "time": "12.40 pm"
    },
    {
      "image":
          'https://www.indextap.com/blog/wp-content/uploads/2022/07/ranveer-singh-1-1.jpg',
      "name": 'Sandipan',
      "message": "Hello, I'm Sandipan",
      "unreadCount": "5",
      "time": "11.55 am"
    },
    {
      "image":
          'https://i.pinimg.com/736x/75/bc/72/75bc7260b02d70b7b232e35956632dc8.jpg',
      "name": 'Arpendra',
      "message": "Hello, I'm Arpendra",
      "unreadCount": "6",
      "time": "06.15 pm"
    },
    {
      "image":
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn0UzHKexrkRMgJgzXak0Njut4UKLCK4dB3Q&s',
      "name": 'Diptesh',
      "message": "Hello, I'm Diptesh",
      "unreadCount": "7",
      "time": "10.35 am"
    },
    {
      "image": 'https://static.toiimg.com/photo/92426439/92426439.jpg',
      "name": 'Premnath',
      "message": "Hello, I'm Premnath",
      "unreadCount": "3",
      "time": "10.10 pm"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: Text(
            'WhatsApp',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[500],
        ),
        // body: ListView.builder(
        //     itemCount: userData.length,
        //     itemBuilder: (context, index) {
        //       return WhatsappTile(
        //         name: userData[index]['name'],
        //         description: userData[index]['message'],
        //         time: userData[index]['time'],
        //         image: userData[index]['image'],
        //         unreadCount: userData[index]['unreadCount'],
        //       );
        //     }));
        body: ListView(
          children: userData.map((element) {
            return ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: element["image"],
                      fit: BoxFit.cover,
                    )),
              ),
              title: Text(
                element['name'],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                element['message'],
                style: const TextStyle(fontSize: 15),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    element['time'],
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
                        element['unreadCount'],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ));
  }
}
