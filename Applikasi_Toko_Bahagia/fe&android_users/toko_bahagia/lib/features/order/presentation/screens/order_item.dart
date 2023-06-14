import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../routes/app_routers.gr.dart';
import '../../../../shared/theme.dart';
import '../../data/models/order/order_model.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_event.dart';
import '../shared/custom_button.dart';

class OrderItem extends StatefulWidget {
  final OrderModel order;

  const OrderItem(this.order, {Key? key}) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) {
      EasyLoading.showError('Pilih Gambar Dulu');
    }

    final code = widget.order.id; // Mengambil nilai code dari objek order
    final url = Uri.parse('http://192.168.88.52/test/api_del_shop/public/api/order/$code/edit-photo');
    final request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('image', _imageFile!.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
      EasyLoading.showSuccess('Berhasil Upload');
      AutoRouter.of(context).push(
        const OrderScreen(),
      );

    } else {
      print('Image upload failed with status code ${response.statusCode}');
    }
  }

  String getOrderStatusText(String status) {
    switch (status) {
      case 'Pending':
        return 'Menunggu';
      case 'Processing':
        return 'Diterima';
      case 'Completed':
        return 'Selesai';
      case 'Cancelled':
        return 'Ditolak';
      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kode Pesanan : ${widget.order.code}',
                style: TextStyle(
                  color: dark,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                getOrderStatusText(widget.order.status),
                style: TextStyle(
                  color: widget.order.status == 'Pending'
                      ? Colors.orange
                      : widget.order.status == 'Processing'
                      ? Colors.blue
                      : widget.order.status == 'Completed'
                      ? Colors.green
                      : widget.order.status == 'Cancelled'
                      ? Colors.red
                      : Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (widget.order.orderDetails.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(widget.order.orderDetails.length, (index) {
                final orderDetail = widget.order.orderDetails[index];
                final product = orderDetail.product;
                final orderItemText = '${index + 1}. ${product.name} ${orderDetail.quantity} pcs';

                return Text(orderItemText);
              }),
            ),
          const SizedBox(height: 10),
          Text(
            'Tanggal Pesanan: ${widget.order.createdAt}',
            style: TextStyle(
              color: dark.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Total: Rp. ${widget.order.total}',
            style: TextStyle(
              color: dark,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Metode Pembayaran: ${widget.order.paymentMethod}',
            style: TextStyle(
              color: dark.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          if (widget.order.bukti_pembayaran == 'non.jpg')
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue, // Ganti dengan warna biru yang diinginkan
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (_imageFile != null) {
                        // Perform action when the image button is pressed, e.g., show the image in a dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Selected Image'),
                            content: Image.file(_imageFile!),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        EasyLoading.showError('Pilih Gambar Dulu');
                      }
                    },
                    icon: Icon(Icons.image), // Ganti dengan asset gambar yang diinginkan
                    color: Colors.white, // Ganti dengan warna ikon di dalam tombol
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pilih Gambar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: _uploadImage,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Change the background color here
                  ),
                  icon: Icon(Icons.send), // Add the send icon here
                  label: Text('Kirim Bukti'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
