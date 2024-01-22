import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourtsRecord extends FirestoreRecord {
  CourtsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "imageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  bool hasImageURL() => _imageURL != null;

  // "locationCity" field.
  String? _locationCity;
  String get locationCity => _locationCity ?? '';
  bool hasLocationCity() => _locationCity != null;

  // "statusFlag" field.
  bool? _statusFlag;
  bool get statusFlag => _statusFlag ?? false;
  bool hasStatusFlag() => _statusFlag != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _user = snapshotData['user'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _category = snapshotData['category'] as String?;
    _imageURL = snapshotData['imageURL'] as String?;
    _locationCity = snapshotData['locationCity'] as String?;
    _statusFlag = snapshotData['statusFlag'] as bool?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courts');

  static Stream<CourtsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourtsRecord.fromSnapshot(s));

  static Future<CourtsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourtsRecord.fromSnapshot(s));

  static CourtsRecord fromSnapshot(DocumentSnapshot snapshot) => CourtsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourtsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourtsRecord._(reference, mapFromFirestore(data));

  static CourtsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CourtsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'user': convertAlgoliaParam(
            snapshot.data['user'],
            ParamType.DocumentReference,
            false,
          ),
          'description': snapshot.data['description'],
          'category': snapshot.data['category'],
          'imageURL': snapshot.data['imageURL'],
          'locationCity': snapshot.data['locationCity'],
          'statusFlag': snapshot.data['statusFlag'],
          'status': snapshot.data['status'],
        },
        CourtsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CourtsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'courts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CourtsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourtsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourtsRecordData({
  String? name,
  LatLng? location,
  DocumentReference? user,
  String? description,
  String? category,
  String? imageURL,
  String? locationCity,
  bool? statusFlag,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'user': user,
      'description': description,
      'category': category,
      'imageURL': imageURL,
      'locationCity': locationCity,
      'statusFlag': statusFlag,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourtsRecordDocumentEquality implements Equality<CourtsRecord> {
  const CourtsRecordDocumentEquality();

  @override
  bool equals(CourtsRecord? e1, CourtsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.user == e2?.user &&
        e1?.description == e2?.description &&
        e1?.category == e2?.category &&
        e1?.imageURL == e2?.imageURL &&
        e1?.locationCity == e2?.locationCity &&
        e1?.statusFlag == e2?.statusFlag &&
        e1?.status == e2?.status;
  }

  @override
  int hash(CourtsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.user,
        e?.description,
        e?.category,
        e?.imageURL,
        e?.locationCity,
        e?.statusFlag,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is CourtsRecord;
}
