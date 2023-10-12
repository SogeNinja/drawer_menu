import 'package:drawer_menu/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("RESULTADO"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: SingleChildScrollView(
            child: Consumer<ProfileCollection>(
              builder: (context, value, child) {
                var profile = value.selectedProfile!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50,),

                    const Text("Nombre y apellido"),
                    const SizedBox(height: 5,),
                    Text(profile.fullName.toUpperCase(), 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 35,),

                    const Text("RUT"),
                    const SizedBox(height: 5,),
                    Text(profile.rut, 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 35,),

                    const Text("Correo Electrónico"),
                    const SizedBox(height: 5,),
                    Text(profile.email, 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 35,),

                    const Text("Dirección"),
                    const SizedBox(height: 5,),
                    Text(profile.address, 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 35,),

                    const Text("Teléfono"),
                    const SizedBox(height: 5,),
                    Text(profile.phone, 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 50,),

                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          context.go("/");
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          width: 150,
                          child: const Text("ACEPTAR", style: TextStyle(fontSize: 18,),),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
