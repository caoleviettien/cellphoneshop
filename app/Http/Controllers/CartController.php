<?php

namespace App\Http\Controllers;

use App\Http\Controllers\customer;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Redirect;
use App\Product;
use App\Customers;
use App\Bill;
use App\BillDetail;
use Cart;

class CartController extends Controller
{
    //CART
    public function cart()
    {
       if (Request::isMethod('post')) {
            $this->data['title'] = 'Giỏ hàng của bạn';
            $product_id = Request::get('product_id');
            $product = Product::find($product_id);
            
            Cart::add(array('id' => $product_id, 'name'=>$product->name, 'qty'=>1, 'price'=>$product->price, 'options'=>array('brand'=>$product->brand, 'img'=>$product->img)));
        }
        
         //increment the quantity
        if (Request::get('product_id') && (Request::get('increment')) == 1) {
            $rows = Cart::search(function($key, $value) {
                return $key->id == Request::get('product_id');
            });
            $item = $rows->first();
            Cart::update($item->rowId, $item->qty + 0);
        }

        //decrease the quantity
        if (Request::get('product_id') && (Request::get('decrease')) == 1) {
            $rows = Cart::search(function($key, $value) {
                return $key->id == Request::get('product_id');
            });
            $item = $rows->first();
            Cart::update($item->rowId, $item->qty - 2);
        }

        $cart = Cart::content();
        $this->data['cart'] = $cart;
        return view('layouts.cart', $this->data);       
    }

    public function xoasanpham($id)
    {
        Cart::remove($id);
        $cart = Cart::content();
        $this->data['cart'] = $cart;
        return view('layouts.cart', $this->data); 
    }

    public function xoahet()
    {
        Cart::destroy();
        $cart = Cart::content();
        $this->data['cart'] = $cart;
        return view('layouts.cart', $this->data); 
    }

    public function view()
    {        
        $cart = Cart::content();
        $this->data['cart'] = $cart;
        return view('layouts.cart', $this->data); 
    }


    public function cartpoint()
    {        
        $cart = Cart::content();
        $this->data['cart'] = $cart;
        return view('index', $this->data);
    }


    //CHECKOUT
    public function getCheckOut() {
        $this->data['title'] = 'Check out';
        $this->data['cart'] = Cart::content();
        $this->data['total'] = Cart::total();
        return view('layouts.checkout', $this->data);
    }

    public function postCheckOut(Request $request) {
        $cartInfor = Cart::content();
        // validate
        $rule = [
            'fullName' => 'required',
            'email' => 'required|email',
            'address' => 'required',
            'phoneNumber' => 'required'
        ];
        
        $validator = Validator::make(Input::all(), $rule);
        
        if ($validator->fails()) {
            return redirect('/cart/checkout')
                        ->withErrors($validator)
                        ->withInput();
        }
        
        try {
            // save
            $customer = new Customers;
            $customer->name = Request::get('fullName');
            $customer->email = Request::get('email');
            $customer->address = Request::get('address');
            $customer->phone_number = Request::get('phoneNumber');
            //$customer->note = $request->note;
            $customer->save();

            $bill = new Bill;
            $bill->customer_id = $customer->id;
            $bill->date_order = date('Y-m-d H:i:s');
            $bill->total = str_replace(',', '', Cart::total());
            $bill->note = Request::get('note');
            $bill->save();

            if (count($cartInfor) > 0) {
                foreach ($cartInfor as $key => $item) {
                    $billDetail = new BillDetail;
                    $billDetail->bill_id = $bill->id;
                    $billDetail->product_id = $item->id;
                    $billDetail->quantily = $item->qty;
                    $billDetail->price = $item->price;
                    $billDetail->save();
                }
            }
          // del
           Cart::destroy();

          //success
        return view('checkoutsuccess');
            
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }
}