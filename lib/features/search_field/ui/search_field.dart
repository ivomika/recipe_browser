import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String text)? onSubmitted;

  const SearchField({
    super.key,
    this.onSubmitted
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Поиск...',
      leading: Icon(Icons.search),
      onSubmitted: onSubmitted,
    );
  }
}
