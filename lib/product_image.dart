import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timbu/api_service.dart';

class ProductPage extends StatelessWidget {
  final Products product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.purple,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          title: Text(product.name.toUpperCase()),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                height: 250,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1.5, color: Colors.purple.shade400),
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Image.network(
                  product.imageUrl,
                  width: 300,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Description",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple.shade900,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                product.description,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text("NGN ${product.price}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple.shade200,
                          fontWeight: FontWeight.w300)),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Table(
                  border: TableBorder.all(color: Colors.purple.shade400),
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Additional Information',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Details',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Product ID'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(product.id),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Product Quantity'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${product.quantity}'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Availability:",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    product.available == true ? "Yes" : "No",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple.shade400,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
