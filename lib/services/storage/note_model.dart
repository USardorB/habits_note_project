import 'package:flutter_application_1/services/storage/storage_constants.dart';

class NoteModel {
  final int id;
  final bool isNote;
  final bool isSyncedWithCloud;
  final String title;
  final String description;
  final int colorCode;
  final String creationDate;

  NoteModel({
    required this.id,
    required this.isNote,
    required this.title,
    required this.isSyncedWithCloud,
    required this.description,
    required this.colorCode,
    required this.creationDate,
  });

  NoteModel.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        isNote = map[isNoteColumn] == 1 ? true : false,
        title = map[titleColumn] as String,
        description = map[descriptionColumn] as String,
        colorCode = map[colorColumn] as int,
        creationDate = map[dateColumn] as String,
        isSyncedWithCloud = map[isSyncedColumn] == 1 ? true : false;

  Map<String, Object?> toRow() => {
        isNoteColumn: isNote ? 1 : 0,
        titleColumn: title,
        descriptionColumn: description,
        colorColumn: colorCode,
        dateColumn: creationDate,
        isSyncedColumn: isSyncedWithCloud ? 1 : 0,
      };

  NoteModel copyWith({
    String? title,
    String? description,
    int? colorCode,
    bool? isSyncedWithCloud,
  }) =>
      NoteModel(
        id: id,
        isNote: isNote,
        title: title ?? this.title,
        description: description ?? this.description,
        colorCode: colorCode ?? this.colorCode,
        creationDate: creationDate,
        isSyncedWithCloud: isSyncedWithCloud ?? this.isSyncedWithCloud,
      );

  @override
  bool operator ==(covariant other) => hashCode == other.hashCode;

  @override
  int get hashCode => id.hashCode;
}
