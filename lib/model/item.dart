// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  final String name;

  Item({required this.name});

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
