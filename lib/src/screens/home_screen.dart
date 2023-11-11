import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pogos_app/src/repository/data/model/animal_model.dart';
import 'package:pogos_app/src/repository/data/service/animal_page_service.dart';

class PogosAppHomeScreen extends StatefulWidget {
  const PogosAppHomeScreen({super.key});

  @override
  State<PogosAppHomeScreen> createState() => _PogosAppHomeScreenState();
}

class _PogosAppHomeScreenState extends State<PogosAppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final animalPageService = AnimalPageService(dio);
    return FutureBuilder(
        future: animalPageService.getCard(query: 'q'),
        builder: (context, snapshot){
          if(snapshot.error != null || snapshot.stackTrace != null){
            return Material(
              child: Center(
                child: Text('${snapshot.error}'),
              ),
            );
          }
          if(snapshot.data != null || snapshot.connectionState == ConnectionState.done){
            return Material(
              child: Expanded(
                child: SafeArea(
                  child: ListView.separated(
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, '/animal_card_screen',
                              arguments: snapshot.data![index]),
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 20),
                                Text(snapshot.data![index].name),
                                Text(snapshot.data![index].age.toString()),
                                Text(snapshot.data![index].species),

                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index){
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemCount: snapshot.data!.length),
                ),
              ),
            );
          }
          return Material(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ),
            ),
          );
        }
    );
  }
}
//Text(snapshot.data![index].species);
