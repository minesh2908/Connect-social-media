import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarketItemsRecord extends FirestoreRecord {
  MarketItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ItemId" field.
  String? _itemId;
  String get itemId => _itemId ?? '';
  bool hasItemId() => _itemId != null;

  // "DateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "createdBy_ref" field.
  DocumentReference? _createdByRef;
  DocumentReference? get createdByRef => _createdByRef;
  bool hasCreatedByRef() => _createdByRef != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "AvailableQty" field.
  int? _availableQty;
  int get availableQty => _availableQty ?? 0;
  bool hasAvailableQty() => _availableQty != null;

  // "Price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "isAvailable" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  bool hasIsAvailable() => _isAvailable != null;

  // "comments_Ref" field.
  List<DocumentReference>? _commentsRef;
  List<DocumentReference> get commentsRef => _commentsRef ?? const [];
  bool hasCommentsRef() => _commentsRef != null;

  // "PurchasedBy_User" field.
  List<DocumentReference>? _purchasedByUser;
  List<DocumentReference> get purchasedByUser => _purchasedByUser ?? const [];
  bool hasPurchasedByUser() => _purchasedByUser != null;

  void _initializeFields() {
    _itemId = snapshotData['ItemId'] as String?;
    _dateCreated = snapshotData['DateCreated'] as DateTime?;
    _createdByRef = snapshotData['createdBy_ref'] as DocumentReference?;
    _title = snapshotData['Title'] as String?;
    _description = snapshotData['Description'] as String?;
    _photo = snapshotData['Photo'] as String?;
    _availableQty = castToType<int>(snapshotData['AvailableQty']);
    _price = castToType<int>(snapshotData['Price']);
    _isAvailable = snapshotData['isAvailable'] as bool?;
    _commentsRef = getDataList(snapshotData['comments_Ref']);
    _purchasedByUser = getDataList(snapshotData['PurchasedBy_User']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('marketItems');

  static Stream<MarketItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MarketItemsRecord.fromSnapshot(s));

  static Future<MarketItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MarketItemsRecord.fromSnapshot(s));

  static MarketItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MarketItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MarketItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MarketItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MarketItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MarketItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMarketItemsRecordData({
  String? itemId,
  DateTime? dateCreated,
  DocumentReference? createdByRef,
  String? title,
  String? description,
  String? photo,
  int? availableQty,
  int? price,
  bool? isAvailable,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ItemId': itemId,
      'DateCreated': dateCreated,
      'createdBy_ref': createdByRef,
      'Title': title,
      'Description': description,
      'Photo': photo,
      'AvailableQty': availableQty,
      'Price': price,
      'isAvailable': isAvailable,
    }.withoutNulls,
  );

  return firestoreData;
}

class MarketItemsRecordDocumentEquality implements Equality<MarketItemsRecord> {
  const MarketItemsRecordDocumentEquality();

  @override
  bool equals(MarketItemsRecord? e1, MarketItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.itemId == e2?.itemId &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.createdByRef == e2?.createdByRef &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.photo == e2?.photo &&
        e1?.availableQty == e2?.availableQty &&
        e1?.price == e2?.price &&
        e1?.isAvailable == e2?.isAvailable &&
        listEquality.equals(e1?.commentsRef, e2?.commentsRef) &&
        listEquality.equals(e1?.purchasedByUser, e2?.purchasedByUser);
  }

  @override
  int hash(MarketItemsRecord? e) => const ListEquality().hash([
        e?.itemId,
        e?.dateCreated,
        e?.createdByRef,
        e?.title,
        e?.description,
        e?.photo,
        e?.availableQty,
        e?.price,
        e?.isAvailable,
        e?.commentsRef,
        e?.purchasedByUser
      ]);

  @override
  bool isValidKey(Object? o) => o is MarketItemsRecord;
}
