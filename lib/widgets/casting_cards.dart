import 'package:flutter/material.dart';

class CastingCard extends StatelessWidget {
  const CastingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return _CastCard();
        },
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.indigo,
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      height: 20,
      width: 80,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              child: FadeInImage(
                placeholder: AssetImage('assets/loading2.gif'),
                image: AssetImage('assets/loading2.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "Adipisicing ad sint ",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
