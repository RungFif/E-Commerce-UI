import 'package:flutter/material.dart';

class ListChatPage extends StatefulWidget {
  const ListChatPage({super.key});

  @override
  State<ListChatPage> createState() => _ListChatPageState();
}

class _ListChatPageState extends State<ListChatPage> {
  int _filterIndex = 0; // 0: Semua, 1: Belum Dibaca
  final List<Map<String, dynamic>> _chats = [
    {
      'name': 'Toko Elektronik',
      'avatar': null, // Ganti dengan AssetImage jika ada gambar
      'lastMessage': 'Pesanan Anda sudah dikirim!',
      'time': '09:30',
      'unread': true,
    },
    {
      'name': 'Toko Fashion',
      'avatar': null,
      'lastMessage': 'Terima kasih sudah order!',
      'time': '08:15',
      'unread': false,
    },
    {
      'name': 'Toko Buku',
      'avatar': null,
      'lastMessage': 'Ada promo menarik minggu ini!',
      'time': 'Kemarin',
      'unread': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredChats = _filterIndex == 0
        ? _chats
        : _chats.where((c) => c['unread'] == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: const Color(0xFF4C53A5),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('Semua'),
                  selected: _filterIndex == 0,
                  onSelected: (val) {
                    setState(() => _filterIndex = 0);
                  },
                  selectedColor: const Color(0xFF4C53A5),
                  labelStyle: TextStyle(
                    color: _filterIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Belum Dibaca'),
                  selected: _filterIndex == 1,
                  onSelected: (val) {
                    setState(() => _filterIndex = 1);
                  },
                  selectedColor: const Color(0xFF4C53A5),
                  labelStyle: TextStyle(
                    color: _filterIndex == 1 ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredChats.length,
              itemBuilder: (context, index) {
                final chat = filteredChats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF4C53A5).withOpacity(0.1),
                    child: chat['avatar'] == null
                        ? const Icon(Icons.store, color: Color(0xFF4C53A5))
                        : Image.asset(chat['avatar']),
                  ),
                  title: Text(
                    chat['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    chat['lastMessage'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(chat['time'], style: const TextStyle(fontSize: 12)),
                      if (chat['unread'])
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'DetailChatPage');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
