import 'package:flutter/material.dart';
import 'package:fluttter/app/modules/home/bloc/home_bloc.dart';
import 'package:fluttter/app/modules/home/home_module.dart';
import 'package:fluttter/app/modules/home/models/catalog.dart';
import 'package:fluttter/app/modules/home/models/catalog_item.dart';

class HomePage extends StatefulWidget {
  var catalog = new Catalog();
  var catalogItems = List<CatalogItem>();

  HomePage() {
    catalogItems = [];
    catalogItems.add(CatalogItem(id: 1, title: "Filhos da anarquia"));
    catalogItems.add(CatalogItem(id: 1, title: "Filhos da anarquia"));
    catalogItems.add(CatalogItem(id: 1, title: "Filhos da anarquia"));
    catalogItems.add(CatalogItem(id: 1, title: "Filhos da anarquia"));
    catalogItems.add(CatalogItem(id: 1, title: "Filhos da anarquia"));
    catalogItems.add(CatalogItem(id: 1, title: "Filhos da anarquia"));
    catalogItems.add(CatalogItem(id: 1, title: "Filhos da anarquia"));
    catalogItems.add(CatalogItem(id: 1, title: "Filhos da anarquia"));
    catalogItems.add(CatalogItem(id: 1, title: "Filhos da anarquia"));
    catalogItems.add(CatalogItem(id: 1, title: "Filhos da anarquia"));
    catalogItems.add(CatalogItem(id: 1, title: "Filhos da anarquia"));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   var bloc = HomeModule.to.getBloc<HomeBloc>();


  @override
  void initState() {
    bloc.getCatalog(1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Collapsing Toolbar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: ListView.builder(
              itemCount: widget.catalogItems.length,
              itemBuilder: (BuildContext ctxt, int index) {
                final item = widget.catalogItems[index].title;
                

                return Text(widget.catalogItems[index].title);
              }),
        ),
      ),
    );
  }
}