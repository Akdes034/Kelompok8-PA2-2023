import 'package:delshop/features/home/presentation/screens/discount_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delshop/features/home_guest/presentation/bloc/home_bloc.dart';
import 'package:delshop/features/home_guest/presentation/bloc/home_event.dart';
import 'package:delshop/features/home_guest/presentation/bloc/home_state.dart';
import 'package:delshop/shared/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:delshop/routes/app_routers.gr.dart';


import './product_item.dart';


class HomeGuestScreen extends StatefulWidget {
  const HomeGuestScreen({Key? key}) : super(key: key);

  static const String routeName = '/home_guest';

  @override
  State<HomeGuestScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeGuestScreen> {

  void _showLoginPage() {
    AutoRouter.of(context).replace(const LoginScreen());
  }
  String _search = '';
  String _dsearch = '';
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<HomeGuestBloc>().add(
      GetDataEvent(_search),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchSubmitted() {
    setState(() {
      _search = _searchController.text;
      _dsearch = _search;
    });
    context.read<HomeGuestBloc>().add(
      GetDataEvent(_search),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeGuestBloc, HomeGuestState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeErrorState) {
            return Scaffold(
              body: Center(
                child: Text(
                  "There was an error loading the data",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: dark,
                  ),
                ),
              ),
            );
          } else if (state is HomeLoadedState) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: chocolate2,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Silahkan Menikmati Pelayanan di Toko Bahagia ini',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                // icon notification bell with how many notifications

                                // profile picture
                                GestureDetector(
                                  onTap: _showLoginPage,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.login,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _searchController,
                                    focusNode: _searchFocusNode,
                                    onChanged: (value) {
                                      setState(() {
                                        _search = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Cari Produk',
                                    ),
                                    onSubmitted: (_) => _onSearchSubmitted(),
                                  ),
                                ),
                                IconButton(
                                  onPressed: _onSearchSubmitted,
                                  icon: Icon(Icons.search),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      // Semua Promosi dengan latar belakang gambar
                      if (_dsearch == "")
                        Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                              AssetImage('assets/images/img.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [

                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (_dsearch != '')
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Hasil dari $_search',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        state.productList.isNotEmpty
                            ? ProductItem(
                          productList: state.productList,
                        )
                            : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.production_quantity_limits,
                                size: 100,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Tidak Ada Produk yang dicari',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: dark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
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
              ),
            );
          }
        },
      ),
    );
  }
}
