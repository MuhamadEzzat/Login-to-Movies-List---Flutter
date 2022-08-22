import 'package:flutter/material.dart';
import 'package:loginexample/ui/movies/movies_controller.dart';
import 'package:loginexample/data/dto/movie_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loginexample/ui/shared_widgets/spinner_widget.dart';

class MoviesScreen extends GetView<MoviesController>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),

      body: Stack(
        children: [
          FutureBuilder<List<MovieData>>(
              future: myMovies(),
              builder: (context, snapshot){
                var count = snapshot.data?.length ?? 0;
                if (count >= 1){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index){

                        var title = snapshot.data![index].title;
                        var overview = snapshot.data![index].overview;

                        return Card(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                                  child: ListTile(
                                    enabled: false,
                                    onTap: () {
                                      //updateTime(index);
                                      print('locations[index].location');
                                    },
                                    title: Text(
                                      title ?? '',
                                      style: TextStyle(
                                          color: Colors.blueGrey
                                      ),),
                                    subtitle: Text(
                                      overview ?? '',
                                      maxLines: 2,
                                    ),

                                  ),
                                ),
                              ),

                              IconButton(
                                onPressed: () => {},
                                color: Colors.red,
                                icon:   Icon(Icons.favorite_border_outlined),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }else{
                  return Stack(
                      children: [

                        Positioned(
                            top: MediaQuery.of(context).size.height/2,
                            left: (MediaQuery.of(context).size.width/4),
                            right: (MediaQuery.of(context).size.width/4),
                            child: Center(
                                child: Text(
                                  'No Internet',
                                  style: TextStyle(
                                      fontSize: 20,
                                      wordSpacing: 2,
                                      color: Colors.red
                                  ),
                                )
                            )
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height/2 + 30,
                            left: (MediaQuery.of(context).size.width/4),
                            right: (MediaQuery.of(context).size.width/4),
                            child: IconButton(
                              onPressed: (() {


                              }),
                              icon: Icon(Icons.refresh_rounded),
                              color: Colors.blue,
                            )
                        ),
                       Spinner_Widget()
                      ]
                  );
                }
              }),
        ],
      ),
    );
  }

  Future<List<MovieData>> myMovies() async{
    await controller.getMovies();
    var movies = await controller.moviesData;
    print(movies.first);
    return movies;
  }


}
