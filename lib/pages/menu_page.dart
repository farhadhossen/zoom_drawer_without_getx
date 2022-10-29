import 'package:flutter/material.dart';
import 'package:zoom_drawer_without_getx/pages/model/menu_item.dart';



class MenuItems {
  static const payment = MyMenuItem("Payment", Icons.payment);
  static const promos = MyMenuItem("promos", Icons.payment);
  static const notifications = MyMenuItem("notifications", Icons.payment);
  static const help = MyMenuItem("help", Icons.payment);
  static const aboutUs = MyMenuItem("aboutUs", Icons.payment);
  static const rateUs = MyMenuItem("rateUs", Icons.payment);

  static const all = <MyMenuItem>[
    payment,
    promos,
    notifications,
    help,
    aboutUs,
    rateUs
  ];

}

class MenuPage extends StatelessWidget{

  final MyMenuItem currentItem;
  final ValueChanged<MyMenuItem> onSelectedItem;

  const MenuPage({Key? key, required this.currentItem, required this.onSelectedItem}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              ...MenuItems.all.map(buildMenuItem).toList(),
              Spacer(flex: 2,),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MyMenuItem item) {

    return ListTileTheme(
      selectedTileColor: Colors.white,
      child: ListTile(
        selectedTileColor: Colors.black26,
        selected: currentItem == item,
        minLeadingWidth: 20,
        leading: Icon(item.icon),
        title: Text(item.title),
        onTap: (){
          onSelectedItem(item);
        },
      ),
    );
  }

}