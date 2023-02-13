import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: 4, 
            pattern: [
              QuiltedGridTile(2, 2),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 2),
            ]),
          childrenDelegate: SliverChildBuilderDelegate(((context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network("https://source.unsplash.com/random?sig=$index",fit: BoxFit.cover,),
            );
          })),
        )
      )
    );
  }
}