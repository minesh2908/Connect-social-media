import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupsRecord extends FirestoreRecord {
  GroupsRecord._(
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

  // "Members_ref" field.
  List<DocumentReference>? _membersRef;
  List<DocumentReference> get membersRef => _membersRef ?? const [];
  bool hasMembersRef() => _membersRef != null;

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

  // "comment_ref" field.
  List<DocumentReference>? _commentRef;
  List<DocumentReference> get commentRef => _commentRef ?? const [];
  bool hasCommentRef() => _commentRef != null;

  // "post_ref" field.
  List<DocumentReference>? _postRef;
  List<DocumentReference> get postRef => _postRef ?? const [];
  bool hasPostRef() => _postRef != null;

  // "SilencedMember_red" field.
  List<DocumentReference>? _silencedMemberRed;
  List<DocumentReference> get silencedMemberRed =>
      _silencedMemberRed ?? const [];
  bool hasSilencedMemberRed() => _silencedMemberRed != null;

  // "BannedMember_ref" field.
  List<DocumentReference>? _bannedMemberRef;
  List<DocumentReference> get bannedMemberRef => _bannedMemberRef ?? const [];
  bool hasBannedMemberRef() => _bannedMemberRef != null;

  void _initializeFields() {
    _groupId = snapshotData['GroupId'] as String?;
    _dateCreated = snapshotData['DateCreated'] as DateTime?;
    _groupTitle = snapshotData['GroupTitle'] as String?;
    _about = snapshotData['About'] as String?;
    _groupPhoto = snapshotData['GroupPhoto'] as String?;
    _membersRef = getDataList(snapshotData['Members_ref']);
    _moderatorsRef = getDataList(snapshotData['Moderators_ref']);
    _admistratorRef = getDataList(snapshotData['Admistrator_ref']);
    _createdByRef = snapshotData['createdBy_ref'] as DocumentReference?;
    _isPrivate = snapshotData['isPrivate'] as bool?;
    _isBanned = snapshotData['isBanned'] as bool?;
    _commentRef = getDataList(snapshotData['comment_ref']);
    _postRef = getDataList(snapshotData['post_ref']);
    _silencedMemberRed = getDataList(snapshotData['SilencedMember_red']);
    _bannedMemberRef = getDataList(snapshotData['BannedMember_ref']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsRecord.fromSnapshot(s));

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupsRecord.fromSnapshot(s));

  static GroupsRecord fromSnapshot(DocumentSnapshot snapshot) => GroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupsRecordData({
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

class GroupsRecordDocumentEquality implements Equality<GroupsRecord> {
  const GroupsRecordDocumentEquality();

  @override
  bool equals(GroupsRecord? e1, GroupsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.groupId == e2?.groupId &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.groupTitle == e2?.groupTitle &&
        e1?.about == e2?.about &&
        e1?.groupPhoto == e2?.groupPhoto &&
        listEquality.equals(e1?.membersRef, e2?.membersRef) &&
        listEquality.equals(e1?.moderatorsRef, e2?.moderatorsRef) &&
        listEquality.equals(e1?.admistratorRef, e2?.admistratorRef) &&
        e1?.createdByRef == e2?.createdByRef &&
        e1?.isPrivate == e2?.isPrivate &&
        e1?.isBanned == e2?.isBanned &&
        listEquality.equals(e1?.commentRef, e2?.commentRef) &&
        listEquality.equals(e1?.postRef, e2?.postRef) &&
        listEquality.equals(e1?.silencedMemberRed, e2?.silencedMemberRed) &&
        listEquality.equals(e1?.bannedMemberRef, e2?.bannedMemberRef);
  }

  @override
  int hash(GroupsRecord? e) => const ListEquality().hash([
        e?.groupId,
        e?.dateCreated,
        e?.groupTitle,
        e?.about,
        e?.groupPhoto,
        e?.membersRef,
        e?.moderatorsRef,
        e?.admistratorRef,
        e?.createdByRef,
        e?.isPrivate,
        e?.isBanned,
        e?.commentRef,
        e?.postRef,
        e?.silencedMemberRed,
        e?.bannedMemberRef
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupsRecord;
}
