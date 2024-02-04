//

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skeletondemo/product.dart';
import 'package:skeletondemo/products.dart';

class DataController extends GetxController {
  //  you need to extend to GetxController
  //

  // create a list to store these product
  RxList<Product> products = <Product>[].obs; // obs make variable observable ,

  RxBool loading = false.obs;

  void getProducts() async {
    try {
      loading.value = true;
      var res = await http.get(Uri.parse("https://dummyjson.com/products"));
      if (res.statusCode == 200) {
        Products prod =
            Products.fromJson(jsonDecode(res.body)); // Products is model class
        products.value = prod
            .products; // variable . value  is use to assign value , when to assing new value like this it will rebuild widget where it is been used
      }
    } catch (e) {
      print(e);
    } finally {
      loading.value = false;
    }
  }
}
