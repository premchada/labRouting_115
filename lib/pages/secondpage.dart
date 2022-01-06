import 'package:cs_routing/pages/thirdpage.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _noStd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is second page'),
            form(),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('กลับไปหน้าแรก'),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var route = MaterialPageRoute(
                      builder: (context) => ThirdPage(
                        stdId: _noStd.text,
                        stdName: _name.text,
                      ),
                    );
                    Navigator.push(context, route);
                  }
                },
                child: const Text('ยืนยัน พร้อมส่งค่าข้อมูล'),
              ),
            ]
              
            ),
          ],
        ),
      ),
    );
  }

  Widget form() {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _noStd,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ใส่รหัสนิสิตของคุณ";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'รหัสนิสิต',
                      ),
                    ),
                    TextFormField(
                      controller: _name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ใส่ชื่อของคุณ";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'ชื่อนิสิต',
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
