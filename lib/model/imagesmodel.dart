 import 'dart:typed_data';

class LoadImages{
    int _id;
    String _gametitle;
   Uint8List _img;
   String _gameplatform;
  
   LoadImages(this._gametitle,this._img,this._gameplatform);
   int get id =>_id;
   String get gametitle=>_gametitle;
   Uint8List get imggg=>_img;
   String get gameplatform=>_gameplatform;


    set gametitle(String newgametitle)
    {
      this._gametitle=newgametitle;
    }
  

    set img(Uint8List newimg)
    {
      this._img=newimg;
    }
    set gameplatform(String newgameplatform)
    {
      this._gameplatform=newgameplatform;
    }
   Map<String,dynamic>toMap(){
     var map=Map<String,dynamic>();
     if(id!=null)
     {
       map['id']=_id;
     }
     map['gametitle']=_gametitle;
     map['imggg']=_img;
     map['gameplatform']=_gameplatform;
     return map;
   }
   LoadImages.fromMapObject(Map<String,dynamic>map)
   {
     this._id=map['id'];
     this._gametitle=map['gametitle'];
    this._img=map['imggg'];
    this._gameplatform=map['gameplatform'];
   }

}