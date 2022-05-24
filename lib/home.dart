// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  late List<String> categoria;
  late List<String> items;

  HomePage({
    Key? key,
  }) : super(key: key) {
    categoria = List.generate(10, (i) => "Categora $i");
    items = List.generate(5, (i) => "Item $i");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  "App Bar ListView Animado",
                ),
                expandedTitleScale: 1.4,
                titlePadding:
                    const EdgeInsets.only(top: 16, bottom: 16, left: 8),
                background: Image.asset(
                  'assets/tristana.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categoria.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            categoria[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (_, index) {
                              return ListTile(
                                title: Text(
                                  items[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
