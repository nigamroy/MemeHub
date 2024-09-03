import 'package:flutter/material.dart';
import 'package:meme_app/controller/fetchMeme.dart';


class Mainscreen extends StatefulWidget {
  Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int? memeNo;

  @override
  void UpdateImg() async {
    String getImgUrl = await FetchMeme().fetchNewMeme();
    setState(() {
      imgUrl = getImgUrl;
    });
  }

  String imgUrl = "https://i.redd.it/v323ublx5fld1.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Meme Hub",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "MEME #${memeNo.toString()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                "Target 500 Memes",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.network(imgUrl),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                    height: 50,
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () async {
                        // FetchMeme().fetchNewMeme();
                        UpdateImg();
                      },
                      child: Center(
                          child: Text("More Fun!!",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ))),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber),
                      ),
                    )),
              ),
              SizedBox(
                height: 70,
              ),
              Text("Copyright 2024 Nigam Roy")
            ],
          ),
        ),
      ),
    );
  }
}
