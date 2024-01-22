import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "favorites" field.
  List<DocumentReference>? _favorites;
  List<DocumentReference> get favorites => _favorites ?? const [];
  bool hasFavorites() => _favorites != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "lastLogin" field.
  DateTime? _lastLogin;
  DateTime? get lastLogin => _lastLogin;
  bool hasLastLogin() => _lastLogin != null;

  // "isVerified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "locationAddress" field.
  String? _locationAddress;
  String get locationAddress => _locationAddress ?? '';
  bool hasLocationAddress() => _locationAddress != null;

  // "locationCity" field.
  String? _locationCity;
  String get locationCity => _locationCity ?? '';
  bool hasLocationCity() => _locationCity != null;

  // "locationCountry" field.
  String? _locationCountry;
  String get locationCountry => _locationCountry ?? '';
  bool hasLocationCountry() => _locationCountry != null;

  // "accpetedToTerms" field.
  bool? _accpetedToTerms;
  bool get accpetedToTerms => _accpetedToTerms ?? false;
  bool hasAccpetedToTerms() => _accpetedToTerms != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userType = snapshotData['user_type'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _favorites = getDataList(snapshotData['favorites']);
    _language = snapshotData['language'] as String?;
    _lastLogin = snapshotData['lastLogin'] as DateTime?;
    _isVerified = snapshotData['isVerified'] as bool?;
    _locationAddress = snapshotData['locationAddress'] as String?;
    _locationCity = snapshotData['locationCity'] as String?;
    _locationCountry = snapshotData['locationCountry'] as String?;
    _accpetedToTerms = snapshotData['accpetedToTerms'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userType,
  LatLng? location,
  String? language,
  DateTime? lastLogin,
  bool? isVerified,
  String? locationAddress,
  String? locationCity,
  String? locationCountry,
  bool? accpetedToTerms,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'user_type': userType,
      'location': location,
      'language': language,
      'lastLogin': lastLogin,
      'isVerified': isVerified,
      'locationAddress': locationAddress,
      'locationCity': locationCity,
      'locationCountry': locationCountry,
      'accpetedToTerms': accpetedToTerms,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userType == e2?.userType &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.favorites, e2?.favorites) &&
        e1?.language == e2?.language &&
        e1?.lastLogin == e2?.lastLogin &&
        e1?.isVerified == e2?.isVerified &&
        e1?.locationAddress == e2?.locationAddress &&
        e1?.locationCity == e2?.locationCity &&
        e1?.locationCountry == e2?.locationCountry &&
        e1?.accpetedToTerms == e2?.accpetedToTerms;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userType,
        e?.location,
        e?.favorites,
        e?.language,
        e?.lastLogin,
        e?.isVerified,
        e?.locationAddress,
        e?.locationCity,
        e?.locationCountry,
        e?.accpetedToTerms
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
