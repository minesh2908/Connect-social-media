import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoriesRecord extends FirestoreRecord {
  StoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "DateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "PostedBy_ref" field.
  DocumentReference? _postedByRef;
  DocumentReference? get postedByRef => _postedByRef;
  bool hasPostedByRef() => _postedByRef != null;

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

  // "LikeBy_user" field.
  List<DocumentReference>? _likeByUser;
  List<DocumentReference> get likeByUser => _likeByUser ?? const [];
  bool hasLikeByUser() => _likeByUser != null;

  // "storyId" field.
  String? _storyId;
  String get storyId => _storyId ?? '';
  bool hasStoryId() => _storyId != null;

  void _initializeFields() {
    _dateCreated = snapshotData['DateCreated'] as DateTime?;
    _postedByRef = snapshotData['PostedBy_ref'] as DocumentReference?;
    _photo = snapshotData['Photo'] as String?;
    _video = snapshotData['Video'] as String?;
    _likes = castToType<int>(snapshotData['Likes']);
    _likeByUser = getDataList(snapshotData['LikeBy_user']);
    _storyId = snapshotData['storyId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Stories');

  static Stream<StoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoriesRecord.fromSnapshot(s));

  static Future<StoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoriesRecord.fromSnapshot(s));

  static StoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoriesRecordData({
  DateTime? dateCreated,
  DocumentReference? postedByRef,
  String? photo,
  String? video,
  int? likes,
  String? storyId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DateCreated': dateCreated,
      'PostedBy_ref': postedByRef,
      'Photo': photo,
      'Video': video,
      'Likes': likes,
      'storyId': storyId,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoriesRecordDocumentEquality implements Equality<StoriesRecord> {
  const StoriesRecordDocumentEquality();

  @override
  bool equals(StoriesRecord? e1, StoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dateCreated == e2?.dateCreated &&
        e1?.postedByRef == e2?.postedByRef &&
        e1?.photo == e2?.photo &&
        e1?.video == e2?.video &&
        e1?.likes == e2?.likes &&
        listEquality.equals(e1?.likeByUser, e2?.likeByUser) &&
        e1?.storyId == e2?.storyId;
  }

  @override
  int hash(StoriesRecord? e) => const ListEquality().hash([
        e?.dateCreated,
        e?.postedByRef,
        e?.photo,
        e?.video,
        e?.likes,
        e?.likeByUser,
        e?.storyId
      ]);

  @override
  bool isValidKey(Object? o) => o is StoriesRecord;
}
