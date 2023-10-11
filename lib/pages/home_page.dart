import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://thumbor.forbes.com/thumbor/fit-in/x/https://www.forbes.com/advisor/in/wp-content/uploads/2023/01/maxim-hopman-fiXLQXAhCfk-unsplash-1-scaled.jpg"
                  ),
                  fit: BoxFit.fill,
                  opacity: 0.4
                )
              ),
              child: Text('Cryptostory',
                style: TextStyle(fontSize: 24, color: Colors.white)
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio',),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Formulario'),
              onTap: () {
                context.go("/form");
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Perfil'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: const Text('Opción 2'),
              onTap: () {
                // on tap do...
              },
            ),
            ListTile(
              title: const Text('Opción 3'),
              onTap: () {
                // on tap do...
              },
            ),
          ],
        ) 
      ),
      appBar: AppBar(
        title: const Text("Inicio"),
        centerTitle: true,
        elevation: 1,
      ),
      body: const SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              "Bienvenido", 
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w700
              ),
            ),
          )
        )
      ),
    );
  }
}