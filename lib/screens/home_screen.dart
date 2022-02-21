// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_search_list/bloc/dog_bloc.dart';
import 'package:flutter_search_list/models/dog_model.dart';
import 'package:flutter_search_list/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "Search for dogs",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SearchBar(
              labelText: 'Search for dogs based on name or breed',
              onSubmitted: (String query) {
                BlocProvider.of<DogBloc>(context)
                    .add(SearchEvent(query: query));
              },
            ),
            BlocBuilder<DogBloc, DogState>(
              builder: (context, state) {
                if (state is DogLoadingState) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3),
                    child: CircularProgressIndicator(
                      color: Colors.purple.shade400,
                    ),
                  );
                }
                if (state is DogLoadedState) {
                  List<DogModel> dogModel = state.dogList;
                  return dogModel.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.3),
                          child: Text(
                            "No result found",
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: dogModel.length,
                                itemBuilder: (context, index) {
                                  var model = dogModel[index];
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor),
                                              boxShadow: [
                                                BoxShadow(
                                                    spreadRadius: 2,
                                                    blurRadius: 10,
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    offset: Offset(0, 10))
                                              ],
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(model
                                                    .image!.url
                                                    .toString()),
                                              ),
                                            ),
                                          ),
                                          //!
                                          SizedBox(width: 5),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  model.name == null
                                                      ? ""
                                                      : model.name.toString(),
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    minHeight: 20,
                                                    minWidth: 200,
                                                  ),
                                                  child: Text(
                                                    model.bredFor == null
                                                        ? ""
                                                        : model.bredFor
                                                            .toString(),
                                                    style: TextStyle(
                                                        overflow:
                                                            TextOverflow.fade,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(thickness: 1, color: Colors.purple,),
                                    ],
                                  );
                                }),
                          ),
                        );
                }
                return Center(
                    child: Text(
                  "Error loading Dogs",
                  style: TextStyle(color: Colors.red),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
