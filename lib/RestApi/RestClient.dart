import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Utility/Utility.dart';

Future<bool> ProductUpdateRequest(id,FormValues) async{
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
  var postBody = json.encode(FormValues);
  var postHeader = {"Content-Type":"application/json"};
  var response = await http.post(URL,headers: postHeader,body: postBody);
  var ResultBody = json.decode(response.body);
  var ResultCode = response.statusCode;
  if (ResultCode == 200 && ResultBody['status'] == 'success'){
    SuccessToast("Update Request Success!!");
    return true;
  }
  else{
    ErrorToast('Update Request Failed!! Try again!!');
    return false;
  }

}

Future<List> ProductGridViwListRequest() async{

  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var postHeader = {"content-type":"application/json"};

  var response = await http.get(URL,headers: postHeader);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success'){
    SuccessToast("Request success!!");
    return ResultBody['data'];
  }
  else{
    ErrorToast("Request failed !! Try again!");
    return [];
  }
}

Future<bool> ProductDeleteRequest(id) async{
  
  var URL =Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  var postHeader = {"content-type":"application/json"};
  var response = await http.get(URL,headers: postHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success'){
    SuccessToast("Request Success!!");
    return true;
  }
  else{
    ErrorToast("Request Failed!! Try again!!");
    return false;
  }
  
}

Future<bool> ProductCreateRequest(FormValues) async{
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody = json.encode(FormValues);
  var PostHeader = {"Content-Type":"application/json"};
  var response = await http.post(URL,headers: PostHeader,body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == "success"){
    SuccessToast("Request success !!!");
    return true;
  }
  else{
    ErrorToast("Request failed!!! Try again !!!");
    return false;
  }
}