import 'package:drawer_menu/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rut_utils/rut_utils.dart';



class FormPage extends StatefulWidget {
  const FormPage({ super.key });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController rutController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController(text: '+');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          onPressed: () => context.go("/"),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("FORMULARIO"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  //fullName
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    controller: fullNameController,
                    validator:(value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese nombre y apellido';
                      }
                      return null;
                    },
                    decoration: const  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gapPadding: 10
                      ),
                      labelText: "Nombre y Apellido"
                    ),
                  ),
                  const SizedBox(height: 35,),
                  //RUT
                  TextFormField(
                    controller: rutController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su RUT';
                      }
                      else if(!isRutValid(value)){
                        return 'Debe ingresar un RUT válido';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gapPadding: 10
                      ),
                      labelText: "RUT"
                    ),
                    inputFormatters: [RutFormatter()],
                  ),
                  const SizedBox(height: 35,),
                  //email
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su correo';
                      }
                      var pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      if(!RegExp(pattern).hasMatch(value)){
                        return 'Ingrese un correo válido';
                      }
                      return null;
                    },
                    decoration: const  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gapPadding: 10
                      ),
                      labelText: "Correo Electrónico"
                    ),
                  ),
                  const SizedBox(height: 35,),
                  //address
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    controller: addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su dirección';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gapPadding: 10
                      ),
                      labelText: "Dirección"
                    ),
                  ),
                  const SizedBox(height: 35,),
                  //phoneNumber
                  TextFormField(
                    controller: phoneController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su teléfono';
                      }
                      else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                        return "Por favor ingrese un numero válido";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gapPadding: 10
                      ),
                      labelText: "Teléfono"
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'\+\d*')), //allow only digits and +
                    ],
                  ),
                  const SizedBox(height: 40,),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Provider.of<ProfileCollection>(context, listen: false).setSelectedProfile(
                          ProfileModel(
                            fullName: fullNameController.text,
                            rut: rutController.text,
                            email: emailController.text,
                            address: addressController.text,
                            phone: phoneController.text
                          )
                        );
                        context.go('/preview');
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                      )
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      width: 150,
                      child: const Text("GUARDAR", style: TextStyle(fontSize: 18),),
                    )
                  ),
                  const SizedBox(height: 10,),
                ],
              )
            )
          )
        )
      ),
    );
  }
}

