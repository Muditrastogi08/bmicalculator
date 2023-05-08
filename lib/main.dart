import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
          ),
          centerTitle: true,
          backgroundColor: Colors.red),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'BMI',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: wtController,
                decoration: const InputDecoration(
                  label: Text('Enter your weight (in kg)'),
                  prefixIcon: Icon(Icons.line_weight_rounded),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: ftController,
                decoration: const InputDecoration(
                  label: Text('Enter your height (in ft)'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: inController,
                decoration: const InputDecoration(
                  label: Text('Enter your height (in inch)'),
                  prefixIcon: Icon(Icons.height_rounded),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (wtController.text.isNotEmpty &&
                      ftController.text.isNotEmpty &&
                      inController.text.isNotEmpty) {
                    //// rum tyhis function
                    int intWeight = int.parse(wtController.text);
                    int intFeet = int.parse(ftController.text);
                    int intInches = int.parse(inController.text);

                    int totalInches = (intFeet * 12) + intInches;

                    var totalCm = totalInches * 2.54;

                    var totalMeter = totalCm / 100;

                    var bmi = intWeight / (totalMeter * totalMeter);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Total BMI is : ${bmi.toStringAsFixed(2)}'),
                      backgroundColor: Colors.green,
                    ));

                    showDialog(
                      context: context,
                      builder: (g) {
                        return Dialog(
                          child: Text('your BMI is: ${bmi.toStringAsFixed(2)}'),
                        );
                      },
                    );
                  } else {
                    if (wtController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please enter weight"),
                        backgroundColor: Colors.red,
                      ));
                    } else if (ftController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please enter height in ft"),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please enter height in inches"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Calculate'),
              ),
              /* Text(
                result,
                style: const TextStyle(fontSize: 20),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
