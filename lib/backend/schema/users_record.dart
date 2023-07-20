import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "firstname" field.
  String? _firstname;
  String get firstname => _firstname ?? '';
  bool hasFirstname() => _firstname != null;

  // "lastname" field.
  String? _lastname;
  String get lastname => _lastname ?? '';
  bool hasLastname() => _lastname != null;

  // "zipcode" field.
  int? _zipcode;
  int get zipcode => _zipcode ?? 0;
  bool hasZipcode() => _zipcode != null;

  // "usersbeingfollowed" field.
  List<DocumentReference>? _usersbeingfollowed;
  List<DocumentReference> get usersbeingfollowed =>
      _usersbeingfollowed ?? const [];
  bool hasUsersbeingfollowed() => _usersbeingfollowed != null;

  // "userFollowingMe" field.
  List<DocumentReference>? _userFollowingMe;
  List<DocumentReference> get userFollowingMe => _userFollowingMe ?? const [];
  bool hasUserFollowingMe() => _userFollowingMe != null;

  // "isAccountSuspended" field.
  bool? _isAccountSuspended;
  bool get isAccountSuspended => _isAccountSuspended ?? false;
  bool hasIsAccountSuspended() => _isAccountSuspended != null;

  // "isAccountBanned" field.
  bool? _isAccountBanned;
  bool get isAccountBanned => _isAccountBanned ?? false;
  bool hasIsAccountBanned() => _isAccountBanned != null;

  // "isAccountVerified" field.
  bool? _isAccountVerified;
  bool get isAccountVerified => _isAccountVerified ?? false;
  bool hasIsAccountVerified() => _isAccountVerified != null;

  // "Bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "BannerImage" field.
  String? _bannerImage;
  String get bannerImage => _bannerImage ?? '';
  bool hasBannerImage() => _bannerImage != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _firstname = snapshotData['firstname'] as String?;
    _lastname = snapshotData['lastname'] as String?;
    _zipcode = castToType<int>(snapshotData['zipcode']);
    _usersbeingfollowed = getDataList(snapshotData['usersbeingfollowed']);
    _userFollowingMe = getDataList(snapshotData['userFollowingMe']);
    _isAccountSuspended = snapshotData['isAccountSuspended'] as bool?;
    _isAccountBanned = snapshotData['isAccountBanned'] as bool?;
    _isAccountVerified = snapshotData['isAccountVerified'] as bool?;
    _bio = snapshotData['Bio'] as String?;
    _bannerImage = snapshotData['BannerImage'] as String?;
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
  String? firstname,
  String? lastname,
  int? zipcode,
  bool? isAccountSuspended,
  bool? isAccountBanned,
  bool? isAccountVerified,
  String? bio,
  String? bannerImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'firstname': firstname,
      'lastname': lastname,
      'zipcode': zipcode,
      'isAccountSuspended': isAccountSuspended,
      'isAccountBanned': isAccountBanned,
      'isAccountVerified': isAccountVerified,
      'Bio': bio,
      'BannerImage': bannerImage,
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
        e1?.firstname == e2?.firstname &&
        e1?.lastname == e2?.lastname &&
        e1?.zipcode == e2?.zipcode &&
        listEquality.equals(e1?.usersbeingfollowed, e2?.usersbeingfollowed) &&
        listEquality.equals(e1?.userFollowingMe, e2?.userFollowingMe) &&
        e1?.isAccountSuspended == e2?.isAccountSuspended &&
        e1?.isAccountBanned == e2?.isAccountBanned &&
        e1?.isAccountVerified == e2?.isAccountVerified &&
        e1?.bio == e2?.bio &&
        e1?.bannerImage == e2?.bannerImage;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.firstname,
        e?.lastname,
        e?.zipcode,
        e?.usersbeingfollowed,
        e?.userFollowingMe,
        e?.isAccountSuspended,
        e?.isAccountBanned,
        e?.isAccountVerified,
        e?.bio,
        e?.bannerImage
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
