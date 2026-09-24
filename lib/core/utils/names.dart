/// "john doe" → "John Doe" (the API's display_name is often lower case).
String titleCase(String s) => s
    .trim()
    .split(RegExp(r'\s+'))
    .where((w) => w.isNotEmpty)
    .map((w) => w[0].toUpperCase() + w.substring(1).toLowerCase())
    .join(' ');

/// "John Doe" → "JD"; one word → first letter; empty → "?".
String initials(String name) {
  final words = name.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
  if (words.isEmpty) return '?';
  return (words.first[0] + (words.length > 1 ? words.last[0] : '')).toUpperCase();
}

/// "Good morning" / "Good afternoon" / "Good evening" for [now].
String greeting(DateTime now) => switch (now.hour) {
  < 12 => 'Good morning',
  < 17 => 'Good afternoon',
  _ => 'Good evening',
};
