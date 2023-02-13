import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.custom(
          gridDelegate: SliverStairedGridDelegate(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            startCrossAxisDirectionReversed: true,
            pattern: [
              StairedGridTile(0.5, 0.8),
              StairedGridTile(0.5, 3 / 4),
              StairedGridTile(1.0, 10 / 4),
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