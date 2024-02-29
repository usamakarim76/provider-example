import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_1/Provider/favourite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteItems>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItems>(
                    builder: (context, value, child) {
                      return ListTile(
                        title: Text("ITEM ${index + 1}"),
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        trailing: Icon(value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                      );
                    },
                  );
                },
                itemCount: provider.selectedItem.length),
          ),
        ],
      ),
    );
  }
}
