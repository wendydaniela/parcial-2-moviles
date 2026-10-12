import 'package:flutter/material.dart';

class HorizontalCarousel extends StatelessWidget {
  const HorizontalCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> genres = [
      {'title': 'Post hardcore', 'image': 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bd/Fugiplayinglive.jpg/250px-Fugiplayinglive.jpg?utm_source=es.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'},
      {'title': 'Metalcore', 'image': 'https://miro.medium.com/1*wSn9HQ8wXRyiRAVuyshPHg.jpeg'},
      {'title': 'Screamo', 'image': 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Orchid_-_Stierch.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'},
      {'title': 'Pop-Punk', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh59-LoaYw1nHAu8S2MZIx9_YEDvNtwYhGE16JTweWAKSz3hKxv7x5VHc&s=10'},
      {'title': 'Metal', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMrCBwEA-eYXsi6rCL_g0GlvULO1yiaD0JKM2l-JAftvRGhNM220rSRWs&s=10'},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return Container(
            width: 90,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 230, 197, 253),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.08),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    genres[index]['image']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  genres[index]['title']!,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}