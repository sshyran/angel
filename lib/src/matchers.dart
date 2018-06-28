import 'package:matcher/matcher.dart';

final RegExp _alphaDash = new RegExp(r'^[A-Za-z0-9_-]+$');
final RegExp _alphaNum = new RegExp(r'^[A-Za-z0-9]+$');
final RegExp _email = new RegExp(
    r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
final RegExp _url = new RegExp(
    r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)');

/// Asserts that a `String` is alphanumeric, but also lets it contain dashes or underscores.
final Matcher isAlphaDash = predicate(
    (value) => value is String && _alphaDash.hasMatch(value),
    'alphanumeric (dashes and underscores are allowed)');

/// Asserts that a `String` is alphanumeric, but also lets it contain dashes or underscores.
final Matcher isAlphaNum = predicate(
    (value) => value is String && _alphaNum.hasMatch(value), 'alphanumeric');

/// Asserts that a value either equals `true` or `false`.
final Matcher isBool = predicate((value) => value is bool, 'a bool');

///  Asserts that a `String` complies to the RFC 5322 e-mail standard.
final Matcher isEmail = predicate(
    (value) => value is String && _email.hasMatch(value), 'a valid e-mail');

/// Asserts that a value is an `int`.
final Matcher isInt = predicate((value) => value is int, 'an integer');

/// Asserts that a value is a `num`.
final Matcher isNum = predicate((value) => value is num, 'a number');

/// Asserts that a value is a `String`.
final Matcher isString = predicate((value) => value is String, 'a String');

/// Asserts that a value is a non-empty `String`.
final Matcher isNonEmptyString = predicate(
    (value) => value is String && value.trim().isNotEmpty,
    'a non-empty String');

///  Asserts that a `String` is an `http://` or `https://` URL.
///
/// The regular expression used:
/// ```
/// https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)
/// ```
final Matcher isUrl = predicate(
    (value) => value is String && _url.hasMatch(value),
    'a valid url, starting with http:// or https://');

/// Use [isUrl] instead.
@deprecated
final Matcher isurl = isUrl;

/// Enforces a minimum length on a string.
Matcher minLength(int length) => predicate(
    (value) => value is String && value.length >= length,
    'a string at least $length character(s) long');

/// Limits the maximum length of a string.
Matcher maxLength(int length) => predicate(
    (value) => value is String && value.length >= length,
    'a string no longer than $length character(s) long');
