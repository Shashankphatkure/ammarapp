import 'package:flutter/material.dart';
import 'package:myapp/screens/api/market_api.dart';
import 'package:myapp/screens/model/products_model.dart';

class HomePae extends StatefulWidget {
  const HomePae({super.key});

  @override
  State<HomePae> createState() => _HomePaeState();
}

class _HomePaeState extends State<HomePae> {
    List<ProductsModel> fetchingList = [];
    
      get headlines => null;
    void initState(){
      super.initState();
      fetchMarketApi();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Headlines"),
      ),
      body: ListView.builder(
        itemCount: fetchingList.length,
        itemBuilder: (context, index) {
          final listVar=fetchingList[index];
          final headline = fetchingList[index].hits;
          // final headlines =listVar.hits![inde.headline;
          return ListTile(
            title: Text(index.toString()),
          );
        },
      ),
    );
  }
  
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemCount: fetchingList.length,
        itemBuilder: (context,index){
          final listVar=fetchingList[index].hits![index].document;
          final head=listVar!.headline.toString();
          return Container(
              child: Text(head.toString()),

            );
      }),
    );
    */

    
  Future<void> fetchMarketApi() async {
    final response = await FeaturesApi.fetchMarketNews();

    setState(() {
      fetchingList = response;
      // Update the fetchingList with the fetched data
    });
  }


  }
  
