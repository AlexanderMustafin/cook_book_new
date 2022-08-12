import 'package:flutter/material.dart';

class RecipesInfoCard extends StatelessWidget {
  const RecipesInfoCard({
     required this.displayName,
     required this.image,
     required this.cookingTime,
     required this.preparationsList,
     required this.ingridientsParameters});

  final String displayName;
  final String image;
  final String cookingTime;
  final List<dynamic> preparationsList;
  final List ingridientsParameters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        top: true,
        right: false,
        bottom: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const RecipeAppBar(),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image), 
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Container( // body of App
                // width: (MediaQuery.of(context).size.width),
                  margin: const EdgeInsets.only(top: 250.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                child: Column(
                  children: <Widget> [
                    Row( // Name + cooking time
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  '$displayName', //Display name
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 20,
                                      color: Color(0xFF858585)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.timelapse_rounded,
                              color: Color(0xFF858585),
                            ),
                            Text(
                              '$cookingTime', //TODO totalTime
                                style: const TextStyle(color: Color(0xFF858585), fontSize: 12)
                            ),
                          ],
                        )
                      ],
                    ),
                    IngredientsAndPrepToggle(preparation: preparationsList, ingridientsParameters: ingridientsParameters,),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const RecipeAppBar({Key? key}) : super(key: key);

  @override
  State<RecipeAppBar> createState() => _RecipeAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _RecipeAppBar extends State<RecipeAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      // backgroundColor: const Color(0x00ffffff),
      backgroundColor: const Color(0x3F000000),
      leading: const BackButton(
          color: Colors.white
      ),
      actions: const <Widget>[
        IconButton(
          padding: EdgeInsets.all(16.0),
          icon: Icon(
            Icons.favorite_border, // TODO: Изменение состояния кнопки в зависимости от нажатия
            color: Colors.white,
          ),
          onPressed: null,
        ),
        IconButton(
          padding: EdgeInsets.all(16.0),
          icon: Icon(
            Icons.shopping_cart, // TODO: Кастомный виджет, отображение счётчика добавленных продуктов
            color: Colors.white,
          ),
          onPressed: null,
        ),
      ],
    );
  }
}

class IngredientsAndPrepToggle extends StatefulWidget {
  const IngredientsAndPrepToggle({required this.preparation, required this.ingridientsParameters});
  final List preparation;
  final List ingridientsParameters;

  @override
  State<IngredientsAndPrepToggle> createState() => _IngredientsAndPrepToggleState(this.preparation, this.ingridientsParameters);
}

class _IngredientsAndPrepToggleState extends State<IngredientsAndPrepToggle> {
  final List preparation;
  final List ingridientsParameters;
  _IngredientsAndPrepToggleState(this.preparation, this.ingridientsParameters);

  bool isSwitched = false;

  var borderSwitchI = const BoxDecoration(
  border: Border(
  bottom: BorderSide(width: 3, color: Colors.orangeAccent)
  )
  );
  var borderSwitchP = const BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 0.5, color: Color(0xFF858585), style: BorderStyle.solid),
      )
  );

  void toggleSwitch() {
    if(isSwitched == false) {
      setState(() {
        isSwitched = true;
        borderSwitchP = const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 3, color: Colors.orangeAccent)
            )
        );
        borderSwitchI = const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.5, color: Color(0xFF858585), style: BorderStyle.solid),
            )
        );
      });
    } else {
      setState(() {
        isSwitched = false;
        borderSwitchI = const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 3, color: Colors.orangeAccent)
            )
        );
        borderSwitchP = const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.5, color: Color(0xFF858585), style: BorderStyle.solid),
            )
        );
      });
    }
  }

  List<Widget> _createChildrenI() {
    return List<Widget>.generate(ingridientsParameters.length, (int index) {
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(child: Text('${ingridientsParameters[index].ingredient}', overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF858585)),)),
                  SizedBox(width: 5,),
                  Text('${ingridientsParameters[index].quantity} ${ingridientsParameters[index].unit}', style: const TextStyle(fontSize: 12, color: Color(0xFF858585))),
                ],
              ),
            ),
          ),
          Icon(Icons.radio_button_unchecked, color: Color(0xFF858585)),
        ],
      );
    });
  }

  List<Widget> _createChildrenP() {
    return List<Widget>.generate(preparation.length, (int index) {
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.black12)
                )
              ),
              child: Column(
                children: [
                  Text('STEP ${index + 1}', style: const TextStyle(color: Color(0xFF858585))),
                  Text(preparation[index], style: const TextStyle(color: Color(0xFF858585))), //Preparations!!!
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 0.5,
                color: Color(0xFF858585),
                style: BorderStyle.solid
              ),
            )
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: toggleSwitch,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: borderSwitchI,
                    child: const Text(
                      "Ingredients",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF858585)),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: toggleSwitch,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: borderSwitchP,
                    child: const Text(
                      "Preparation",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF858585)),
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
        if (!isSwitched)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
            child: Column(
              children: _createChildrenI(),
            ),
          )
        else
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
            child: Column(
              children: _createChildrenP(),
            )
          )
      ],
    );
  }
}

class Ingredients {
  const Ingredients({
     required this.ing,
     required this.amount,
});
  final String ing;
  final String amount;
}

class Preparation {
  const Preparation({
     required this.step,
  });
  final String step;
}
