
abstract class Podcast {

  Uri get url;
  set url(Uri value);

  String get title;
  set title(String value);

  String get author;
  set author(String value);

  String get description;
  set description(String value);

  int get subscribers;
  set subscribers(int value);

  Uri get mygpo_link;
  set mygpo_link(Uri value);

  Uri get website;
  set website(Uri value);
}