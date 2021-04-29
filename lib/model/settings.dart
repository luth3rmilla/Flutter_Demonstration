class Settings {
  final bool allowNotications;
  final bool darkMode;

  const Settings({
    this.allowNotications = true,
    this.darkMode = false,
  });

  Settings copy({
    bool allowNotications,
    bool darkMode,
  }) =>
      Settings(
          allowNotications: allowNotications ?? this.allowNotications,
          darkMode: darkMode ?? this.darkMode);

  //Store the Settings object
  Map<String, dynamic> toJson() =>
      {'allowNotications': allowNotications, 'darkMode': darkMode};
}
