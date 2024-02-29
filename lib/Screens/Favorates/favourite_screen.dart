import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_1/Provider/favourite_provider.dart';
import 'package:provider_example_1/Screens/Favorates/my_favourite_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Screen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavouriteScreen()));
              },
              icon: const Icon(Icons.favorite))
        ],
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
                itemCount: 50),
          ),
        ],
      ),
    );
  }
}
