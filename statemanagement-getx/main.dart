/*
  plugins
  http: ^1.1.0
  shimmer: ^3.0.0
  get: ^4.6.6
*/


import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletondemo/data_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProductsList(),
    );
  }
}

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  void initState() {
    super.initState();

    Get.put(
        DataController()); // you need to put your controller before you can use

    // i am going to call our getproduct method in init - it's first method which get execute

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final dataController = Get.find<DataController>();
      dataController.getProducts();
    });
  }

  // that's it now let check it

/*


Hey everyone , Today we are going to see how to use GetX state management

you may have seen this app in shimmer or skeleton demo video , i am going to change this for with GetX state management


let's install plugin first

we need a controller class , lets create it


unlike previous way of loading now our data will be loaded once when page loaded

let's summarize this

1- controller 
2. wrap widget with Obx 
Thanks for watching


*/

  @override
  Widget build(BuildContext context) {
    final dataController =
        Get.find<DataController>(); // controller in <> brackets
    // wrap the widget where you want to make your variable to rebuild when value changes with
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
        ),
        body: dataController.loading.value
            ? Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey.shade300,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 8,
                              color: Colors.white,
                              width: 150,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 80,
                              color: Colors.white,
                              width: double.infinity,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  color: Colors.white,
                                  width: 40,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 8,
                                  color: Colors.white,
                                  width: 150,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }))
            : ListView.builder(
                itemCount: dataController.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataController.products[index].brand ?? '',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Image.network(
                              dataController.products[index].thumbnail ?? ''),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                  "\$${dataController.products[index].price ?? ''}"),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text("Buy Now"),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
