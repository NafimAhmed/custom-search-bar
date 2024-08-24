
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget{

  List<String> strList=['asjlsa','bdtfg','cijurwe','djlkewj','eoirog'];


  RxList<String> filterList=<String>[].obs;

  void filtering(String keyWord){

    filterList.clear();
    for(int i=0;i<strList.length;i++){
      if(strList[i].contains(keyWord)){
        filterList.add(strList[i]);

      }
    }

    filterList.refresh();
  }




  @override
  Widget build(BuildContext context) {

    // filterList.value=strList;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Column(
        children: [

          SearchAnchor(

            viewOnChanged: (value){

              filtering(value);
            },



            builder: (BuildContext context, SearchController controller) {
              return TextFormField(
                onTap: () {
                  controller.openView();
                },
                onChanged: (value) {


                  controller.openView();

                  filtering(value);


                },
                controller: controller,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Search for track, album or artist....',

                  prefixIcon: Icon(Icons.search),


                ),
              );
            },









            isFullScreen: false,
            suggestionsBuilder: (context, controller) {
              return [

                Obx(()=>ListView.builder(
                    shrinkWrap: true,
                    itemCount: filterList.length,
                    itemBuilder: (context,index){
                      return Text(filterList[index]);
                    })),




              ];
            },
          ),

        ],
      ),
    );
  }

}
