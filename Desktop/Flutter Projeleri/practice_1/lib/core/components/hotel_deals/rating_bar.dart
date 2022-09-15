import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating;

  const RatingBar({super.key, required this.rating});
  Color getColor(int index) {
    return rating> index ? Colors.yellow : Colors.grey;
  }
  IconData getIcon(int index){
    return rating-index > 1?Icons.star :(rating-index > 0?Icons.star_half:Icons.star);
  }

  // List<Widget> iconList() {
  //   List<Widget> a = [];
  //   for (int i = 0; i < 5; i++) {
  //     a.add(Icon(Icons.star, color: getColor(i)));
  //   }
  //   return a;
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(5, (index) => Icon(getIcon(index), color: getColor(index))),
    );
  }
}
