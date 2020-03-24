<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use Cart;
use Illuminate\Support\Facades\Input;

class ShopController extends Controller
{
    public function getAllProduct()
	{
		$data = Product::paginate(6);
		$cart = Cart::content();
		return View('shop', ['prod'=>$data, 'cart'=>$cart]);
	}

	public function getAllProductForIndex()
	{
		$data = Product::paginate(6);
		$cart = Cart::content();
		return View('index', ['prod'=>$data, 'cart'=>$cart]);
	}

	public function searchProduct()
	{
		$input = Input::get('query'); // get value of search input
		$columns = ['brand', 'name', 'price']; // array conlumns's name
		$cart = Cart::content();
		$query = Product::query();
		
		foreach ($columns as $column) {
					$query->orWhere($column, 'LIKE', '%' .$input. '%');
				}		
		
		$data = $query->paginate(6);
		return View('search', ['prod'=>$data, 'cart'=>$cart]);
	}

	public function orderByBrand($brand)
	{
		$data = Product::where('brand', '=', $brand);
		$data = $data->paginate(6);
		$cart = Cart::content();
		return View('shop', ['prod'=>$data, 'brand'=>$brand, 'cart'=>$cart]);
	}

	public function singleProduct($id)
	{
		$data = Product::where('id', '=', $id)->first();
		$cart = Cart::content();
		return View('single-product-details', ['prod'=>$data, 'cart'=>$cart]);
	}


	public function filter(Request $request) {
	    $query = Product::orderBy('price','asc');
	    if($request->min_price && $request->max_price){
	        $query = $query->where('price','>=',$request->min_price);
	        $query = $query->where('price','<=',$request->max_price);
	    }
	    $product = $query->paginate();
	    $cart = Cart::content();
	    return View('shop', ['prod'=>$product, 'cart'=>$cart]);
	}



	public function contact()
	{
		$cart = Cart::content();
		return view('contact', ['cart'=>$cart]);
	}
}
