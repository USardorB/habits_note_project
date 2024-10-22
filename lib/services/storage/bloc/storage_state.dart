part of 'storage_bloc.dart';

final class StorageState extends Equatable {
  const StorageState({
    required this.notes,
    required this.status,
    this.selectedNote,
  });
  final List<NoteModel> notes;
  final NoteModel? selectedNote;
  final StorageStatus status;

  @override
  List<Object> get props => [notes, status];
}

enum StorageStatus { initial, hasNote, noNote, filtered }
