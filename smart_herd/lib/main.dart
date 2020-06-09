import "package:flutter/material.dart";

void main()
{
  runApp(MaterialApp(
    title: "Long List View",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.pinkAccent
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text("Long List View"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          debugPrint("FAB Clicked");
        },
        child: Icon(Icons.add_circle_outline),
        tooltip: "Add a item",
      ),
      body: getlistview(),
    )
  )
  );
}

List<String> getlistelements()
{
  var items = List<String>.generate(1000, (counter) => "Item $counter" );
  return items;
}

Widget getlistview()
{
  var listitem = getlistelements();
  var listview = ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(listitem[index]),
          onTap: () {
            showSnackbar(context, listitem[index]);
          },
        );
      }
            );
   return listview;
}
void showSnackbar(BuildContext context, String item)
{
  var snackBar = SnackBar(content: Text("You Just Tapped the $item"),
    action: SnackBarAction(
      label: "Undo",
      onPressed: (){
        debugPrint("Performing dummy Action");
        }
    )
  );
  Scaffold.of(context).showSnackBar(snackBar);
}