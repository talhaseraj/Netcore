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
                        
                      ],),
                    ],
                  )),
            ),
          );
          // return widget here based on BlocA's state
        });
  }
}
