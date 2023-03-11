import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

const kTextField = TextStyle(
  fontSize: 20,
  color: Colors.blueGrey,
);
const kSubmitText = TextStyle(fontSize: 20, color: Colors.white);

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailFormField(),
            passwordFormField(),
            SizedBox(
              height: 20,
            ),
            submitbutton(),
            SizedBox(
              height: 10,
            ),
            registerbutton(),
          ],
        ),
      ),
    );
  }

  Widget emailFormField() {
    return TextFormField(
      style: kTextField,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "อีเมล",
        hintText: "กรอกอีเมล",
        icon: Icon(Icons.email),
      ),
      validator: (value) {
        if (!EmailValidator.validate(value!)) {
          return 'อีเมลไม่ถูกต้อง';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        email = value!;
      },
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "รหัสผ่าน",
        hintText: "กรอกรหัสผ่าน",
        icon: Icon(Icons.lock),
      ),
      validator: (value) {
        if (value!.length < 8) {
          return "กรอกรหัสอย่างน้อย 8 ตัวอักษร";
        }
        return null;
      },
      onSaved: (value) {
        password = value!;
      },
    );
  }

  ElevatedButton submitbutton() {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('เข้าสู่ระบบ', style: kSubmitText),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          print('อีเมล: $email รหัสผ่าน: $password');
          formKey.currentState!.reset();
        }
      },
    );
  }

  ElevatedButton registerbutton() {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('สมัครสมาชิก', style: kSubmitText),
      ),
      onPressed: () {},
    );
  }
  // bool validateEmail(value) {
  //   Pattern pattern =
  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+"))@((\[[0-9{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   RegExp regex = new RegExp(pattern);
  //   return (!regex.hasMatch(value)) ? false : true;
  // }
}
