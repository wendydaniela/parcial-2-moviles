import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String message;
  final String time;
  final bool hasUnread;

  const ChatTile({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.message,
    required this.time,
    required this.hasUnread,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 238, 196, 251),
      margin: const EdgeInsets.only(bottom: 1),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
          radius: 24,
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: hasUnread ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Text(
          message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: hasUnread ? const Color.fromARGB(221, 4, 0, 0) : const Color.fromARGB(255, 75, 75, 75),
            fontWeight: hasUnread ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 31, 31, 31)),
            ),
            const SizedBox(height: 4),
            if (hasUnread)
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}