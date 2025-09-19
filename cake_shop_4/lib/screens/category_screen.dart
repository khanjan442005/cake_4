
import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../widgets/cake_card.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Classic',
      'Chocolate Lover',
      'Fruit-Based',
      'Cheesecakes & Creamy',
      'Nutty',
      'Premium & Designer',
      'Festive',
      'Healthy / Special',
      'International',
      'Unique Flavour',
    ];

    final cakesInCategory = selectedCategory == null
        ? sampleCakes
        : sampleCakes
            .where((cake) => cake.category == selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        leading: selectedCategory != null
            ? BackButton(onPressed: () => setState(() => selectedCategory = null))
            : null,
        title: Text(selectedCategory ?? 'Categories'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCategory = null;
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // Make button full width
                backgroundColor: selectedCategory == null
                    ? Colors.pinkAccent.withAlpha(230)
                    : Theme.of(context).cardColor,
                foregroundColor: selectedCategory == null
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyLarge?.color,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'All Cakes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: selectedCategory == null
                  ? ListView.builder(
                      key: const ValueKey('categoryList'),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50), // Make button full width
                              backgroundColor: Theme.of(context).cardColor,
                              foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(category, style: const TextStyle(fontSize: 18)),
                          ),
                        );
                      },
                    )
                  : GridView.builder(
                      key: ValueKey(selectedCategory),
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: cakesInCategory.length,
                      itemBuilder: (context, index) {
                        final cake = cakesInCategory[index];
                        return CakeCard(cake: cake, onTap: () {});
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
