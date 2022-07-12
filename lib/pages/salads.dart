import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/recipes.dart';

class Salads extends StatefulWidget {
  @override
  State<Salads> createState() => _SaladsState();
}

class _SaladsState extends State<Salads> {
  List saladList = [];
  List screenList = [];
  List classList = [];
  List subtitleList = [];

  @override
  void initState() {
    super.initState();

    saladList.addAll([
      'Salsa',
      'Perigorskiy salat',
      'Merkury',
      'Grecheskiy',
      'Salat with chiken'
    ]);
    screenList.addAll([
      'assets/img/salad.jpg',
      'assets/img/breakfast.jpg',
      'assets/img/second_meal.jpg',
      'assets/img/salad.jpg',
      'assets/img/salad.jpg'
    ]);
    classList.addAll([
      Salsa(),
      Perigorskiy(),
      Perigorskiy(),
      Perigorskiy(),
      Perigorskiy(),
    ]);
    subtitleList.addAll([
      '45 min',
      '60 min',
      '120 min',
      '45 min',
      '120 min'
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Salads'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: ListView.builder(
            itemCount: saladList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => classList[index]));
                },
                key: Key(saladList[index]),
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  height: 110,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            child: Container(
                                width: 130,
                                height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(screenList[index])),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0)))),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            child: Container(
                              width: 200,
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    saladList[index],
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Container(
                                      child: Row(children: [
                                    Icon(Icons.timer),
                                    Text(subtitleList[index])
                                  ]))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                              child: Container(
                            child: Icon(Icons.favorite_border),
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                          ))
                        ],
                      )
                      // Align(
                      //   child: Container(
                      //     width: 130,
                      //     height: 100,
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //         fit: BoxFit.cover,
                      //         image: AssetImage(screenList[index])
                      //       ),
                      //       borderRadius: BorderRadius.all(Radius.circular(15.0))
                      //     )
                      //   ),
                      //   alignment: Alignment.centerLeft,
                      // ),
                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Container(
                      //     color: Colors.black26,
                      //     padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           saladList[index],
                      //           style: TextStyle(fontSize: 22),
                      //         ),
                      //         Container(
                      //             child: Row(children: [
                      //           Icon(Icons.timer),
                      //           Text(subtitleList[index])
                      //         ]))
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Align(
                      //   child: Icon(Icons.favorite_border),
                      //   alignment: Alignment.topRight,
                      // )
                    ],
                  ),
                ),
                // child: SizedBox(
                //     child: Card(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10.0)
                //       ),
                //       elevation: 5,
                //       child: ListTile(
                //         subtitle: Text('Время проготовления 45 мин'),
                //         title: Text(saladList[index]),
                //         leading: Container(
                //             width: 80,
                //             height: 100,
                //             padding: EdgeInsets.zero,
                //             margin: EdgeInsets.zero,
                //             child: Image.asset(
                //               screenList[index],
                //               fit: BoxFit.fill,
                //             )),
                //         trailing: Icon(Icons.favorite_border),
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => classList[index]));
                //         },
                //       ),
                //     )
                // )
              );
            }));
  }
}
