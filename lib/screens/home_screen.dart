import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netcore/bloc/netcore_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<NetcoreBloc, NetcoreState>(
        bloc: NetcoreBloc(), // provide the local bloc instance
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    children: [
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Powered by ",
                            style: const TextStyle(
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
                          Icon(Icons.warning_amber_outlined,color: Colors.red,size: 15,),
                          SizedBox(width: 4,),

                          Icon(Icons.table_rows,color: Color(0xff9BCFB2),size: 15,),
                          SizedBox(width: 4,),

                          Icon(Icons.refresh,color: Colors.black,size: 15,),
                          SizedBox(width: 4,),
                          Icon(Icons.wifi,color: Colors.black,size: 15,),
                          SizedBox(width: 4,),

                        ],
                      ),
                      Divider(),
                      Row(children: [
                        Container(padding: EdgeInsets.symmetric(horizontal: size.width*.08,vertical: size.height*.02),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                            borderRadius: Border

                          ),
                          height: size.height*.1,
                          width: size.width*.4,
                          child: Image(image: NetworkImage("https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png")),),
                      ],),
                    ],
                  )),
            ),
          );
          // return widget here based on BlocA's state
        });
  }
}
