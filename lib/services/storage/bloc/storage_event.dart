part of 'storage_bloc.dart';

sealed class StorageEvent {
  const StorageEvent();
}

class StorageEventReadAll extends StorageEvent {
  const StorageEventReadAll();
}

class StorageEventInit extends StorageEvent {
  const StorageEventInit();
}

class StorageEventFilter extends StorageEvent {
  final int? colorCode;
  const StorageEventFilter(this.colorCode);
}

class StorageEventCreateOrUpdate extends StorageEvent {
  final NoteModel note;
  const StorageEventCreateOrUpdate(this.note);
}

class StorageEventRead extends StorageEvent {
  final int id;
  const StorageEventRead(this.id);
}

class StorageEventDelete extends StorageEvent {
  final int id;
  const StorageEventDelete(this.id);
}

class StorageEventDeleteAll extends StorageEvent {
  const StorageEventDeleteAll();
}
