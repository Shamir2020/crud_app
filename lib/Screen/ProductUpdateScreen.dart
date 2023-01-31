import 'package:crud/RestApi/RestClient.dart';
import 'package:crud/Screen/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';
import '../Style/Style.dart';
import '../Utility/Utility.dart';

class ProductUpdate extends StatefulWidget {
  final Map ProductItem;
  ProductUpdate(this.ProductItem,{Key? key}) : super(key: key);

  @override
  State<ProductUpdate> createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {
  Map<String,String> FormValues = {"Img":"","ProductCode":"","ProductName":"","Qty":"","TotalPrice":"","UnitPrice":""};
  bool loading = false;

  InputOnChange(Mapkey,Mapvalue){
    setState(() {
      FormValues.update(Mapkey, (value) => Mapvalue);
    });
  }

  FormOnSubmit() async{
    //Form Validation
    if (FormValues['Img'] == ""){
      ErrorToast('Image Url cannot be empty!!');

    }
    else if (FormValues['ProductCode'] == ""){
      ErrorToast("Provide a product Code");

    }
    else if (FormValues['ProductName'] == ""){
      ErrorToast("Please provide a product Name");
    }
    else if (FormValues['Qty'] == ""){
      ErrorToast("Product Quantity cannot be empty!!");

    }
    else if (FormValues["TotalPrice"] == ""){
      ErrorToast("You must provide the total price!!!");
    }
    else if (FormValues["UnitPrice"] == ""){
      ErrorToast("You must provide the unit price!!");
    }
    else{
      setState(() {
        loading = true;
      });
      await ProductUpdateRequest(widget.ProductItem['_id'], FormValues);

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProductGridViewScreen()), (route) => false);
      setState(() {
        loading = false;
      });
    }

  }

  @override
  void initState() {
      setState(() {
        FormValues.update("Img", (value) =>widget.ProductItem['Img']);
        FormValues.update("ProductCode", (value) =>widget.ProductItem['ProductCode']);
        FormValues.update("ProductName", (value) =>widget.ProductItem['ProductName']);
        FormValues.update("Qty", (value) =>widget.ProductItem['Qty']);
        FormValues.update("UnitPrice", (value) =>widget.ProductItem['UnitPrice']);
        FormValues.update("TotalPrice", (value) =>widget.ProductItem['TotalPrice']);
      });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        elevation: 1,
        title: Text('Update Product'),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
          child: loading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40.0,),
                TextFormField(decoration: FormFieldDecoration('Product Name'),
                  initialValue: FormValues['ProductName'],
                  onChanged: (value){

                    InputOnChange("ProductName", value);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: FormFieldDecoration('Product Code'),
                  initialValue: FormValues['ProductCode'],
                  onChanged: (value){
                    InputOnChange("ProductCode", value);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: FormFieldDecoration('Product Image URL'),
                  initialValue: FormValues['Img'],
                  onChanged: (value){
                    InputOnChange("Img", value);
                  },
                ),
                SizedBox(height: 20.0,),
                DropDownStyle(
                    DropdownButton(
                        isExpanded: true,
                        underline: Container(),
                        value: FormValues['Qty'],
                        items: [
                          DropdownMenuItem(child: Text("Select Qty"),value: "",),
                          DropdownMenuItem(child: Text("1 pcs"),value: "1 pcs",),
                          DropdownMenuItem(child: Text("2 pcs"),value: '2 pcs',),
                          DropdownMenuItem(child: Text("3 pcs"),value: "3 pcs",),
                          DropdownMenuItem(child: Text("4 pcs"),value: '4 pcs',),

                        ], onChanged: (value){
                      InputOnChange("Qty", value);

                    })
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: FormFieldDecoration('Unit Price'),
                  initialValue: FormValues['UnitPrice'],
                  onChanged: (value){
                    InputOnChange("UnitPrice", value);
                  },

                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: FormFieldDecoration('Total Price'),
                  initialValue: FormValues['TotalPrice'],
                  onChanged: (value){
                    InputOnChange("TotalPrice", value);
                  },

                ),
                SizedBox(height: 20.0,),
                ElevatedButton(onPressed: (){
                  FormOnSubmit();

                }, child: Text("Create",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(
                      elevation: 1,
                      fixedSize: Size(double.infinity, 40.0),
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black
                  ),)
              ],
            ),
          ))
      ),
    );
  }
}
