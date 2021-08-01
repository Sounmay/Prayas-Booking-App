import 'package:cloud_firestore/cloud_firestore.dart';

class Parlour {
  final String id;
  final String parlourName;
  final String location;
  final String image;
  final String type;
  final String week;
  final String time;
  List<dynamic> mostAvailservices;

  Parlour(
      {this.id,
      this.parlourName,
      this.location,
      this.image,
      this.type, this.week, this.time,
      this.mostAvailservices = const []});

  factory Parlour.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Parlour(
        type: 'parlour',
        id: doc.id,
        parlourName: data['location']['name'] ?? '',
        location: data['location']['address'] ?? '',
        image: data['details']['parlourImage'] ?? '',
        mostAvailservices: data['mostAvailServices'] ?? [],
        week : data['slotList'][0]['weekRange'] ?? '',
        time : data['slotList'][0]['fromHr'] + ':' + data['slotList'][0]['fromMin'] +' AM - ' + data['slotList'][0]['toHr'] + ':' + data['slotList'][0]['toMin'] + ' PM',
    );
  }
}
