import 'package:flutter/material.dart';
import 'widgets/post_card.dart';
import 'widgets/promotional_banner.dart';
import 'widgets/horizontal_carousel.dart';
import 'widgets/chat_tile.dart';

void main() {
  runApp(const BogotaFestApp());
}

class BogotaFestApp extends StatelessWidget {
  const BogotaFestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Musica en Bogotá',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color.fromARGB(255, 244, 221, 241),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<String> _titles = [
    'Bogotá conciertos',
    'Chats amigos',
    'Entradas',
  ];

  final List<Widget> _screens = const [
    HomeScreen(),
    ChatsScreen(),
    LaboratoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        centerTitle: true,
        backgroundColor: const Color(0xFF673AB7),
        foregroundColor: const Color.fromARGB(255, 207, 178, 178),

        leading: _currentIndex != 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              )
            : null,
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number_outlined),
            label: 'Conciertos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_outlined),
            label: 'Amigos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity_outlined),
            label: 'Taquilla',
          ),
        ],
      ),
    );
  }
}

// publis
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PromotionalBanner(
              title: '¡Rock al Parque!',
              description:
                  'Cada año somos más los amantes de la música, los esperamos mañana, lleven su impermeable',
              backgroundColor: Color.fromARGB(255, 214, 186, 255),
            ),
            const SizedBox(height: 20),
            const Text(
              'Géneros más escuchados',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const HorizontalCarousel(),
            const SizedBox(height: 20),
            const Text(
              'Publicaciones recientes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const PostCard(
              avatarUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_2CuUJ8AjeOcftYmjm1c1S3jBKsuDMVbwI1JE1qYZcA&s',
              userName: 'pogoconcerts',
              postImageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSabBxvry1hm8C79N01Ux_dBcdgVs29t0dHS-aq7U7-rsA6AeXloCUjhWo&s=10',
              description:
                  'Slipknot está de vuelta y nos espera una noche con Marilyn Manson, Hatebreed y NO DEPENDIENTE como invitados especiales',
            ),
            const SizedBox(height: 16),
            const PostCard(
              avatarUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9_zKFZFSo8hnt7-QrPfh-weKagaFQ7pTi5jJFPbw9XQ&s',
              userName: 'Rock al parque Bogotá',
              postImageUrl:
                  'https://imagenes2.eltiempo.com/files/image_1200_535/files/fp/uploads/2026/10/12/6acc83adb7d9a.r_d.436-400-9375.jpeg',
              description:
                  ' ¡290 MIL PERSONAS PARA VER A MON LAFERTE EN ROCK AL PARQUE!',
            ),
          ],
        ),
      ),
    );
  }
}

// chats
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: const [
        ChatTile(
          avatarUrl:
              'https://i.pinimg.com/736x/54/99/9a/54999ad722e111dd29058c3adcf97787.jpg',
          name: 'Mikeeee',
          message: 'Ya voy en camino a rockal, dónde te veo?',
          time: '5:10 PM',
          hasUnread: false,
        ),
        ChatTile(
          avatarUrl:
              'https://i.pinimg.com/736x/8d/4d/15/8d4d153633debeb3c65a991124ce37ec.jpg',
          name: 'Sofia',
          message: 'Tú: omg me encantooooo :(((',
          time: '3:45 PM',
          hasUnread: false,
        ),
        ChatTile(
          avatarUrl:
              'https://i.pinimg.com/1200x/b8/9b/80/b89b801402c881ef5ac8828d0097d5a3.jpg',
          name: 'David SWS',
          message: 'Ya te envié, compra mi entrada pliss',
          time: 'Ayer',
          hasUnread: true,
        ),
        ChatTile(
          avatarUrl:
              'https://i.pinimg.com/736x/e8/8a/88/e88a880ce1852920c1ab3ee5ae0741a2.jpg',
          name: 'Lindafu',
          message: 'Dani, vas a ver a Rata blanca?',
          time: 'Ayer',
          hasUnread: true,
        ),
        ChatTile(
          avatarUrl:
              'https://i.pinimg.com/1200x/6e/8e/e2/6e8ee25e3424127f3b8309d9bcef7648.jpg',
          name: 'Brayan Jose',
          message: 'No creo poder ir, debo trabajar, me cuentass',
          time: '10/10/2026',
          hasUnread: false,
        ),
        ChatTile(
          avatarUrl:
              'https://i.pinimg.com/736x/86/1c/26/861c2675be72aa63193172cad89e51cf.jpg',
          name: 'Daniel H',
          message: 'Cómo estás? :*',
          time: '10/10/2026',
          hasUnread: true,
        ),
        ChatTile(
          avatarUrl:
              'https://i.pinimg.com/736x/78/92/8b/78928bd78876ba4a0ef392405d587b7d.jpg',
          name: 'Dana Valentina',
          message: 'Tú: Hola, irás el lunes a rockal?',
          time: '09/10/2026',
          hasUnread: false,
        ),
      ],
    );
  }
}

// compra de boletas
class LaboratoryScreen extends StatefulWidget {
  const LaboratoryScreen({super.key});

  @override
  State<LaboratoryScreen> createState() => _LaboratoryScreenState();
}

class _LaboratoryScreenState extends State<LaboratoryScreen> {
  // Contadores independientes para cada concierto
  int _swsTickets = 1;
  final int _swsPrice = 300000;

  int _slipknotTickets = 1;
  final int _slipknotPrice = 450000;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // sws
            _buildTicketCard(
              artistName: 'Sleeping With Sirens',
              location: 'Royal Center • Bogotá',
              imageUrl: 'https://i.pinimg.com/736x/5b/3f/14/5b3f14a93aaeb2aa3f9754de52432e2e.jpg',
              quantity: _swsTickets,
              price: _swsPrice,
              onIncrement: () => setState(() => _swsTickets++),
              onDecrement: () {
                if (_swsTickets > 1) setState(() => _swsTickets--);
              },
            ),

            const SizedBox(height: 20),

            // slipknot
            _buildTicketCard(
              artistName: 'Slipknot',
              location: 'Vive Claro • Bogotá',
              imageUrl: 'https://i.pinimg.com/1200x/80/81/2c/80812ccc2ba2d4efaf7feb8189eefe70.jpg',
              quantity: _slipknotTickets,
              price: _slipknotPrice,
              onIncrement: () => setState(() => _slipknotTickets++),
              onDecrement: () {
                if (_slipknotTickets > 1) setState(() => _slipknotTickets--);
              },
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketCard({
    required String artistName,
    required String location,
    required String imageUrl,
    required int quantity,
    required int price,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    int total = quantity * price;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withValues(alpha: 0.12),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              imageUrl,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  artistName,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Color(0xFF673AB7)),
                    const SizedBox(width: 4),
                    Text(location, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Divider(height: 1),
                ),
                const Text(
                  'Cantidad de entradas:',
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filled(
                      onPressed: onDecrement,
                      icon: const Icon(Icons.remove),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.redAccent.shade100,
                        foregroundColor: Colors.red.shade900,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF673AB7),
                        ),
                      ),
                    ),
                    IconButton.filled(
                      onPressed: onIncrement,
                      icon: const Icon(Icons.add),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade100,
                        foregroundColor: const Color(0xFF673AB7),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F5FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total a pagar:', style: TextStyle(fontWeight: FontWeight.w600)),
                      Text(
                        '\$$total COP',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF673AB7),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF673AB7),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Comprar Entradas',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
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
