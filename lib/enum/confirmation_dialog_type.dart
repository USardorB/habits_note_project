enum ConfirmationDialogType {
  logout(
    title: 'Log out',
    prompt: 'Are you sure you want to log out?',
    actionText: 'Log out',
  ),
  exit(
    title: 'Exit app',
    prompt: 'Are you sure you want to exit the app?',
    actionText: 'Exit',
  );

  final String title;
  final String prompt;
  final String actionText;

  const ConfirmationDialogType({
    required this.title,
    required this.prompt,
    required this.actionText,
  });
}
