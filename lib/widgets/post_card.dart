import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final String avatarUrl;
  final String userName;
  final String postImageUrl;
  final String description;

  const PostCard({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.postImageUrl,
    required this.description,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.08),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.avatarUrl),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  widget.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
          
          Image.network(
            widget.postImageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // descripción
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
          const Divider(height: 1),
          // botones de likee
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: _toggleLike,
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    color: _isLiked ? Colors.red : Colors.grey,
                  ),
                ),
                Text(_isLiked ? 'Te gusta' : 'Me gusta'),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mode_comment_outlined, color: Colors.grey),
                ),
                const Text('Comentarios'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}