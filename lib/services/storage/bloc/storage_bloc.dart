import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/services/storage/note_model.dart';
import 'package:flutter_application_1/services/storage/storage_service.dart';

part 'storage_event.dart';
part 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  final _storage = StorageService();
  List<NoteModel> _notes = [];

  StorageBloc()
      : super(StorageState(notes: [], status: StorageStatus.initial)) {
    on<StorageEventInit>(_init);
    on<StorageEventCreateOrUpdate>(_createOrUpdate);
    on<StorageEventRead>(_read);
    on<StorageEventReadAll>(_readAll);
    on<StorageEventDelete>(_delete);
    on<StorageEventDeleteAll>(_deleteAll);
    on<StorageEventFilter>(_filter);
  }
  Future<void> _init(
    StorageEventInit event,
    Emitter<StorageState> emit,
  ) async {
    try {
      await _storage.open();
      _notes = await _storage.readAllNotes();
      emit(StorageState(
        notes: _notes,
        status: _notes.isEmpty ? StorageStatus.noNote : StorageStatus.hasNote,
      ));
    } catch (e) {
      //
    }
  }

  Future<void> _createOrUpdate(
    StorageEventCreateOrUpdate event,
    Emitter<StorageState> emit,
  ) async {
    try {
      if (event.note.id == 0) {
        await _storage.createNote(event.note);
      } else {
        await _storage.updateNote(event.note);
      }
      _notes = await _storage.readAllNotes();
      emit(StorageState(notes: _notes, status: StorageStatus.hasNote));
    } catch (_) {
      //
    }
  }

  Future<void> _read(
    StorageEventRead event,
    Emitter<StorageState> emit,
  ) async {
    final note = await _storage.readNote(event.id);

    emit(StorageState(
      notes: _notes,
      status: StorageStatus.hasNote,
      selectedNote: note,
    ));
  }

  Future<void> _readAll(
    StorageEventReadAll event,
    Emitter<StorageState> emit,
  ) async {
    _notes = await _storage.readAllNotes();
    emit(StorageState(
      notes: _notes,
      status: _notes.isEmpty ? StorageStatus.noNote : StorageStatus.hasNote,
    ));
  }

  Future<void> _delete(
    StorageEventDelete event,
    Emitter<StorageState> emit,
  ) async {
    _storage.deleteNote(event.id);
    _notes = await _storage.readAllNotes();
    emit(StorageState(
      notes: _notes,
      status: _notes.isEmpty ? StorageStatus.noNote : StorageStatus.hasNote,
    ));
  }

  Future<void> _deleteAll(
    StorageEventDeleteAll event,
    Emitter<StorageState> emit,
  ) async {
    _storage.deleteAllNotes();
    _notes = [];
    emit(StorageState(notes: [], status: StorageStatus.noNote));
  }

  Future<void> _filter(
    StorageEventFilter event,
    Emitter<StorageState> emit,
  ) async {
    List<NoteModel> filtered = _notes
        .where((note) =>
            (note.colorCode == event.colorCode) || (event.colorCode == null))
        .toList();

    switch (event.colorCode ?? -1) {
      case <= 12 && > 0:
        emit(StorageState(notes: filtered, status: StorageStatus.hasNote));
      default:
        emit(StorageState(notes: _notes, status: StorageStatus.hasNote));
    }
  }
}
