import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/saladsCategories.dart';

class Recipes extends StatelessWidget {
  const Recipes({ this.i});

  final int i;

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
                image: AssetImage(salads[i].imagePath),
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
                                  salads[i].name,
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
                              '${salads[i].cookTime} min',
                                style: const TextStyle(color: Color(0xFF858585), fontSize: 12)
                            ),
                          ],
                        )
                      ],
                    ),
                    const IngredientsAndPrepToggle(),

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
  const RecipeAppBar({Key key}) : super(key: key);

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
  const IngredientsAndPrepToggle({Key key}) : super(key: key);

  @override
  State<IngredientsAndPrepToggle> createState() => _IngredientsAndPrepToggleState();
}

class _IngredientsAndPrepToggleState extends State<IngredientsAndPrepToggle> {
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
    return List<Widget>.generate(testIngredients.length, (int index) {
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Text(testIngredients[index].ing, style: const TextStyle(color: Color(0xFF858585)),),
                  Text(testIngredients[index].amount, style: const TextStyle(fontSize: 10, color: Color(0xFF858585))),
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
    return List<Widget>.generate(testPreparation.length, (int index) {
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
                  Text(testPreparation[index].step, style: const TextStyle(color: Color(0xFF858585))),
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
    this.ing,
    this.amount,
});
  final String ing;
  final String amount;
}

class Preparation {
  const Preparation({
    this.step,
  });
  final String step;
}

List <Ingredients> testIngredients = [
  Ingredients(ing: 'Ing 1', amount: '20 pieces'),
  Ingredients(ing: 'Ing 2', amount: '1 kg'),
  Ingredients(ing: 'Ing 1', amount: '20 pieces'),
  Ingredients(ing: 'Ing 2', amount: '1 kg'),
  Ingredients(ing: 'Ing 1', amount: '20 pieces'),
  Ingredients(ing: 'Ing 2', amount: '1 kg'),
  Ingredients(ing: 'Ing 1', amount: '20 pieces'),
];

List <Preparation> testPreparation = [
  Preparation(step: 'Since Null is no longer a subtype, no type except the special Null class permits the value null.'),
  Preparation(step: 'Ssdkjaskjdla;jdasld asdl;kasdlkasj sadklasjdasl'),
  Preparation(step: 'dasjdlasjdasld ja;djasdj as;dksdjh  jkfhsdkjfv hsdk kjsdfksdjhkjfh fdgdfgdfgdfg dfgfdgdfg jhjghjgh fgdgdf'),
  Preparation(step: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
  Preparation(step: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
  Preparation(step: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32."),
];