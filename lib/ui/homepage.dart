import 'package:blocwithapi/bloc/food_bloc.dart';
import 'package:blocwithapi/data/model/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FoodBloc foodBloc;

  @override
  void initState() {
    foodBloc = BlocProvider.of<FoodBloc>(context);
    foodBloc.add(FetchFoodEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza..'),
      ),
      body: Container(
        child: BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
          if (state is FoodInitialState) {
            return _buildLoading();
          } else if (state is FoodLoadingState) {
            return _buildLoading();
          } else if (state is FoodLoadedState) {
            return _foodList(state.recipes);
          } else if (state is FoodErrorState) {
            return _buildError();
          } else {
            throw Exception();
          }
        }),
      ),
    );
  }
}

//Widgets...
Widget _buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget _foodList(List<Recipe> recipes) {
  return Container(
    child: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            child: Container(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 90,
                  width: 100,
                  child: Image.network(
                    recipes[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 9),
                        child: Text(
                          recipes[index].title,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      child: Text(
                        recipes[index].publisher,
                        style: TextStyle(color: Colors.brown, fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      child: Text(
                        recipes[index].sourceUrl,
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    )
                  ],
                ))
              ],
            )),
          );
        }),
  );
}

Widget _buildError() {
  return Center(child: Text('No Data Available'));
}
