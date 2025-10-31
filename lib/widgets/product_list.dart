import 'package:flutter/material.dart';
import 'package:shop_app/pages/details_page.dart';
import 'package:shop_app/global_var.dart';
import 'package:shop_app/provider/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    "All",
    "Nike",
    "Adidas",
    "Bata",
    "Reebok",
    "Fila",
  ];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }
  
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
    );
    return SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Shoes\nCollecton",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: border,
                      enabledBorder: border,

                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () => {
                        setState(() {
                          selectedFilter = filter;
                        }),
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : Color.fromARGB(255, 244, 244, 242),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: Color.fromRGBO(255, 244, 244, 242),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        label: Text(filter),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: size.width > 600? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.75,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => DetailsPage(product: product),
                        ),
                      ),
                      setState(() {
                        selectedFilter = product['brand'] as String;
                      }),
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as int,
                      image: product['image'] as String,
                      backgroundColor: index.isEven
                          ? Color.fromRGBO(216, 240, 253, 1)
                          : Color.fromRGBO(255, 244, 244, 1),
                    ),
                  );
                },
              ): ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) =>
                                  DetailsPage(product: product),
                            ),
                          ),
                          setState(() {
                            selectedFilter = product['brand'] as String;
                          }),
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as int,
                          image: product['image'] as String,
                          backgroundColor: index.isEven
                              ? Color.fromRGBO(216, 240, 253, 1)
                              : Color.fromRGBO(255, 244, 244, 1),
                        ),
                      );
                    },
                  ),
            ),
          ],
        ),
      );
  }
}