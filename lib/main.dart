import 'package:flutter/material.dart';
import 'package:spoonacular/services/name.dart';
import 'package:spoonacular/services/recipe_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameController = TextEditingController();
  Name? nameResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Entrez un nom :',
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: nameController,
              ),
            ),
            TextButton(
                onPressed: () async {
                  final result = await RecipeService().getNameAge(nameController.value.text);
                  if (result != null) {
                    setState(() {
                      nameResult = result;
                    });
                  }
                },
                child: Text('Go')),
            if (nameResult != null)
              Text("L'âge estimé de ${nameResult!.name} est de : ${nameResult!.age.toString()} ans")
          ],
        ),
      ),
    );
  }
}
