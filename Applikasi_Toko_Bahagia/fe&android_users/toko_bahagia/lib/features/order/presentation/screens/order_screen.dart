import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../routes/app_routers.gr.dart';
import '../../../../shared/theme.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_event.dart';
import '../bloc/order_state.dart';
import 'order_item.dart';

const List<String> status = [
  'All Requests',
  'Pending',
  'Processing',
  'Completed',
  'Cancelled',
];

class OrderScreen extends StatefulWidget {
  static const String routeName = '/order';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String statusValue = status.first;

  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        // Action when the QRIS button is pressed
        _showBarcodeDialog();
      },
      icon: const Icon(Icons.qr_code),
      label: const Text('QRIS'),
      backgroundColor: Colors.green,
    );
  }

  void _showBarcodeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('QRIS Barcode'),
          content: Image.asset(
            'assets/images/barcode.jpg',
            fit: BoxFit.cover,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(
      const GetOrdersEvent(''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F6FB),
        appBar: AppBar(
          backgroundColor: chocolate2,
          elevation: 0,
          title: Text(
            'Riwayat Pesanan',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              AutoRouter.of(context).pushAndPopUntil(
                const HomeScreen(),
                predicate: (_) => false,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<OrderBloc>().add(
                GetOrdersEvent(statusValue),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      children: [
                        // filter
                        // dropdown status
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(left: 20),
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: statusValue,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: dark,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              onChanged: (String? newValue) {
                                setState(() {
                                  statusValue = newValue!;
                                  if (statusValue == "All Requests") {
                                    context.read<OrderBloc>().add(
                                      GetOrdersEvent(''),
                                    );
                                  } else {
                                    context.read<OrderBloc>().add(
                                      GetOrdersEvent(statusValue),
                                    );
                                  }
                                });
                              },
                              items: status.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  String displayText;
                                  switch (value) {
                                    case 'All Requests':
                                      displayText = 'Semua';
                                      break;
                                    case 'Pending':
                                      displayText = 'Menunggu';
                                      break;
                                    case 'Processing':
                                      displayText = 'Diterima';
                                      break;
                                    case 'Completed':
                                      displayText = 'Selesai';
                                      break;
                                    case 'Cancelled':
                                      displayText = 'Ditolak';
                                      break;
                                    default:
                                      displayText = value;
                                  }
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(displayText),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocConsumer<OrderBloc, OrderState>(
                    listener: (context, state) {
                      if (state is OrderErrorState) {
                        EasyLoading.showError(state.message);
                      } else if (state is OrderCancelledState) {
                        EasyLoading.showSuccess(state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is OrderErrorState) {
                        return Center(
                          child: Text(
                            "There was an error loading the data",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: dark,
                            ),
                          ),
                        );
                      } else if (state is OrderLoadedState) {
                        return state.orders.isEmpty
                            ? Center(
                          child: Text(
                            "Tidak Ada Pesanan Ditemukan",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: dark,
                            ),
                          ),
                        )
                            : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.orders.length,
                          itemBuilder: (context, index) {
                            return OrderItem(state.orders[index]);
                          },
                        );
                      } else {
                        // show easy loading
                        return FutureBuilder(
                          future: Future.delayed(const Duration(seconds: 2)),
                          builder: (context, snapshot) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CircularProgressIndicator(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Loading...",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: dark,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }
}

