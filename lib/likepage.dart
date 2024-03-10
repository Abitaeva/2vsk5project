import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class LikePage extends StatefulWidget {
  const LikePage ({super.key});
  @override
  State<LikePage> createState() => _LikePageState();
}
class _LikePageState extends State<LikePage>{

  List products = ['Багет', 'Белый Хлеб', 'Кокосовый Хлеб', 'Диетический хлеб'];
  @override
  Widget build (BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${products[index]}'),
              trailing: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxHeight: 64,
                  maxWidth: 64,
                ),
                child: LikeButton(
                  size: 20,
                  circleColor: const CircleColor(
                    start: Colors.pink, end: Colors.pink),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.pink,
                    dotSecondaryColor: Colors.pink,
                  ) ,
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 20,
                    );
                  },
                  likeCount: 0,
                ),
              ),
            );
          }
        )
      ),
    );
  }
}