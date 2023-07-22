import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "commentId" field.
  String? _commentId;
  String get commentId => _commentId ?? '';
  bool hasCommentId() => _commentId != null;

  // "DateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "Likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "LikeBy_Users" field.
  List<DocumentReference>? _likeByUsers;
  List<DocumentReference> get likeByUsers => _likeByUsers ?? const [];
  bool hasLikeByUsers() => _likeByUsers != null;

  // "Post_ref" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "Group_ref" field.
  DocumentReference? _groupRef;
  DocumentReference? get groupRef => _groupRef;
  bool hasGroupRef() => _groupRef != null;

  // "createdBy_ref" field.
  DocumentReference? _createdByRef;
  DocumentReference? get createdByRef => _createdByRef;
  bool hasCreatedByRef() => _createdByRef != null;

  void _initializeFields() {
    _commentId = snapshotData['commentId'] as String?;
    _dateCreated = snapshotData['DateCreated'] as DateTime?;
    _content = snapshotData['content'] as String?;
    _likes = castToType<int>(snapshotData['Likes']);
    _likeByUsers = getDataList(snapshotData['LikeBy_Users']);
    _postRef = snapshotData['Post_ref'] as DocumentReference?;
    _groupRef = snapshotData['Group_ref'] as DocumentReference?;
    _createdByRef = snapshotData['createdBy_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  String? commentId,
  DateTime? dateCreated,
  String? content,
  int? likes,
  DocumentReference? postRef,
  DocumentReference? groupRef,
  DocumentReference? createdByRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'commentId': commentId,
      'DateCreated': dateCreated,
      'content': content,
      'Likes': likes,
      'Post_ref': postRef,
      'Group_ref': groupRef,
      'createdBy_ref': createdByRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.commentId == e2?.commentId &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.content == e2?.content &&
        e1?.likes == e2?.likes &&
        listEquality.equals(e1?.likeByUsers, e2?.likeByUsers) &&
        e1?.postRef == e2?.postRef &&
        e1?.groupRef == e2?.groupRef &&
        e1?.createdByRef == e2?.createdByRef;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.commentId,
        e?.dateCreated,
        e?.content,
        e?.likes,
        e?.likeByUsers,
        e?.postRef,
        e?.groupRef,
        e?.createdByRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
