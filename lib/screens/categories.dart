import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> _categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
    'Category 6',
    'Category 7',
    'Category 8',
    'Category 9',
    'Category 10',
    'Category 11',
    'Category 12',
    'Category 13',
    'Category 14',
    'Category 15',
    'Category 16',
    'Category 17',
    'Category 18',
    'Category 19',
    'Category 20',
  ];

  late List<String> _filteredCategories;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredCategories = _categories;
    _searchController.addListener(_filterCategories);
  }

  void _filterCategories() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredCategories = _categories;
      } else {
        _filteredCategories = _categories
            .where((category) =>
            category.toLowerCase().contains(_searchController.text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF318CE7),
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: const TextStyle(color: Colors.white70, fontSize: 26),
            border: InputBorder.none,
            icon: const Icon(Icons.search, color: Colors.white),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear, color: Colors.white),
              onPressed: _clearSearch,
            ),
          ),
          style: const TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
      body: ListView.separated(
        itemCount: _filteredCategories.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _filteredCategories[index],
              style: const TextStyle(fontSize: 22),
            ),
          );
        },
      ),
    );
  }
}
