<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('index');
});

/*
	Admin
*/

// edit product
Route::get('/home/{id}/edit', 'HomeController@edit');
Route::post('/home/update', 'HomeController@update');

// delete product
Route::get('/home/{id}/deleteproduct', 'HomeController@deleteProduct');

// add new product
Route::post('/home/addnew', 'HomeController@addNew');
Route::get('/home/addnewproduct', function ()
{
	return View('addnewproduct');
});

Route::get('/admin/{brand}', 'HomeController@orderByBrandForAdmin');

// login
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


/*
	Shop
*/

Route::get('/shop', 'ShopController@getAllProduct');
Route::get('/', 'ShopController@getAllProductForIndex');
Route::get('/index', 'ShopController@getAllProductForIndex');
Route::get('/shop/{brand}', 'ShopController@orderByBrand');
Route::get('/single-product-details/{id}', 'ShopController@singleProduct');
Route::get('/search', 'ShopController@searchProduct');
Route::get('/contact', 'ShopController@contact');

Route::get('/{page}', function($page) {
    return View($page);
});

Route::post('/shop', 'ShopController@filter');

/*
	Cart
*/
Route::post('/cart', 'CartController@cart');
Route::get('/xoasanpham/{id}', 'CartController@xoasanpham');
Route::get('/cart/xoahet', 'CartController@xoahet');


/*
	Order
*/
Route::get('/cart/view', 'CartController@view');
Route::get('/cart/checkout', 'CartController@getCheckOut');	
Route::post('/cart/checkout', 'CartController@postCheckOut');