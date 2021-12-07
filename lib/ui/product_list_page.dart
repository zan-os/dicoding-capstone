import 'package:dicoding_capstone_pos/widgets/cart_button.dart';
import 'package:dicoding_capstone_pos/widgets/grid_food.dart';
import 'package:dicoding_capstone_pos/widgets/list_food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  static const routeName = '/list';
  static const pageTitle = 'List';

  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool isListView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: SizedBox(width: 30),
            ),
            const Expanded(
              child: Center(
                child: Text('Cashier'),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.add),
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: CupertinoColors.lightBackgroundGray),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.inactiveGray),
                          ),
                          suffixIcon: Icon(CupertinoIcons.search),
                          labelText: 'search product',
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.inactiveGray),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: CupertinoColors.lightBackgroundGray),
                  ),
                  child: isListView
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isListView = false;
                            });
                          },
                          icon: const Icon(CupertinoIcons.square_grid_2x2),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isListView = true;
                            });
                          },
                          icon: const Icon(CupertinoIcons.list_bullet),
                        ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: isListView ? const ListViewFood() : const GridViewFood(),
          ),
          const CartButton(),
          const SizedBox(height: 8.0)
        ],
      ),
    );
  }
}
