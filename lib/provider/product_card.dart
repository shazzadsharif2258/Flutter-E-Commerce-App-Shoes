import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final int price;
  final String image;
  final Color backgroundColor;
  const ProductCard({
    super.key, required this.title, 
    required this.price, required this.image,
    required this.backgroundColor,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 8),
          Text("\$ $price", style: Theme.of(context).textTheme.bodySmall ,),
          SizedBox(height: 8),
          Center(child: Image.asset(image,height: 175,)),
        ],
      ),
    );
  }
}
