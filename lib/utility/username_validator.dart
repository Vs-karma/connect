import 'package:flutter/services.dart';

/// Allowed in a username/display name: letters (any language, incl. Hindi),
/// numbers, space, and the limited punctuation real names use: . _ - '
/// Everything else (@ # $ % ! / etc. and emoji) is rejected.
final RegExp _allowedChars = RegExp(r"^[\p{L}\p{N} ._'\-]+$", unicode: true);

/// Must start with a letter or number (not punctuation/space).
final RegExp _startsValid = RegExp(r"^[\p{L}\p{N}]", unicode: true);

const int kUsernameMin = 2;
const int kUsernameMax = 30;

/// Returns null if valid, otherwise a reason code the UI maps to a message:
/// 'empty' | 'short' | 'long' | 'chars' | 'start'
String? usernameError(String raw) {
  final s = raw.trim();
  if (s.isEmpty) return 'empty';
  if (s.length < kUsernameMin) return 'short';
  if (s.length > kUsernameMax) return 'long';
  if (!_startsValid.hasMatch(s)) return 'start';
  if (!_allowedChars.hasMatch(s)) return 'chars';
  return null;
}

bool isValidUsername(String raw) => usernameError(raw) == null;

/// Blocks disallowed characters as the user types. Use as an input formatter.
/// `FilteringTextInputFormatter.allow` keeps only the permitted character set
/// and handles the cursor/selection bookkeeping for us.
final TextInputFormatter usernameInputFormatter =
    FilteringTextInputFormatter.allow(RegExp(r"[\p{L}\p{N} ._'\-]", unicode: true));
