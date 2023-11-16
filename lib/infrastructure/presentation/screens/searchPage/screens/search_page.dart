import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundspace_mobileapp/domain/artist.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/commons/widgets/background.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/providers/search_artist_provider.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/artist/artist_page.dart';
import 'package:soundspace_mobileapp/infrastructure/repositories/api_repository.dart';

class SearchPage extends StatelessWidget {
  final ApiRepository repository;

  const SearchPage({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    final ApiRepository repository = ApiRepository();
    return Scaffold(
        body: MultiProvider(
            providers: [
          ChangeNotifierProvider(
              create: (_) => SearchArtistProvider(repository: repository)),
        ],
            child: Search(
              repository: repository,
            )));
  }
}

class Search extends StatefulWidget {
  final ApiRepository repository;
  const Search({super.key, required this.repository});

  @override
  State<Search> createState() => _SearchSate();
}

class _SearchSate extends State<Search> {
  final TextEditingController _controller = TextEditingController();

  List<Artist> displayList = [];

  String inputValue = '';

  void updateList(String value, dynamic search) async {
    if (value.isEmpty) {
      print("si");
    }

    if (value.isEmpty) {
      displayList = [];
    } else {
      await search.loadSearch(value);

      setState(() {
        displayList = search.searchArtists;
      });
    }

    setState(() {
      inputValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchArtistProvider = context.watch<SearchArtistProvider>();
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(
              child: SizedBox(
            height: 0,
          )),
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
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(0),
                    iconSize: 25,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: const Text(
                    'Buscar artista o tema',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.white),
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
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                      controller: _controller,
                      onChanged: (value) =>
                          updateList(value, searchArtistProvider),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "¿Qué deseas escuchar?",
                        hintStyle: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.5,
                          color: Color(0xFFC2C1C5),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                _controller.clear();
                                updateList(
                                    _controller.text, searchArtistProvider);
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
                                padding:
                                    const EdgeInsets.only(top: 4.0, left: 24.0),
                                child: const Text(
                                  "Lo sentimos, no se encontraron resultados.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 1.5,
                                    color: Color(0xFF0AACBE),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: displayList.length > 4
                                    ? 4
                                    : displayList.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ArtistPage(
                                                      artist:
                                                          displayList[index],
                                                    )));
                                      },
                                      child: ListTile(
                                          contentPadding: const EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 25.0),
                                          title: Text(
                                            displayList[index].name,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              letterSpacing: 1.5,
                                              color: Colors.white,
                                            ),
                                          )),
                                    )),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
