import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<int> check=[];
  List<String> choice=[
    "Cricket",
    "Hocky",
    "Football",
    "Volleyball ",
    "Shooting",
    "Boxing",
    "Basketball ",
  ];
  List<String> selected=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Checkbox with multiple selections',style: TextStyle(fontSize: 15),),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 18,top: 20),
              child: Text("Select hobby",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
            ),
            const SizedBox(height: 10,),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child:ListView.builder(
                itemCount: choice.length,
                itemBuilder: (context, index){
                return CheckboxListTile(
                  title: Text(choice[index]),
                  selected: check.contains(index) ? true : false,
                  value: check.contains(index) ? true : false, 
                  onChanged: (value){
                    if(value==true)
                    {
                      setState(() {
                        check.add(index);
                        selected.add(choice[index]);
                      });
                    }
                    else
                    {
                      setState(() {
                        check.remove(index);
                        selected.remove(choice[index]);
                      });
                    }
                  },
                );
              },
              ),
            ),
            Center(
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1(hobby: selected,),));
                  }, 
                  child: const Text("Save")
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatefulWidget {
  Screen1({super.key,required this.hobby});

  List hobby;

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Hobby',style: TextStyle(fontSize: 15),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.hobby.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${index+1}",style: const TextStyle(color: Colors.black),),
                    backgroundColor: Colors.green.withOpacity(0.2),
                  ),
                  title: Text(widget.hobby[index]),
                );
              }, 
            ) 
          )
        ],
      ),
    );
  }
}
