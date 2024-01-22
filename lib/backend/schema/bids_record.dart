import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BidsRecord extends FirestoreRecord {
  BidsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "job" field.
  DocumentReference? _job;
  DocumentReference? get job => _job;
  bool hasJob() => _job != null;

  // "bidder" field.
  DocumentReference? _bidder;
  DocumentReference? get bidder => _bidder;
  bool hasBidder() => _bidder != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _job = snapshotData['job'] as DocumentReference?;
    _bidder = snapshotData['bidder'] as DocumentReference?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bids');

  static Stream<BidsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BidsRecord.fromSnapshot(s));

  static Future<BidsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BidsRecord.fromSnapshot(s));

  static BidsRecord fromSnapshot(DocumentSnapshot snapshot) => BidsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BidsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BidsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BidsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BidsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBidsRecordData({
  String? id,
  String? name,
  DocumentReference? job,
  DocumentReference? bidder,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'job': job,
      'bidder': bidder,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class BidsRecordDocumentEquality implements Equality<BidsRecord> {
  const BidsRecordDocumentEquality();

  @override
  bool equals(BidsRecord? e1, BidsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.job == e2?.job &&
        e1?.bidder == e2?.bidder &&
        e1?.price == e2?.price;
  }

  @override
  int hash(BidsRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.job, e?.bidder, e?.price]);

  @override
  bool isValidKey(Object? o) => o is BidsRecord;
}
