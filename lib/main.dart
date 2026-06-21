import 'package:flutter/material.dart';

void main() {
  runApp(const MojeApp());
}

class MojeApp extends StatefulWidget {
  const MojeApp({super.key});

  @override
  State<MojeApp> createState() => MojeAppState();
}

class MojeAppState extends State<MojeApp> {
  // Nastavení aplikace
  bool tma = false;
  bool upozorneni = true;
  bool zobrazitPanel = true;

  // Motiv aplikace
  Color motivBarva = const Color(0xFFFFF3E0);

  // Barva horního panelu
  Color panelBarva = const Color(0xFFC9960A);

  // Flopvatar
  String flopvatar = 'assets/flopvatar-fl.png';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: tma ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: motivBarva,
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,

        appBarTheme: AppBarTheme(
          backgroundColor: panelBarva,
          foregroundColor: Colors.white,
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,

        appBarTheme: AppBarTheme(
          backgroundColor: panelBarva,
          foregroundColor: Colors.white,
        ),
      ),

      home: const Uvod(),
    );
  }
}

class Uvod extends StatelessWidget {
  const Uvod({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.findAncestorStateOfType<MojeAppState>();

    return Scaffold(
      appBar: (app?.zobrazitPanel ?? true)
          ? AppBar(
        title: const Text('Můj Flopík'),
      )
          : null,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hlavní obrázek
              Image.asset(
                'assets/flop.png',
                height: 220,
              ),

              const SizedBox(height: 30),

              const Text(
                'Můj Flopík',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Oficiální aplikace Flopíků',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.login),
                  label: const Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      'Přihlásit se',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Login(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Verze 1.0',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final app = context.findAncestorStateOfType<MojeAppState>();

    return Scaffold(
      appBar: (app?.zobrazitPanel ?? true)
          ? AppBar(title: const Text('Přihlášení'))
          : null,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/flop.png',
              height: 120,
            ),

            const SizedBox(height: 25),

            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Přezdívka',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String jmeno = controller.text.trim();

                  if (jmeno.isEmpty) {
                    jmeno = 'Flopík';
                  }

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Menu(jmeno: jmeno),
                    ),
                  );
                },
                child: const Text('Pokračovat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  final String jmeno;

  const Menu({
    super.key,
    required this.jmeno,
  });

  @override
  Widget build(BuildContext context) {
    final app = context.findAncestorStateOfType<MojeAppState>();

    return Scaffold(
      appBar: (app?.zobrazitPanel ?? true)
          ? AppBar(
        title: const Text('Můj Flopík'),
      )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                  AssetImage(app?.flopvatar ?? 'assets/flopvatar-fl.png'),
                ),
                title: Text(jmeno),
                subtitle: const Text('Aktivní Flopík'),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.badge),
                label: const Text('Flopenka'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Flopenka(jmeno: jmeno),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.settings),
                label: const Text('Nastavení'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Nastaveni(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.games),
                label: const Text('Minihry'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MiniHry(),
                    ),
                  );
                },
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Uvod(),
                  ),
                      (_) => false,
                );
              },
              child: const Text(
                'Odhlásit se',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Flopenka extends StatelessWidget {
  final String jmeno;

  const Flopenka({
    super.key,
    required this.jmeno,
  });

  @override
  Widget build(BuildContext context) {
    final app = context.findAncestorStateOfType<MojeAppState>();

    return Scaffold(
      appBar: (app?.zobrazitPanel ?? true)
          ? AppBar(
        title: const Text('Flopenka'),
      )
          : null,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          width: 380,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFC9960A),
                Color(0xFFE8B631),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black26,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'FLOPENKA',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    app?.flopvatar ?? 'assets/flopvatar-fl.png',
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  jmeno,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Status: Aktivní',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Úroveň: 1',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  '#000001',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 20),

                const Icon(
                  Icons.verified,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class Nastaveni extends StatefulWidget {
  const Nastaveni({super.key});

  @override
  State<Nastaveni> createState() => _NastaveniState();
}

class _NastaveniState extends State<Nastaveni> {
  @override
  Widget build(BuildContext context) {
    final app = context.findAncestorStateOfType<MojeAppState>();

    return Scaffold(
      appBar: (app?.zobrazitPanel ?? true)
          ? AppBar(
        title: const Text('Nastavení'),
      )
          : null,
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Můj účet'),
            subtitle: const Text('Profil a Flopvatar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MujUcet(),
                ),
              );
            },
          ),

          const Divider(),

          SwitchListTile(
            title: const Text('Tmavý režim'),
            value: app?.tma ?? false,
            onChanged: (v) {
              app?.setState(() {
                app.tma = v;
              });
              setState(() {});
            },
          ),

          SwitchListTile(
            title: const Text('Oznámení'),
            value: app?.upozorneni ?? true,
            onChanged: (v) {
              app?.setState(() {
                app.upozorneni = v;
              });
              setState(() {});
            },
          ),

          SwitchListTile(
            title: const Text('Zobrazit horní panel'),
            value: app?.zobrazitPanel ?? true,
            onChanged: (v) {
              app?.setState(() {
                app.zobrazitPanel = v;
              });
              setState(() {});
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Motiv aplikace'),
            subtitle: const Text('Vybrat barevný motiv'),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Vyber motiv'),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            app?.setState(() {
                              app.motivBarva =
                              const Color(0xFFFFF3E0);
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('Hodně světle oranžová'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            app?.setState(() {
                              app.motivBarva =
                                  Colors.orange.shade100;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('Oranžová'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            app?.setState(() {
                              app.motivBarva = Colors.white;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('Bílá'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            app?.setState(() {
                              app.motivBarva =
                                  Colors.brown.shade100;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('Tmavě oranžová'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            app?.setState(() {
                              app.motivBarva =
                                  Colors.lightBlue.shade100;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('Modro-oranžová'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Barva horního panelu'),
            subtitle: const Text('#C9960A'),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Barva panelu'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          app?.setState(() {
                            app.panelBarva =
                            const Color(0xFFC9960A);
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Zlatá'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          app?.setState(() {
                            app.panelBarva = Colors.blue;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Modrá'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          app?.setState(() {
                            app.panelBarva = Colors.green;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Zelená'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Zpětná vazba a podpora'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ZpetnaVazba(),
                ),
              );
            },
          ),

          const AboutListTile(
            icon: Icon(Icons.info),
            applicationName: 'Můj Flopík',
            applicationVersion: '1.0',
            applicationLegalese:
            'Powered by Google, Flutter, Visual Studio Code, Android Studio, GitHub a Firebase',
          ),
        ],
      ),
    );
  }
}

class MujUcet extends StatelessWidget {
  const MujUcet({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.findAncestorStateOfType<MojeAppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Můj účet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                app?.flopvatar ?? 'assets/flopvatar-fl.png',
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Flopvatar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                app?.setState(() {
                  app.flopvatar =
                  'assets/flopvatar-fl.png';
                });
              },
              child: const Text('Flop'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                app?.setState(() {
                  app.flopvatar =
                  'assets/flopvatar-k.png';
                });
              },
              child: const Text('FlopKšilt'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                app?.setState(() {
                  app.flopvatar =
                  'assets/flopvatar-kb.png';
                });
              },
              child: const Text('FlopKombo'),
            ),
          ],
        ),
      ),
    );
  }
}
class MiniHry extends StatelessWidget {
  const MiniHry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minihry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.casino),
                label: const Text('Kolo štěstí Flopíka'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const KoloStesti(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.catching_pokemon),
                label: const Text('Chyť Flopíka'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ChytFlopika(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KoloStesti extends StatefulWidget {
  const KoloStesti({super.key});

  @override
  State<KoloStesti> createState() => _KoloStestiState();
}

class _KoloStestiState extends State<KoloStesti> {
  String vysledek = 'Roztoč kolo';

  final moznosti = [
    '10 bodů',
    '20 bodů',
    '50 bodů',
    '100 bodů',
    'VIP Flopík',
    'Nic'
  ];

  void tocit() {
    moznosti.shuffle();

    setState(() {
      vysledek = moznosti.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kolo štěstí'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              vysledek,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: tocit,
              child: const Text('Roztočit'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChytFlopika extends StatefulWidget {
  const ChytFlopika({super.key});

  @override
  State<ChytFlopika> createState() => _ChytFlopikaState();
}

class _ChytFlopikaState extends State<ChytFlopika> {
  int body = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chyť Flopíka'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Body: $body',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                setState(() {
                  body++;
                });
              },
              child: Image.asset(
                'assets/flop.png',
                height: 180,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Klepni na Flopíka',
            ),
          ],
        ),
      ),
    );
  }
}

class ZpetnaVazba extends StatefulWidget {
  const ZpetnaVazba({super.key});

  @override
  State<ZpetnaVazba> createState() => _ZpetnaVazbaState();
}

class _ZpetnaVazbaState extends State<ZpetnaVazba> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zpětná vazba'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Napiš svůj návrh, chybu nebo nápad.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: controller,
              maxLines: 6,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Sem napiš zprávu...',
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('Odeslat'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Děkujeme'),
                      content: const Text(
                        'Tvoje zpráva byla zaznamenána.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}