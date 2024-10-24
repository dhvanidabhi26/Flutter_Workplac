// ignore_for_file: constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

//enum for radio value
enum SearchMethod {
  ByPin,
  ByDistrict,
  ByOfficeName,
}

//quick screen widget
class QuickSearchScreen extends StatefulWidget {
  const QuickSearchScreen({super.key});

  @override
  State<QuickSearchScreen> createState() => _QuickSearchScreenState();
}

class _QuickSearchScreenState extends State<QuickSearchScreen> {
  SearchMethod searchMethod = SearchMethod.ByPin;

  //search controller
  final _searchController = TextEditingController();

  //object of collection
  CollectionReference addToFavorite =
  FirebaseFirestore.instance.collection('favorites');

  //check if podt data already added to favorite
  bool isAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  value: SearchMethod.ByPin,
                  groupValue: searchMethod,
                  onChanged: (value) {
                    setState(() {
                      searchMethod = value!;
                    });
                  },
                ),
                const Text(
                  'By Pin',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  value: SearchMethod.ByDistrict,
                  groupValue: searchMethod,
                  onChanged: (value) {
                    setState(() {
                      searchMethod = value!;
                    });
                  },
                ),
                const Text(
                  'By District',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  value: SearchMethod.ByOfficeName,
                  groupValue: searchMethod,
                  onChanged: (value) {
                    setState(() {
                      searchMethod = value!;
                    });
                  },
                ),
                const Text(
                  'By Office \nName',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              keyboardType: searchMethod == SearchMethod.ByPin
                  ? TextInputType.number
                  : TextInputType.text,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _searchPincode(
                        _searchController.text,
                        searchMethod,
                      );
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchController.clear();
                  },
                  icon: const Icon(Icons.cancel_sharp),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            FutureBuilder<List<dynamic>>(
              future:
              _searchPincode(_searchController.text.trim(), searchMethod),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    //  child: Image.asset(
                    //  'assets/error.jpg',
                    //   width: MediaQuery.of(context).size.width * 0.6,
                    //   height: MediaQuery.of(context).size.height * 0.2,
                    // ),
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
          ],
        ),
      ),
    );
  }

  Widget _buildPincodeList(List data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        //added pincode to favorite
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
                      //share pincode
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
}

//get method of searching pincode
String getColumnName(SearchMethod searchMethod) {
  return searchMethod == SearchMethod.ByPin
      ? 'pincode'
      : searchMethod == SearchMethod.ByDistrict
      ? 'district'
      : searchMethod == SearchMethod.ByOfficeName
      ? 'office_name'
      : '';
}

//get appropriate api for search pincode
String getUrl(SearchMethod searchMethod) {
  return searchMethod == SearchMethod.ByPin
      ? 'https://zoological-wafer.000webhostapp.com/pincode/searchByPincode.php'
      : searchMethod == SearchMethod.ByDistrict
      ? 'https://zoological-wafer.000webhostapp.com/pincode/searchByDistrict.php'
      : searchMethod == SearchMethod.ByOfficeName
      ? 'https://zoological-wafer.000webhostapp.com/pincode/searchByOffice.php'
      : '';
}

//search pincode
Future<List<dynamic>> _searchPincode(
    String value, SearchMethod searchMethod) async {
  var url = Uri.parse(
    getUrl(searchMethod),
  );
  var resp = await http.post(url, body: {
    'data': value,
  });

  return json.decode(resp.body);
}