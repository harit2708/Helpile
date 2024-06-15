import 'package:flutter/material.dart';
import '../widget/background_color.dart';
import '../routes/app_routes.dart';
import '../widget/bottom_navbar.dart';
import 'categories.dart';
import 'task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  static const List<Map<String, dynamic>> _bottomBarItems = [
    {
      'icon': Icons.home,
      'label': 'Home',
    },
    {
      'icon': Icons.category,
      'label': 'Categories',
    },
    {
      'icon': Icons.assignment,
      'label': 'Tasks',
    },
  ];

  static const List<String> _images = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];

  static const List<String> _cardTexts = [
    'Card 1 Text',
    'Card 2 Text',
    'Card 3 Text',
    'Card 4 Text',
    'Card 5 Text',
    'Card 6 Text',
    'Card 7 Text',
    'Card 8 Text',
    'Card 9 Text',
    'Card 10 Text',
  ];

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreenContent(images: _images, cardTexts: _cardTexts),
      const Categories(),
      Task(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF318CE7),
            title: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Current Location',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 60),
                Text(
                  'Helpile',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_pin, size: 40.0),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.profile_page);
                },
              ),
            ],
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: _pages[_selectedIndex],
          ),
          bottomNavigationBar: BottomNavBar(
            selectedIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: _bottomBarItems,
          ),
        ),
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  final List<String> images;
  final List<String> cardTexts;

  const HomeScreenContent({
    super.key,
    required this.images,
    required this.cardTexts,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardSize = (screenWidth - 60) / 2;

    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: (images.length / 2).ceil(),
      itemBuilder: (context, index) {
        int startIndex = index * 2;
        int endIndex = startIndex + 2;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            endIndex <= images.length ? 2 : images.length - startIndex,
                (innerIndex) {
              int actualIndex = startIndex + innerIndex;
              return SizedBox(
                width: cardSize,
                child: Column(
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          images[actualIndex],
                          width: cardSize,
                          height: cardSize,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cardTexts[actualIndex],
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
