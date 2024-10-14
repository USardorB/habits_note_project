enum OptionDialogType {
  imagePicker(
    title: 'Import Photo',
    option1: 'Take photo',
    option2: 'Choose from gallery',
  ),

  editorSelection(
    title: 'New',
    option1: 'Add note',
    option2: 'Add to-do',
  );

  final String title;
  final String option1;
  final String option2;

  const OptionDialogType({
    required this.title,
    required this.option1,
    required this.option2,
  });
}
