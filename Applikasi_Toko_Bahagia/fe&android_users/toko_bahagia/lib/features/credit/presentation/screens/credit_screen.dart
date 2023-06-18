import 'package:auto_route/auto_route.dart';
import 'package:delshop/routes/app_routers.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/theme.dart';
import '../bloc/credit_bloc.dart';
import '../bloc/credit_state.dart';
import '../bloc/credit_event.dart';
import '../shared/custom_text_form_field.dart';
import 'credit_item.dart';

const List<String> _Telkomsel = [
  'Te',
  'Tel',
  'Telk',
  'Telko',
  'Telkom',
  'Telkoms',
  'Telkomse',
  'Telkomsel',
  'te',
  'tel',
  'telk',
  'telko',
  'telkom',
  'telkoms',
  'telkomse',
  'telkomsel',
];

const List<String> _Indosat = [
  'I',
  'In',
  'Ind',
  'Indo',
  'Indos',
  'Indos',
  'Indosa',
  'Indosat',
  'i'
  'in'
  'ind'
  'indo'
];

const List<String> _XL = [
  'X',
  'XL',
  'x',
  'xl',
];

const List<String> _Axis = [
  'A',
  'Ax',
  'Axi',
  'Axis',
  'a',
  'ax',
  'axi',
  'axis',
];

const List<String> _Smartfren = [
  'S',
  's',
  'sm',
  'Sm',
  'Sma',
  'smar',
  'smar',
  'Smart',
  'Smartfren',
];

const List<String> _Tri = [
  'T',
  'Tr',
  'Tri',
  't',
  'tr',
  'tri',
];

class CreditScreen extends StatefulWidget {
  static const routeName = '/credit';
  const CreditScreen({super.key});

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  String _provider = '';
  final _searchController = TextEditingController();

  void _findProvider(String number) {
    setState(() {
      if (_Telkomsel.contains(number)) {
        _provider = 'Telkomsel';
      } else if (_Indosat.contains(number)) {
        _provider = 'Indosat';
      } else if (_XL.contains(number)) {
        _provider = 'XL';
      } else if (_Axis.contains(number)) {
        _provider = 'Axis';
      } else if (_Tri.contains(number)) {
        _provider = 'Tri';
      } else if (_Smartfren.contains(number)) {
        _provider = 'Smartfren';
      }
      context.read<CreditBloc>().add(
            GetDataEvent(_provider),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: chocolate2,
          elevation: 0,
          title: Text(
            'Top Up Pulsa',
            style: TextStyle(
              color: white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: white,
              size: 30,
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
          child: Container(

            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                // search bar
                Container(

                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: CustomTextFormField(
                    hintText: 'Carikan Nama Provider',
                    prefixIcon: Icon(
                      Icons.search,
                      color: softGray,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: _searchController,
                    onSaved: (value) => _searchController.text = value!,
                    onChanged: (_) {
                      // find provider by number
                      if (_searchController.text.length > 1) {
                        _findProvider(_searchController.text);
                      }
                      if (_searchController.text.length < 2) {
                        setState(() {
                          _provider = '';
                        });
                        context.read<CreditBloc>().add(
                              const GetDataEvent('Tidak'),
                            );
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    autofocus: false,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Daftar Pulsa',
                      style: TextStyle(
                        color: dark,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      // provider
                      if (_searchController.text.length >= 2)
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _provider,
                            style: TextStyle(
                              color: dark,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      if (_searchController.text.isEmpty || _provider == '')

                        Text(
                          'Carikan Provider Dulu',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: dark,
                          ),
                        ),
                      // grid view
                      BlocConsumer<CreditBloc, CreditState>(
                        listener: (context, state) {
                          if (state is CreditErrorState) {
                            const Center(
                              child: Text('Error'),
                            );
                          } else if (state is CreditInitialState) {
                            const Center(
                              child: Text(''),
                            );
                          }
                        },
                        listenWhen: (previous, current) {
                          if (current is CreditErrorState) {
                            return true;
                          } else if (current is CreditLoadedState) {
                            return true;
                          }
                          return false;
                        },
                        builder: (context, state) {
                          if (state is CreditInitialState) {
                            return const Center(
                              child: Text(''),
                            );
                          } else if (state is CreditLoadedState) {
                            return state.creditList.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Icon(
                                          Icons.credit_score,
                                          size: 100,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        if (_searchController.text.length > 0)
                                          Text(
                                          'Tidak ada Produk Untuk Provider yang dicari',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: dark,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: state.creditList.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: MediaQuery.of(context)
                                              .size
                                              .width /
                                          (MediaQuery.of(context).size.height /
                                              4),
                                    ),
                                    itemBuilder: (context, index) {
                                      return CreditItem(
                                          state.creditList[index]);
                                    },
                                  );
                          } else {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
