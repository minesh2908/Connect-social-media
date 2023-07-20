import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "PostId" field.
  String? _postId;
  String get postId => _postId ?? '';
  bool hasPostId() => _postId != null;

  // "DateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "PostedBy_ref" field.
  DocumentReference? _postedByRef;
  DocumentReference? get postedByRef => _postedByRef;
  bool hasPostedByRef() => _postedByRef != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "Photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "Video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "Likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "isPrivate" field.
  bool? _isPrivate;
  bool get isPrivate => _isPrivate ?? false;
  bool hasIsPrivate() => _isPrivate != null;

  // "LikeBy_user" field.
  List<DocumentReference>? _likeByUser;
  List<DocumentReference> get likeByUser => _likeByUser ?? const [];
  bool hasLikeByUser() => _likeByUser != null;

  // "Group_ref" field.
  DocumentReference? _groupRef;
  DocumentReference? get groupRef => _groupRef;
  bool hasGroupRef() => _groupRef != null;

  // "comment_ref" field.
  List<DocumentReference>? _commentRef;
  List<DocumentReference> get commentRef => _commentRef ?? const [];
  bool hasCommentRef() => _commentRef != null;

  // "comments" field.
  int? _comments;
  int get comments => _comments ?? 0;
  bool hasComments() => _comments != null;

  void _initializeFields() {
    _postId = snapshotData['PostId'] as String?;
    _dateCreated = snapshotData['DateCreated'] as DateTime?;
    _postedByRef = snapshotData['PostedBy_ref'] as DocumentReference?;
    _content = snapshotData['content'] as String?;
    _photo = snapshotData['Photo'] as String?;
    _video = snapshotData['Video'] as String?;
    _likes = castToType<int>(snapshotData['Likes']);
    _isPrivate = snapshotData['isPrivate'] as bool?;
    _likeByUser = getDataList(snapshotData['LikeBy_user']);
    _groupRef = snapshotData['Group_ref'] as DocumentReference?;
    _commentRef = getDataList(snapshotData['comment_ref']);
    _comments = castToType<int>(snapshotData['comments']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? postId,
  DateTime? dateCreated,
  DocumentReference? postedByRef,
  String? content,
  String? photo,
  String? video,
  int? likes,
  bool? isPrivate,
  DocumentReference? groupRef,
  int? comments,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PostId': postId,
      'DateCreated': dateCreated,
      'PostedBy_ref': postedByRef,
      'content': content,
      'Photo': photo,
      'Video': video,
      'Likes': likes,
      'isPrivate': isPrivate,
      'Group_ref': groupRef,
      'comments': comments,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postId == e2?.postId &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.postedByRef == e2?.postedByRef &&
        e1?.content == e2?.content &&
        e1?.photo == e2?.photo &&
        e1?.video == e2?.video &&
        e1?.likes == e2?.likes &&
        e1?.isPrivate == e2?.isPrivate &&
        listEquality.equals(e1?.likeByUser, e2?.likeByUser) &&
        e1?.groupRef == e2?.groupRef &&
        listEquality.equals(e1?.commentRef, e2?.commentRef) &&
        e1?.comments == e2?.comments;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postId,
        e?.dateCreated,
        e?.postedByRef,
        e?.content,
        e?.photo,
        e?.video,
        e?.likes,
        e?.isPrivate,
        e?.likeByUser,
        e?.groupRef,
        e?.commentRef,
        e?.comments
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
