import 'package:flutter/material.dart';

class ServiceDetailsFacilityGrid extends StatelessWidget {
  final List<String> gridview = [
    'assets/Rectangle.png',
    'assets/Rectangle64.png',
    'assets/Rectangle65.png',
    'assets/Rectangle65.png',
    'assets/Rectangle65.png',
    'assets/Rectangle65.png',
    'assets/Rectangle65.png',
    'assets/Rectangle65.png',
    'assets/Rectangle65.png',
    'assets/Rectangle65.png',
    'assets/Rectangle65.png',
    'assets/Rectangle65.png',
    'assets/Rectangle65.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: gridview.length,
        itemBuilder: (ctx, i) => GridViewTile(gridview[i]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2),
      ),
    );
  }
}

class GridViewTile extends StatelessWidget {
  final String url;
  GridViewTile(this.url);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
        child: Image.asset(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
