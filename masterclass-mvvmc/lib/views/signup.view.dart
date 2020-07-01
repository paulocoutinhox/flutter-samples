import 'package:flutter/material.dart';
import 'package:masterclass/controllers/signup.controller.dart';
import 'package:masterclass/store/app.store.dart';
import 'package:masterclass/view-models/signup.viewmodel.dart';
import 'package:masterclass/views/home.view.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = new SignupController();
  var model = new SignupViewModel();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text('Informe seus dados:'),
                TextFormField(
                  keyboardType: TextInputType.text,
                  initialValue: model.name,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nome inválido';
                    }

                    return null;
                  },
                  onSaved: (newValue) {
                    model.name = newValue;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  initialValue: model.email,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'E-mail inválido';
                    }

                    return null;
                  },
                  onSaved: (newValue) {
                    model.email = newValue;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  initialValue: model.password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Senha inválida';
                    }

                    return null;
                  },
                  onSaved: (newValue) {
                    model.password = newValue;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: model.busy
                      ? Center(
                          child: Container(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.amber,
                            ),
                          ),
                        )
                      : FlatButton(
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              setState(() {
                                model.busy = true;
                              });

                              _controller.create(model).then((user) {
                                store.setUser(
                                  user.name,
                                  user.email,
                                  user.picture,
                                  user.token,
                                );

                                setState(() {
                                  model.busy = false;
                                });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return HomeView();
                                  }),
                                );
                              });
                            }
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
