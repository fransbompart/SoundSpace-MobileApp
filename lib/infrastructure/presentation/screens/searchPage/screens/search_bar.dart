import 'package:flutter/material.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/home/home_page.dart';
import 'package:soundspace_mobileapp/infrastructure/repositories/api_repository.dart';

import '../classes/artist_theme_model.dart';

class SearchFrame extends StatefulWidget {
  const SearchFrame({super.key});

  @override
  State<SearchFrame> createState() => _SearchFrameState();
}

class _SearchFrameState extends State<SearchFrame> {

  TextEditingController _controller = TextEditingController();

  static List<ArtistThemeModel> mainThemeList = [
    ArtistThemeModel("Aquiles Báez"),
    ArtistThemeModel("Aquiles Hernández"),
  ];

  List<ArtistThemeModel> displayList = List.from(mainThemeList);

  String inputValue = '';
  final ApiRepository repository = ApiRepository();


  void updateList(String value) {
    setState(() {
      inputValue = value;
      if (value.isEmpty) {
        displayList = [];
      } else {
        displayList = mainThemeList
            .where((element) =>
                element.artistName!.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    Color(0xFF3C127E),
                    Color(0xFF3C127E),
                    Color(0xFF2A154E),
                    Color(0xFF261740),
                    Color(0xFF261740),
                    Color(0xFF2C1553),
                    Color(0xFF3E1283),
                    Color(0xFF3E1283),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        // Navegar a la página de búsqueda cuando se hace clic en el ícono de búsqueda
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  HomePage(repository: repository)),
                        );
                      },
                    ),
                    
                    title: const Text(
                      'Buscar artista o tema',
                      style: TextStyle(
                        fontFamily: 'Visby',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF372F47),
                          Color(0xFF462F64),
                          Color(0xFF462F64),
                        ],
                      ),
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (value) => updateList(value),
                        style: const TextStyle(
                            fontFamily: 'Visby',
                            fontSize: 18,
                            fontWeight: FontWeight.w300,color: Colors.white,
                        ),
                        controller: _controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "¿Qué deseas escuchar?",
                          hintStyle: const TextStyle(
                            fontFamily: 'visbycf-thin',
                            fontSize: 19,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 1.5,
                            color: Color(0xFFC2C1C5),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.clear();
                                updateList(_controller.text);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  inputValue.isEmpty
                    ? Container()
                    : Expanded(
                      child: displayList.isEmpty
                        ? Container(
                            padding: const EdgeInsets.only(top: 4.0, left: 24.0),
                            child: const Text(
                              "Lo sentimos, no se encontraron resultados.",
                              style: TextStyle(
                                fontFamily: 'visbycf-thin',
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                                letterSpacing: 1.5,
                                color: Color(0xFF0AACBE),
                              ),
                            ),
                          )
                          : ListView.builder(
                              itemCount: displayList.length,
                              itemBuilder: (context, index) => ListTile(
                                contentPadding: const EdgeInsets.only( top: 1.0, bottom: 1.0, left: 25.0),
                                title: Text(displayList[index].artistName!,
                                  style: const TextStyle(
                                    fontFamily: 'visbycf-thin',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100,
                                    letterSpacing: 1.5,
                                    color: Colors.white,
                                  ),
                                )
                              ),
                            ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}