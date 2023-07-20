import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserMarketsRecord extends FirestoreRecord {
  UserMarketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "MarketId" field.
  String? _marketId;
  String get marketId => _marketId ?? '';
  bool hasMarketId() => _marketId != null;

  // "DateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "createdBy_user" field.
  DocumentReference? _createdByUser;
  DocumentReference? get createdByUser => _createdByUser;
  bool hasCreatedByUser() => _createdByUser != null;

  // "MarketName" field.
  String? _marketName;
  String get marketName => _marketName ?? '';
  bool hasMarketName() => _marketName != null;

  // "MarketAbout" field.
  String? _marketAbout;
  String get marketAbout => _marketAbout ?? '';
  bool hasMarketAbout() => _marketAbout != null;

  // "MarketPhoto" field.
  String? _marketPhoto;
  String get marketPhoto => _marketPhoto ?? '';
  bool hasMarketPhoto() => _marketPhoto != null;

  // "MarketItems_ref" field.
  List<DocumentReference>? _marketItemsRef;
  List<DocumentReference> get marketItemsRef => _marketItemsRef ?? const [];
  bool hasMarketItemsRef() => _marketItemsRef != null;

  // "UserFollowing_ref" field.
  List<DocumentReference>? _userFollowingRef;
  List<DocumentReference> get userFollowingRef => _userFollowingRef ?? const [];
  bool hasUserFollowingRef() => _userFollowingRef != null;

  // "Likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "LikedBy_users" field.
  List<DocumentReference>? _likedByUsers;
  List<DocumentReference> get likedByUsers => _likedByUsers ?? const [];
  bool hasLikedByUsers() => _likedByUsers != null;

  // "isVerified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  void _initializeFields() {
    _marketId = snapshotData['MarketId'] as String?;
    _dateCreated = snapshotData['DateCreated'] as DateTime?;
    _createdByUser = snapshotData['createdBy_user'] as DocumentReference?;
    _marketName = snapshotData['MarketName'] as String?;
    _marketAbout = snapshotData['MarketAbout'] as String?;
    _marketPhoto = snapshotData['MarketPhoto'] as String?;
    _marketItemsRef = getDataList(snapshotData['MarketItems_ref']);
    _userFollowingRef = getDataList(snapshotData['UserFollowing_ref']);
    _likes = castToType<int>(snapshotData['Likes']);
    _likedByUsers = getDataList(snapshotData['LikedBy_users']);
    _isVerified = snapshotData['isVerified'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userMarkets');

  static Stream<UserMarketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserMarketsRecord.fromSnapshot(s));

  static Future<UserMarketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserMarketsRecord.fromSnapshot(s));

  static UserMarketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserMarketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserMarketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserMarketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserMarketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserMarketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserMarketsRecordData({
  String? marketId,
  DateTime? dateCreated,
  DocumentReference? createdByUser,
  String? marketName,
  String? marketAbout,
  String? marketPhoto,
  int? likes,
  bool? isVerified,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'MarketId': marketId,
      'DateCreated': dateCreated,
      'createdBy_user': createdByUser,
      'MarketName': marketName,
      'MarketAbout': marketAbout,
      'MarketPhoto': marketPhoto,
      'Likes': likes,
      'isVerified': isVerified,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserMarketsRecordDocumentEquality implements Equality<UserMarketsRecord> {
  const UserMarketsRecordDocumentEquality();

  @override
  bool equals(UserMarketsRecord? e1, UserMarketsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.marketId == e2?.marketId &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.createdByUser == e2?.createdByUser &&
        e1?.marketName == e2?.marketName &&
        e1?.marketAbout == e2?.marketAbout &&
        e1?.marketPhoto == e2?.marketPhoto &&
        listEquality.equals(e1?.marketItemsRef, e2?.marketItemsRef) &&
        listEquality.equals(e1?.userFollowingRef, e2?.userFollowingRef) &&
        e1?.likes == e2?.likes &&
        listEquality.equals(e1?.likedByUsers, e2?.likedByUsers) &&
        e1?.isVerified == e2?.isVerified;
  }

  @override
  int hash(UserMarketsRecord? e) => const ListEquality().hash([
        e?.marketId,
        e?.dateCreated,
        e?.createdByUser,
        e?.marketName,
        e?.marketAbout,
        e?.marketPhoto,
        e?.marketItemsRef,
        e?.userFollowingRef,
        e?.likes,
        e?.likedByUsers,
        e?.isVerified
      ]);

  @override
  bool isValidKey(Object? o) => o is UserMarketsRecord;
}
