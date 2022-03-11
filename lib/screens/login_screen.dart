import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(mask: '+7 (###) ###-##-##');
  final String _trueLogin = "9999999999";
  final String _truePass = "9999";

  
  void checkLogin() {
    if (maskFormatter.getUnmaskedText() == _trueLogin &&
        passwordController.text == _truePass) {
      Navigator.pushNamed(context, '/users');
    } else {
      simpleDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          body: Center(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Введите номер телефона и пароль для входа',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: phoneController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      // icon: Icon(Icons.mail),
                      prefixIcon: const Icon(Icons.phone),
                      suffixIcon: phoneController.text.isEmpty
                          ? const Text('')
                          : GestureDetector(
                              onTap: () {
                                phoneController.clear();
                              },
                              child: const Icon(Icons.close)),
                      hintText: '+7 (___) ___-__-__',
                      labelText: 'Телефон',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1))),
                  inputFormatters: [maskFormatter],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  obscureText: isVisible,
                  controller: passwordController,
                  onChanged: (value) {
                   
                  },
                  
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            isVisible = !isVisible;
                            setState(() {});
                          },
                          child: Icon(isVisible
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      hintText: 'Введите ваш пароль',
                      labelText: 'Пароль',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      checkLogin();
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 18),
                    child: Text('Войти'),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}







Future simpleDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Авторизация'),
        content: const Text('Неверно указан телефон или пароль.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
