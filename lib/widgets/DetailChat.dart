import 'package:flutter/material.dart';

class Detailchat extends StatefulWidget {
  final Map<String, String> chat;

  const Detailchat({super.key, required this.chat});

  @override
  _DetailchatState createState() => _DetailchatState();
}

class _DetailchatState extends State<Detailchat> {
  final List<String> messages = ["Hello, how are you?", "I'm good, thanks!"];
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add(messageController.text);
      });
      messageController.clear();

      // Scroll ke bawah otomatis
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 50,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Widget buildMessage(String message, bool isSentByMe) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.blue[300] : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSentByMe ? 12 : 0),
            topRight: Radius.circular(isSentByMe ? 0 : 12),
            bottomLeft: const Radius.circular(12),
            bottomRight: const Radius.circular(12),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: isSentByMe ? Colors.white : Colors.black87),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.chat['name']!,
          style: const TextStyle(color: Colors.white), // Mengubah warna nama menjadi putih
        ),
        backgroundColor: const Color(0xFF4C53A5),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white), // Warna ikon putih
            onPressed: () {
              // Fitur lain (seperti block atau mute)
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return buildMessage(message, index % 2 == 0); // Simulasi pesan dari pengguna atau lawan bicara
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF4C53A5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
