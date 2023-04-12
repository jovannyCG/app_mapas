import 'package:app_mapas/search/search_delegate.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
                ]),
            child: const Text(
              'donde quiress ir?',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          onTap: () async{
            final result = await showSearch(context: context, delegate: SearchDestinationDelegate());
            if(result==null)return;
            print(result);
          },
        ),
      ),
    );
  }
}
