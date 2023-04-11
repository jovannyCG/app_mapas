import 'package:flutter/material.dart';

class SearchDestinationDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){query = '';}, icon: const Icon(Icons.clear))

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
  return  IconButton(onPressed: (){close(context, null);}, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
   return Text('results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('suggestions');
  }

}