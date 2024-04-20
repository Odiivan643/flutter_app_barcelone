import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 10, 128, 225)),
        useMaterial3: true,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.blue,
        title: const Text(
          "Basics",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "images/camp_nou.jpg",
                  height: 200,
                  width: width,
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 140),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 58,
                      foregroundImage: AssetImage("images/barcelone_logo.jpg"),
                    ),
                  ),
                )
              ],
            ),
            const Row(
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "odi est un bon dev ! ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Un jour les chats domineront le monde , mais pas aujourd'hui . \n Odi fait le site avec flutter ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextIcon(),
                ),
                TextIcon(icon: Icons.more_time),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            titre(text: "A Propos de Moi"),
            IconText(icon: Icons.house, text: " I live in Treichville !"),
            IconText(icon: Icons.work, text: "Dev IOS and ANDROID"),
            IconText(icon: Icons.favorite, text: "En couple !"),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            titre(text: "AMIS"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageSmall("images/voiture.jpg", "Le gba d'Odi", width / 3.5),
                ImageSmall("images/camp_nou.jpg", "Le Stade de barcelone ",
                    width / 3.5),
                ImageSmall("images/barcelone_logo.jpg", "Le logo de barcelone",
                    width / 3.5),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            grandeImage(
                text: "il y'a 10 minutes ...",
                image: "images/plage.jpg",
                desc: "coucou les codeurs !"),
          ],
        ),
      ),
    );
  }

  Widget profilPicture(String image) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            foregroundImage: AssetImage(image),
          ),
        ],
      ),
    );
  }

  Text TimeText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  Widget grandeImage(
      {required String text,
      required String image,
      required String desc,
      int like = 0,
      int commentaire = 0}) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(225, 225, 255, 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              profilPicture(image),
              Padding(padding: EdgeInsets.all(5)),
              Text("odi junior"),
              Spacer(),
              TimeText(text),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 8),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            desc,
            style:const TextStyle(
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.favorite),
                Text("$like Likes"),
                Icon(Icons.comment),
                Text("$commentaire commentaires"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget ImageSmall(String image, String desc, double width) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: width,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Text(desc),
      ],
    );
  }

  Widget IconText({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(top: 7, bottom: 5, left: 5),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget titre({required String text}) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 8, left: 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container TextIcon({String? text, IconData? icon}) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: (icon == null)
            ? Center(
                child: Text(text ?? "Modifier profil",
                    style: const TextStyle(fontSize: 20, color: Colors.white)))
            : Icon(
                icon,
                color: Colors.white,
              ));
  }
}
