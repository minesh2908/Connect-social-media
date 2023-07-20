import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BizPagesRecord extends FirestoreRecord {
  BizPagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "GroupId" field.
  String? _groupId;
  String get groupId => _groupId ?? '';
  bool hasGroupId() => _groupId != null;

  // "DateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "GroupTitle" field.
  String? _groupTitle;
  String get groupTitle => _groupTitle ?? '';
  bool hasGroupTitle() => _groupTitle != null;

  // "About" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  // "GroupPhoto" field.
  String? _groupPhoto;
  String get groupPhoto => _groupPhoto ?? '';
  bool hasGroupPhoto() => _groupPhoto != null;

  // "Moderators_ref" field.
  List<DocumentReference>? _moderatorsRef;
  List<DocumentReference> get moderatorsRef => _moderatorsRef ?? const [];
  bool hasModeratorsRef() => _moderatorsRef != null;

  // "Admistrator_ref" field.
  List<DocumentReference>? _admistratorRef;
  List<DocumentReference> get admistratorRef => _admistratorRef ?? const [];
  bool hasAdmistratorRef() => _admistratorRef != null;

  // "createdBy_ref" field.
  DocumentReference? _createdByRef;
  DocumentReference? get createdByRef => _createdByRef;
  bool hasCreatedByRef() => _createdByRef != null;

  // "isPrivate" field.
  bool? _isPrivate;
  bool get isPrivate => _isPrivate ?? false;
  bool hasIsPrivate() => _isPrivate != null;

  // "isBanned" field.
  bool? _isBanned;
  bool get isBanned => _isBanned ?? false;
  bool hasIsBanned() => _isBanned != null;

  // "comments_ref" field.
  List<DocumentReference>? _commentsRef;
  List<DocumentReference> get commentsRef => _commentsRef ?? const [];
  bool hasCommentsRef() => _commentsRef != null;

  // "UserFollowing_ref" field.
  List<DocumentReference>? _userFollowingRef;
  List<DocumentReference> get userFollowingRef => _userFollowingRef ?? const [];
  bool hasUserFollowingRef() => _userFollowingRef != null;

  void _initializeFields() {
    _groupId = snapshotData['GroupId'] as String?;
    _dateCreated = snapshotData['DateCreated'] as DateTime?;
    _groupTitle = snapshotData['GroupTitle'] as String?;
    _about = snapshotData['About'] as String?;
    _groupPhoto = snapshotData['GroupPhoto'] as String?;
    _moderatorsRef = getDataList(snapshotData['Moderators_ref']);
    _admistratorRef = getDataList(snapshotData['Admistrator_ref']);
    _createdByRef = snapshotData['createdBy_ref'] as DocumentReference?;
    _isPrivate = snapshotData['isPrivate'] as bool?;
    _isBanned = snapshotData['isBanned'] as bool?;
    _commentsRef = getDataList(snapshotData['comments_ref']);
    _userFollowingRef = getDataList(snapshotData['UserFollowing_ref']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BizPages');

  static Stream<BizPagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BizPagesRecord.fromSnapshot(s));

  static Future<BizPagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BizPagesRecord.fromSnapshot(s));

  static BizPagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BizPagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BizPagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BizPagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BizPagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BizPagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBizPagesRecordData({
  String? groupId,
  DateTime? dateCreated,
  String? groupTitle,
  String? about,
  String? groupPhoto,
  DocumentReference? createdByRef,
  bool? isPrivate,
  bool? isBanned,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'GroupId': groupId,
      'DateCreated': dateCreated,
      'GroupTitle': groupTitle,
      'About': about,
      'GroupPhoto': groupPhoto,
      'createdBy_ref': createdByRef,
      'isPrivate': isPrivate,
      'isBanned': isBanned,
    }.withoutNulls,
  );

  return firestoreData;
}

class BizPagesRecordDocumentEquality implements Equality<BizPagesRecord> {
  const BizPagesRecordDocumentEquality();

  @override
  bool equals(BizPagesRecord? e1, BizPagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.groupId == e2?.groupId &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.groupTitle == e2?.groupTitle &&
        e1?.about == e2?.about &&
        e1?.groupPhoto == e2?.groupPhoto &&
        listEquality.equals(e1?.moderatorsRef, e2?.moderatorsRef) &&
        listEquality.equals(e1?.admistratorRef, e2?.admistratorRef) &&
        e1?.createdByRef == e2?.createdByRef &&
        e1?.isPrivate == e2?.isPrivate &&
        e1?.isBanned == e2?.isBanned &&
        listEquality.equals(e1?.commentsRef, e2?.commentsRef) &&
        listEquality.equals(e1?.userFollowingRef, e2?.userFollowingRef);
  }

  @override
  int hash(BizPagesRecord? e) => const ListEquality().hash([
        e?.groupId,
        e?.dateCreated,
        e?.groupTitle,
        e?.about,
        e?.groupPhoto,
        e?.moderatorsRef,
        e?.admistratorRef,
        e?.createdByRef,
        e?.isPrivate,
        e?.isBanned,
        e?.commentsRef,
        e?.userFollowingRef
      ]);

  @override
  bool isValidKey(Object? o) => o is BizPagesRecord;
}
