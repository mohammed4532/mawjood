import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BidsSubRecord extends FirestoreRecord {
  BidsSubRecord._(
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

  // "bidder" field.
  DocumentReference? _bidder;
  DocumentReference? get bidder => _bidder;
  bool hasBidder() => _bidder != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _bidder = snapshotData['bidder'] as DocumentReference?;
    _price = castToType<double>(snapshotData['price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bidsSub')
          : FirebaseFirestore.instance.collectionGroup('bidsSub');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('bidsSub').doc();

  static Stream<BidsSubRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BidsSubRecord.fromSnapshot(s));

  static Future<BidsSubRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BidsSubRecord.fromSnapshot(s));

  static BidsSubRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BidsSubRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BidsSubRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BidsSubRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BidsSubRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BidsSubRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBidsSubRecordData({
  String? id,
  String? name,
  DocumentReference? bidder,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'bidder': bidder,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class BidsSubRecordDocumentEquality implements Equality<BidsSubRecord> {
  const BidsSubRecordDocumentEquality();

  @override
  bool equals(BidsSubRecord? e1, BidsSubRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.bidder == e2?.bidder &&
        e1?.price == e2?.price;
  }

  @override
  int hash(BidsSubRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.bidder, e?.price]);

  @override
  bool isValidKey(Object? o) => o is BidsSubRecord;
}
