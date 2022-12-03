import 'package:amazon_clone_tech387/constants/global_variables.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15, bottom: 5),
          child: const Text(
            'Deal of the day !',
            style:
                TextStyle(fontSize: 19, color: Color.fromARGB(255, 22, 6, 1)),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1628200523809-1390b4f36c1e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGRlYWwlMjBvZiUyMHRoZSUyMGRheXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$12',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding:
              const EdgeInsets.only(left: 15, top: 5, right: 40, bottom: 5),
          child: const Text(
            'Frozen Jarritos with IceCream.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1560526860-1f0e56046c85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZnJvemVuJTIwZHJpbmtzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1553607558-455f4310f6ec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZnJvemVuJTIwZHJpbmtzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1516684163977-84cc7de8c7c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZnJvemVuJTIwZHJpbmtzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1541591425126-4e6dcf84b386?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZyb3plbiUyMGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1595981266686-0cf387d0a608?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGZyb3plbiUyMGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1600456594262-3c4dcbdb07ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGZyb3plbiUyMGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1620360289100-030b032e5a27?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGZyb3plbiUyMGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),
        ),
      ],
    );
  }
}
