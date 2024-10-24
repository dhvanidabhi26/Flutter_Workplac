// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SavedRecordsScreen extends StatefulWidget {
  const SavedRecordsScreen({super.key});

  @override
  State<SavedRecordsScreen> createState() => _SavedRecordsScreenState();
}

class _SavedRecordsScreenState extends State<SavedRecordsScreen> {
  //get list of favorite pincode object
  final Stream<QuerySnapshot> favoriteList =
  FirebaseFirestore.instance.collection('favorites').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        child: StreamBuilder(
          stream: favoriteList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              final favoriteList = [];
              snapshot.data?.docs.map((DocumentSnapshot documentSnapshot) {
                Map store = documentSnapshot.data() as Map<String, dynamic>;
                favoriteList.add(store);
                store['id'] = documentSnapshot.id;
              }).toList();

              return Expanded(child: _buildPincodeList(favoriteList));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  //display pincode in list
  Widget _buildPincodeList(List data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        //remove pincode froom list
        Future<void> removeToFavoriteFirebase(String id) {
          CollectionReference removeFavorite =
          FirebaseFirestore.instance.collection('favorites');
          return removeFavorite
              .doc(id)
              .delete()
              .catchError((_) => print('Error Occured!'));
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
                      removeToFavoriteFirebase(data[index]['id']);
                      print('added');
                    },
                    icon: Icon(
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
}