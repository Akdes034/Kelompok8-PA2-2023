import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/theme.dart';
import '../../data/models/order/order_model.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_event.dart';
import '../shared/custom_button.dart';

class OrderItem extends StatelessWidget {
  final OrderModel order;
  const OrderItem(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                'Order Code : ${order.code}',
                style: TextStyle(
                  color: dark,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                order.status,
                style: TextStyle(
                  color: order.status == 'Pending'
                      ? Colors.orange
                      : order.status == 'Processing'
                          ? Colors.blue
                          : order.status == 'Completed'
                              ? Colors.green
                              : order.status == 'Cancelled'
                                  ? Colors.red
                                  : Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Order Date: ${order.createdAt}',
            style: TextStyle(
              color: dark.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Total: Rp. ${order.total}',
            style: TextStyle(
              color: dark,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Payment Method: ${order.paymentMethod}',
            style: TextStyle(
              color: dark.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            order.description,
            style: TextStyle(
              color: dark.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),

        ],
      ),
    );
  }
}
