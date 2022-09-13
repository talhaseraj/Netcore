import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:convert' ;
import 'dart:convert' show utf8;

import '../bloc/language_bloc.dart';
import '../models/api_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LanguageBloc languageBloc = LanguageBloc();

  bool connected = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          connected = false;
        });
      } else {
        setState(() {
          connected = true;
        });
      }
      // Got a new connectivity status!
    });
    languageBloc.add(GetLanguageList());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return BlocBuilder<LanguageBloc, LanguageState>(
        bloc: LanguageBloc(), // provide the local bloc instance
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                color: Colors.white,
                width: size.width,
                height: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Powered by ",
                          style: TextStyle(
                            color: Color(0xff647EFF),
                          ),
                        ),
                        const Text(
                          "Netcore Soft ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff647EFF),
                          ),
                        ),
                        const Icon(
                          Icons.warning_amber_outlined,
                          color: Colors.red,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.table_rows,
                          color: Color(0xff9BCFB2),
                          size: 15,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.refresh,
                          color: Colors.black,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.wifi,
                          color: connected ? Colors.green : Colors.black,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .08,
                                vertical: size.height * .02),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: size.height * .1,
                            width: size.width * .4,
                            child: const Image(
                                image: NetworkImage(
                                    "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png")),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("google search engine"),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 4,
                      color: Color(0xff5071FF),
                    ),
                    SizedBox(
                      height: size.width * .1,
                    ),
                    Text(
                      "Got feedback?",
                      style: TextStyle(
                          fontSize: size.width * .1,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Take 1 minuet survey",
                      style: TextStyle(
                        fontSize: size.width * .09,
                      ),
                    ),
                    Text(
                      "Click to start",
                      style: TextStyle(
                        fontSize: size.width * .09,
                      ),
                    ),
                    buildLanguageList(size),

                  ],
                ),
              ),
            ),
          );
          // return widget here based on BlocA's state
        });
  }

  Widget buildLanguageList(Size size) {
    return BlocProvider(
      create: (_) => languageBloc,
      child: BlocListener<LanguageBloc, LanguageState>(
        listener: (context, state) {
          if (state is LanguageError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageInitial) {
              return _buildLoading();
            } else if (state is LanguageLoading) {
              return _buildLoading();
            } else if (state is LanguageLoaded) {
              List<Language>? languages = state.apiResponseModel.languages;
              for(Language l in languages!)
                {
                  print(utf8.encode(l.data));
                  var temp =utf8.encode(l.data);
                  print(utf8.decode(temp));
                }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < languages.length; i++)
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff647EFF),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: size.height * .06,
                          width: size.width * .3,
                          child: Text(
                            languages[i].data.toString()
                              , style: const TextStyle(color: Color(
                              0xff647EFF),fontWeight: FontWeight.bold
                              ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top:size.height*.03),
                          child: SizedBox(   height: size.height * .03,

            child:  Image(
            image: NetworkImage(
            languages[i].flag.toString())),
            ),
                        ),
                      ],
                    ),
                ],
              );
            } else if (state is LanguageError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
