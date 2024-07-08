import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timbu/api_service.dart';
import 'product_controller.dart';
import 'product_image.dart';

class Mainpage extends StatelessWidget {
  final TimbuApi timbuApi = TimbuApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            Text(
              'Manifest Shop',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Colors.purple.shade700,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Products>>(
        future: timbuApi.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products available'));
          } else {
            final products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ProductPage(
                            product: product,
                          ));
                    },
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        border:
                            Border.all(width: 0.5, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            product.imageUrl,
                            width: double.maxFinite,
                            height: 80,
                          ),
                          SizedBox(height: 10),
                          Text(
                            product.name.toLowerCase(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text('NGN ${product.price}')
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
