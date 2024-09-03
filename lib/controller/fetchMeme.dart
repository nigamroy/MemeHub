
import 'dart:convert';

import 'package:http/http.dart';
class FetchMeme{

   fetchNewMeme() async{
  
    Response response = await get(Uri.parse("https://meme-api.com/gimme/wholesomememes"));
    print(response.body);

    Map bodyData = jsonDecode(response.body);
   return (bodyData["url"]);
  }
}