const String dbName = 'notes.db';
const String tableName = 'note';
const String idColumn = 'id';
const String isNoteColumn = 'is_todo';
const String titleColumn = 'title';
const String descriptionColumn = 'description';
const String colorColumn = 'color';
const String isSyncedColumn = 'is_synced';
const String dateColumn = 'date';

const String noteTableString = '''
CREATE TABLE IF NOT EXISTS $tableName (
$idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
$isNoteColumn INTEGER NOT NULL,
$isSyncedColumn INTEGER NOT NULL,
$titleColumn TEXT NOT NULL,
$descriptionColumn TEXT NOT NULL,
$colorColumn INTEGER NOT NULL,
$dateColumn TEXT NOT NULL
);''';
