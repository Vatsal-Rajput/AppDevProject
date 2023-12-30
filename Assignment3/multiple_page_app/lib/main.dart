import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Multiple Page App'),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var Namec = TextEditingController();
  var EMailc = TextEditingController();
  var RollNoc = TextEditingController();
  var PhoneNoc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('FirstPage'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Name",
              style: const TextStyle(fontSize: 25),
            ),
            TextField(
              controller: Namec,
              style: const TextStyle(fontSize: 20.0),
              decoration: const InputDecoration(
                labelText: 'Enter Name',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Email",
              style: TextStyle(fontSize: 25),
            ),
            TextField(
                controller: EMailc,
                style: const TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  labelText: 'Enter Email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  border: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "RollNo",
              style: TextStyle(fontSize: 25),
            ),
            TextField(
              controller: RollNoc,
              style: const TextStyle(fontSize: 20.0),
              decoration: const InputDecoration(
                labelText: 'Enter RollNo',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "PhoneNo",
              style: TextStyle(fontSize: 25),
            ),
            TextField(
              controller: PhoneNoc,
              style: const TextStyle(fontSize: 20.0),
              decoration: const InputDecoration(
                labelText: 'Enter PhoneNo',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second', arguments: {
                  'NameFpage': Namec.text,
                  'EMailFpage': EMailc.text,
                  'RollNoFpage': RollNoc.text,
                  'PhoneNoFpage': PhoneNoc.text
                });
              },
              child: const Text('Show Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var Name = arguments?['NameFpage'];
    var RollNo = arguments?['RollNoFpage'];
    var EMail = arguments?['EMailFpage'];
    var PhoneNo = arguments?['PhoneNoFpage'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
          child: Column(
        children: [
          const Text(
            'Your Information:',
            style: TextStyle(
                fontSize: 30,
                backgroundColor: Color.fromARGB(255, 219, 197, 237),
                color: Color.fromARGB(255, 135, 71, 245)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Name - $Name', style: const TextStyle(fontSize: 20)),
          Text('EMail - $EMail', style: const TextStyle(fontSize: 20)),
          Text('RollNo - $RollNo', style: const TextStyle(fontSize: 20)),
          Text('PhoneNo - $PhoneNo', style: const TextStyle(fontSize: 20)),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      child: AlertDialog(
                        title: Text('You have successfully logged out!'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'))
                        ],
                      ),
                    );
                  });
            },
            child: Text('Log Out'),
          ),
        ],
      )),
    );
  }
}
