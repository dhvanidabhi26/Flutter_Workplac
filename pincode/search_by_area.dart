// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class SearchByAreaScreen extends StatefulWidget {
  const SearchByAreaScreen({super.key});

  @override
  State<SearchByAreaScreen> createState() => _SearchByAreaScreenState();
}

class _SearchByAreaScreenState extends State<SearchByAreaScreen> {
  String state = '';
  String district = '';
  String office_name = '';

  bool isOutLineBorder = true;

  bool isAvailable = false;
  Future<List<dynamic>> getStateList() async {
    var url = Uri.parse(
      'https://zoological-wafer.000webhostapp.com/pincode/stateList.php',
    );
    var resp = await http.get(url);
    return jsonDecode(resp.body);
  }

  Future<List<dynamic>> getDistrictList() async {
    var url = Uri.parse(
      'https://zoological-wafer.000webhostapp.com/pincode/districtList.php',
    );
    var resp = await http.post(url, body: {
      'state': state,
    });
    return jsonDecode(resp.body);
  }

  Future<List<dynamic>> getTalukaList() async {
    var url = Uri.parse(
      'https://zoological-wafer.000webhostapp.com/pincode/talukaList.php',
    );
    var resp = await http.post(url, body: {
      'district': district,
    });
    return jsonDecode(resp.body);
  }

  Future<List<dynamic>> getPins() async {
    var url = Uri.parse(
        'https://zoological-wafer.000webhostapp.com/pincode/getPinList.php');
    var resp = await http.post(url, body: {
      'office_name': office_name,
    });
    return jsonDecode(resp.body);
  }

  CollectionReference addToFavorite =
  FirebaseFirestore.instance.collection('favorites');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: FutureBuilder(
                future: getStateList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      return _widgetStateDropDownMenu(snapshot.data!, context);
                    } else {
                      return DropdownMenu(
                        width: MediaQuery.of(context).size.width * 0.8,
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(
                              value: 'No Data Found', label: 'No Data Found')
                        ],
                      );
                    }
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Image.asset(
                        'assets/error.jpg',
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: FutureBuilder(
                future: getDistrictList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      return _widgetDistrictDropDownMenu(
                          snapshot.data!, context);
                    } else {
                      return DropdownMenu(
                        width: MediaQuery.of(context).size.width * 0.8,
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(
                              value: 'No Data Found', label: 'No Data Found')
                        ],
                      );
                    }
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Image.asset(
                        'assets/error.jpg',
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: FutureBuilder(
                future: getTalukaList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      return _widgetTalukaDropDownMenu(snapshot.data!, context);
                    } else {
                      return DropdownMenu(
                        width: MediaQuery.of(context).size.width * 0.8,
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(
                              value: 'No Data Found', label: 'No Data Found')
                        ],
                      );
                    }
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Image.asset(
                        'assets/error.jpg',
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await getPins();
                    },
                    child: const Text('SEARCH')),
                ElevatedButton(
                  onPressed: () async {
                    await getPins();
                    setState(() {
                      state = '';
                      district = '';
                      office_name = '';
                    });
                  },
                  child: const Text('CLEAR'),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: FutureBuilder<List<dynamic>>(
                future: getPins(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Image.asset(
                        'assets/error.jpg',
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    return Expanded(child: _buildPincodeList(snapshot.data!));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPincodeList(List data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        Future<void> addToFavoriteFirebase() async {
          var checkData =
          await FirebaseFirestore.instance.collection('favorites').get();

          for (var element in checkData.docs) {
            var datav = element
                .data()
                .entries
                .where((element) => element.value == data[index]['pincode']);
            if (datav.isNotEmpty) {
              setState(() {
                isAvailable = true;
              });
            }
          }
          if (isAvailable) {
            print('do nothing');
          } else {
            addToFavorite.add({
              'circle_name': data[index]['circle_name'],
              'region_name': data[index]['region_name'],
              'division_name': data[index]['division_name'],
              'office_name': data[index]['office_name'],
              'pincode': data[index]['pincode'],
              'office_type': data[index]['office_type'],
              'delivery': data[index]['delivery'],
              'district': data[index]['district'],
              'state': data[index]['state'],
              // ignore: invalid_return_type_for_catch_error
            }).catchError((_) => print('Error Occured!'));
          }
        }

        return ExpansionTile(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(data[index]['pincode']),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index]['office_name'],
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      '${data[index]['district']} ${data[index]['state']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      addToFavoriteFirebase();
                      print('added');
                    },
                    icon: !isAvailable
                        ? const Icon(
                      Icons.favorite_border,
                    )
                        : Icon(
                      Icons.favorite,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Share.share("""
                        Office Name : ${data[index]['office_name']}
                        Pincode : ${data[index]['pincode']}
                        Region : ${data[index]['region_name']}
                        District : ${data[index]['district']}
                        State : ${data[index]['state']}
                        Office Type : ${data[index]['office_type']}
                        Delivery Status : ${data[index]['delivery']}',
                        Circle : ${data[index]['circle_name']}""");
                    },
                    icon: const Icon(
                      Icons.share,
                    ),
                  ),
                ],
              ),
            ],
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Office Name : ${data[index]['office_name']}'),
                Text('Pincode : ${data[index]['pincode']}'),
                Text('Region : ${data[index]['region_name']}'),
                Text('District : ${data[index]['district']}'),
                Text('State : ${data[index]['state']}'),
                Text('Office Type : ${data[index]['office_type']}'),
                Text('Delivery Status : ${data[index]['delivery']}'),
                Text('Circle : ${data[index]['circle_name']}'),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _widgetStateDropDownMenu(List list, BuildContext context) {
    return DropdownMenu(
      label: const Text('Search State'),
      width: MediaQuery.of(context).size.width * 0.8,
      dropdownMenuEntries: List.generate(
        list.length,
            (index) => DropdownMenuEntry(
            value: list[index]['state'], label: list[index]['state']),
      ),
      onSelected: (value) {
        setState(() {
          state = value;
        });
      },
    );
  }

  Widget _widgetDistrictDropDownMenu(List list, BuildContext context) {
    return DropdownMenu(
      label: const Text('Search District'),
      width: MediaQuery.of(context).size.width * 0.8,
      dropdownMenuEntries: List.generate(
        list.length,
            (index) => DropdownMenuEntry(
            value: list[index]['district'], label: list[index]['district']),
      ),
      onSelected: (value) {
        setState(() {
          district = value;
        });
      },
    );
  }

  Widget _widgetTalukaDropDownMenu(List list, BuildContext context) {
    return DropdownMenu(
      label: const Text('Search Taluka/Tehsil'),
      width: MediaQuery.of(context).size.width * 0.8,
      dropdownMenuEntries: List.generate(
        list.length,
            (index) => DropdownMenuEntry(
            value: list[index]['office_name'],
            label: list[index]['office_name']),
      ),
      onSelected: (value) {
        setState(() {
          office_name = value;
        });
      },
    );
  }
}