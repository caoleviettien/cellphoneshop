<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use Illuminate\Support\Facades\Input;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    // return Home view
    public function index()
    {
        $data = Product::paginate(8);       
        return view('home', ['prod'=>$data]);
    }


    // add new product
    public function addNew(Request $request){
        $allRequest = $request->all();
        $name   = $allRequest['name'].str_replace("'", "/'", "");  
        $price  = $allRequest['price'].str_replace("'", "/'", "");
        $brand  = $allRequest['brand'].str_replace("'", "/'", "");
        $detail = $allRequest['detail'].str_replace("'", "/'", "");
        $date = date('Y-m-d H:i:s');
        

        $file_name = $request->file('file')->getClientOriginalName();
        $request->file('file')->move('resource/upload',$file_name); 

        $dataInsertToDatabase = array(
            'brand' => $brand,
            'name'=> $name,
            'details' => $detail,
            'price'=> $price,
            'img' => $file_name.str_replace("'", "/'", ""),
            'date' => $date
        );

        $objProduct = new Product();
        $objProduct->insert($dataInsertToDatabase);
        return View('insertsuccess');
    }

    // edit product
    public function edit($id)
    {
        $objProduct = new Product();
        $getProductById = $objProduct->find($id)->toArray();
        return view('editproduct')->with('getProductById', $getProductById);
    }

    public function update(Request $request)
    {
        $allRequest = $request->all();
        $id = $allRequest['id'];
        $brand  = $allRequest['brand'].str_replace("'", "/'", "");
        $name   = $allRequest['name'].str_replace("'", "/'", "");  
        $price  = $allRequest['price'].str_replace("'", "/'", "");
        $detail = $allRequest['detail'].str_replace("'", "/'", "");


        if ($request->file('img')) {
            $img = $request->file('img')->getClientOriginalName();
            $request->file('img')->move('resource/upload',$img);
        }

        else
        {
            $img = null;
        }        


        $objProduct = new Product();
        $getProductById = $objProduct->find($id);
        $getProductById->brand = $brand;
        $getProductById->name = $name;
        $getProductById->details = $detail; 
        $getProductById->price = $price;     

        if ($img != null) {
            $getProductById->img = $img.str_replace("'", "/'", "");
        }

        
        $getProductById->save();

        return View('editsuccess');
    }

    // delete product
    public function deleteProduct($id)
    {
        Product::find($id)->delete();
        return View('deletesuccess');
    }

}
