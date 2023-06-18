import 'package:delshop/features/home_guest/data/models/products/product_model.dart';
import 'package:delshop/shared/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatefulWidget {
  final ProductList? productList;

  const ProductItem({Key? key, this.productList}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            'Ada Diskon Sama Promosi nih....',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              widget.productList!.length,
                  (index) {
                if (widget.productList![index].discount != 0 ||
                    widget.productList![index].Promosi != 'Tidak Ada') {
                  return InkWell(
                    onTap: () {
                      // Handle product item tap
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueAccent.withOpacity(1.0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(1.0),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Image
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                widget.productList![index].image
                                    .parseBaseUrlImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Product details
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.productList![index].name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.productList![index].category,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(widget.productList![index].price)}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  Text(
                                    'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '').format((widget.productList![index].price) - (widget.productList![index].price * widget.productList![index].discount / 100))}',
                                    style: const TextStyle(
                                      color: Colors.amber,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              if (widget.productList![index].Promosi != 'Tidak Ada')
                                Text(
                                  'Promosi: ${widget.productList![index].Promosi}',
                                  style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 16,
                                  ),
                                ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Divider(height: 1, thickness: 1),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.productList!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Handle product item tap
              },
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        // Image
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.withOpacity(1.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              widget.productList![index].image
                                  .parseBaseUrlImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Product details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.productList![index].name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.productList![index].category,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              if (widget.productList![index].discount != 0)
                                Text(
                                  'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(widget.productList![index].price)}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              if (widget.productList![index].discount != 0)
                                Text(
                                  'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '').format((widget.productList![index].price) - (widget.productList![index].price * widget.productList![index].discount / 100))}',
                                  style: const TextStyle(
                                    color: Colors.amber,
                                    fontSize: 20,
                                  ),
                                ),
                              if (widget.productList![index].discount == 0)
                                Text(
                                  'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(widget.productList![index].price)}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              if (widget.productList![index].Promosi != 'Tidak Ada')
                                Text(
                                  'Promosi: ${widget.productList![index].Promosi}',
                                  style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 16,
                                  ),
                                ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Divider(height: 1, thickness: 1,), // Divider
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
