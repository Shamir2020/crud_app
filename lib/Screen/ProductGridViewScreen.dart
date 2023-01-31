import 'package:crud/Screen/ProductCreateScreen.dart';
import 'package:crud/Screen/ProductUpdateScreen.dart';
import 'package:crud/Style/Style.dart';
import 'package:crud/Utility/Utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../RestApi/RestClient.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({Key? key}) : super(key: key);

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {

  List ProductList = [];
  bool loading = true;

  CallData() async {
    setState(() {
      loading = true;
    });
    var data = await ProductGridViwListRequest();
    setState(() {
      ProductList = data;
      loading = false;
    });

  }

  DeleteItem(id) async{
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Are you sure that you want to delete?"),
            actions: [
              OutlinedButton(onPressed: () async{
                Navigator.pop(context);
                setState(() {
                  loading = true;
                });
                ProductDeleteRequest(id);
                await CallData();
              }, child: Text("Yes")),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("No"))
            ],
          );
        }
    );

  }

  // This method is called everytime the first component is loaded
  @override
  void initState(){
      super.initState();
      CallData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List"),),
      body: Stack(
        children: [
          Container(
            child: loading?(Center(child: CircularProgressIndicator(),)):(
              RefreshIndicator(
                onRefresh: () async{
                  await CallData();
                },
                child: GridView.builder(
                    gridDelegate: ProductGridViewStyle(),
                    itemCount: ProductList.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: Image.network(ProductList[index]['Img'],fit: BoxFit.fill,)),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ProductList[index]['ProductName']),
                                  SizedBox(height: 7,),
                                  Text("Price: ${ProductList[index]['UnitPrice']} Tk"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      OutlinedButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>ProductUpdate(ProductList[index])));

                                      }, child: Icon(Icons.edit,color: Colors.greenAccent,)),
                                      OutlinedButton(onPressed: () async{
                                        await DeleteItem(ProductList[index]['_id']);
                                      }, child: Icon(Icons.delete,color: Colors.red,))
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    }
                ),
              )
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>CreateProduct()));
        }, child: Icon(Icons.add),
      ),
    );
  }
}
