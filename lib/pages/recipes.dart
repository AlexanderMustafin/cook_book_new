import 'package:flutter/material.dart';

class Salsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Salsa'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: const [
                  Text(
                    'INGRIDEINTS:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Помидов - 4 шт \n'
                      'Лук красный - 1 шт \n'
                      'Перец зеленый чили - 1 шт \n'
                      'Чеснок - 1 шт \n'
                      'Лук зеленый - 3 шт \n'
                      'Кинза - 30 гр \n'
                      'Сок лайма \n'
                      'Масло оливковое - 10 гр \n'
                      'Соль \n'
                      'Перец черный молотый \n')
                ],
              )
            ],
          ),
        ));
  }
}

class Perigorskiy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perigorskiy'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: const [
                  Text(
                    'INGRIDEINTS:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Помидов - 4 шт \n'
                      'Лук красный - 1 шт \n'
                      'Перец зеленый чили - 1 шт \n'
                      'Чеснок - 1 шт \n'
                      'Лук зеленый - 3 шт \n'
                      'Кинза - 30 гр \n'
                      'Сок лайма \n'
                      'Масло оливковое - 10 гр \n'
                      'Соль \n'
                      'Перец черный молотый \n')
                ],
              )
            ],
          ),
        ));
  }
}
