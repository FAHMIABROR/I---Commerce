import 'package:e_commerce/widgets/DetailChat.dart';
import 'package:flutter/material.dart';


class Chatpage extends StatelessWidget {
  const Chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C53A5),
        title: const Text(
          'Chats',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(chat['avatarUrl']!),
              ),
              title: Text(
                chat['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                chat['lastMessage']!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chat['time']!,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  if (chat['unreadCount'] != '0')
                    Container(
                      margin: const EdgeInsets.only(top: 1),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        chat['unreadCount']!,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                ],
              ),
              onTap: () {
                // Gunakan Navigator.push untuk berpindah ke halaman ChatDetailPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detailchat (chat: chat),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

final List<Map<String, String>> chatList = [
  {
    'name': 'Alice',
    'lastMessage': 'Hey, how’s it going?',
    'time': '12:30 PM',
    'avatarUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&s',
    'unreadCount': '2',
  },
  {
    'name': 'Bob',
    'lastMessage': 'Don’t forget about the meeting tomorrow.',
    'time': '11:45 AM',
    'avatarUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaqRG_uL65WJl1T8zRozClqoTwAr8cuCln-Q&s',
    'unreadCount': '0',
  },
  {
    'name': 'Charlie',
    'lastMessage': 'Sure, I’ll send it over soon.',
    'time': '10:10 AM',
    'avatarUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgbmG8Ebh27B3t5ChGhk7EWbZ6j2YRPX5IMA&s',
    'unreadCount': '5',
  },
  {
    'name': 'Emma',
    'lastMessage': 'Let’s catch up later!',
    'time': 'Yesterday',
    'avatarUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkR48LoFHBZXunbYp-PlllTPPEgrgml-paqg&s',
    'unreadCount': '1',
  },
];
