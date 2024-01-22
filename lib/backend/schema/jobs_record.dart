import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobsRecord extends FirestoreRecord {
  JobsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "subcategoryName" field.
  String? _subcategoryName;
  String get subcategoryName => _subcategoryName ?? '';
  bool hasSubcategoryName() => _subcategoryName != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "bids" field.
  List<DocumentReference>? _bids;
  List<DocumentReference> get bids => _bids ?? const [];
  bool hasBids() => _bids != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "deadline" field.
  DateTime? _deadline;
  DateTime? get deadline => _deadline;
  bool hasDeadline() => _deadline != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "locationCity" field.
  String? _locationCity;
  String get locationCity => _locationCity ?? '';
  bool hasLocationCity() => _locationCity != null;

  // "statusFlag" field.
  bool? _statusFlag;
  bool get statusFlag => _statusFlag ?? false;
  bool hasStatusFlag() => _statusFlag != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _likes = castToType<int>(snapshotData['likes']);
    _value = castToType<double>(snapshotData['value']);
    _imageUrl = snapshotData['image_url'] as String?;
    _videoUrl = snapshotData['video_url'] as String?;
    _categoryName = snapshotData['categoryName'] as String?;
    _subcategoryName = snapshotData['subcategoryName'] as String?;
    _id = snapshotData['id'] as String?;
    _bids = getDataList(snapshotData['bids']);
    _status = snapshotData['status'] as String?;
    _deadline = snapshotData['deadline'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _location = snapshotData['location'] as String?;
    _locationCity = snapshotData['locationCity'] as String?;
    _statusFlag = snapshotData['statusFlag'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jobs');

  static Stream<JobsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobsRecord.fromSnapshot(s));

  static Future<JobsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobsRecord.fromSnapshot(s));

  static JobsRecord fromSnapshot(DocumentSnapshot snapshot) => JobsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobsRecord._(reference, mapFromFirestore(data));

  static JobsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      JobsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'user': convertAlgoliaParam(
            snapshot.data['user'],
            ParamType.DocumentReference,
            false,
          ),
          'description': snapshot.data['description'],
          'likes': convertAlgoliaParam(
            snapshot.data['likes'],
            ParamType.int,
            false,
          ),
          'value': convertAlgoliaParam(
            snapshot.data['value'],
            ParamType.double,
            false,
          ),
          'image_url': snapshot.data['image_url'],
          'video_url': snapshot.data['video_url'],
          'categoryName': snapshot.data['categoryName'],
          'subcategoryName': snapshot.data['subcategoryName'],
          'id': snapshot.data['id'],
          'bids': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['bids'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'status': snapshot.data['status'],
          'deadline': convertAlgoliaParam(
            snapshot.data['deadline'],
            ParamType.DateTime,
            false,
          ),
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'location': snapshot.data['location'],
          'locationCity': snapshot.data['locationCity'],
          'statusFlag': snapshot.data['statusFlag'],
        },
        JobsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<JobsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'jobs',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'JobsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobsRecordData({
  String? name,
  DateTime? createdAt,
  DocumentReference? user,
  String? description,
  int? likes,
  double? value,
  String? imageUrl,
  String? videoUrl,
  String? categoryName,
  String? subcategoryName,
  String? id,
  String? status,
  DateTime? deadline,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? location,
  String? locationCity,
  bool? statusFlag,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'created_at': createdAt,
      'user': user,
      'description': description,
      'likes': likes,
      'value': value,
      'image_url': imageUrl,
      'video_url': videoUrl,
      'categoryName': categoryName,
      'subcategoryName': subcategoryName,
      'id': id,
      'status': status,
      'deadline': deadline,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'location': location,
      'locationCity': locationCity,
      'statusFlag': statusFlag,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobsRecordDocumentEquality implements Equality<JobsRecord> {
  const JobsRecordDocumentEquality();

  @override
  bool equals(JobsRecord? e1, JobsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.createdAt == e2?.createdAt &&
        e1?.user == e2?.user &&
        e1?.description == e2?.description &&
        e1?.likes == e2?.likes &&
        e1?.value == e2?.value &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.categoryName == e2?.categoryName &&
        e1?.subcategoryName == e2?.subcategoryName &&
        e1?.id == e2?.id &&
        listEquality.equals(e1?.bids, e2?.bids) &&
        e1?.status == e2?.status &&
        e1?.deadline == e2?.deadline &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.location == e2?.location &&
        e1?.locationCity == e2?.locationCity &&
        e1?.statusFlag == e2?.statusFlag;
  }

  @override
  int hash(JobsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.createdAt,
        e?.user,
        e?.description,
        e?.likes,
        e?.value,
        e?.imageUrl,
        e?.videoUrl,
        e?.categoryName,
        e?.subcategoryName,
        e?.id,
        e?.bids,
        e?.status,
        e?.deadline,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.location,
        e?.locationCity,
        e?.statusFlag
      ]);

  @override
  bool isValidKey(Object? o) => o is JobsRecord;
}
