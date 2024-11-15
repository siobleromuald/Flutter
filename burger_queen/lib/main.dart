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
      title: 'Burger Queen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Burger Queen'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  final TextStyle titleStyle=const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.brown
  );
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(title),
        leading: const Icon(Icons.token),
        actions: const [Icon(Icons.person)],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              height: 150,
              child: Center(
                child: Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const Text(
                                "Mon restaurant le plus proche",
                                style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              "4 kms",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin:  const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.pink
                          ),
                          child: const  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.touch_app, color: Colors.white,),
                              SizedBox(width: 16,),
                              Text("Commander", style: TextStyle(color: Colors.white) ),
                            ],
                            
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            sectionTitle(title: "En ce moment"),
            //Section en ce moment
            Center(
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  width: MediaQuery.of(context).size.width*0.8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/layer-burger.jpg"),
                        fit: BoxFit.cover
                    ),
                  ),
                  child:  Column(
                    children: [
                        Text(
                          "Une petite faim?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      Text(
                        "Venez personnaliser votre burger",
                        style: TextStyle(
                          backgroundColor: Theme.of(context).colorScheme.inversePrimary
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            sectionTitle(title: "Chaud devant !!"),
            const Text("Le meilleur de nos burgers à porter de clic"),
            SizedBox(
                height: 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    burgerCard(name: "Twins", url: "twins", description: "Le burger des jumaux qui font la paire"),
                    burgerCard(name: "Big Queen", url: "big-queen", description: "Celle qui porte la couronne à la maison"),
                    burgerCard(name: "Egg Bacon", url: "egg-bacon-burger", description: "Burger des lèves tôt"),

                    burgerCard(name: "Prince", url: "prince", description: "Le préféré des futurs rois"),
                    burgerCard(name: "Cheese", url: "cheese", description: "Le classique pour les fans de fromage")

                  ],
                ),
              ),
            )

          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget sectionTitle({required String title}){
    return  Padding(
      padding: const EdgeInsets.only(
          left:8,
          top: 8
      ),
      child: Text(title, style: titleStyle,),
    );
  }
  Container burgerCard({required String name, required String url, required String description}){
    double size=250;
    TextStyle descriptionStyle=const TextStyle(
      fontStyle: FontStyle.italic,
      color: Colors.black54
    );
   return Container(
      margin: const EdgeInsets.all(12),
     clipBehavior: Clip.antiAlias,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(24),
       color: Colors.pinkAccent.withOpacity(0.3)
     ),
     height: size,
     width: size,
     child: Column(
       children: [
         Image.asset(
           "assets/images/$url.jpg",
           height: size*0.6,
           width: size,
           fit: BoxFit.cover,
         ),
         Text(name,style: titleStyle,),
         Text(description,style: descriptionStyle,textAlign: TextAlign.center,)
       ],
     ),
   );
  }
}
