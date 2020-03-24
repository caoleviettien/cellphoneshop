@extends('./master')
@section('content') 

<section id="cart_items" class="pt-5 pb-5">
    <div class="container">
@if(count($cart))
        <div class="text-center pt-2">
            <a href="{{ url('cart/xoahet') }}" class="btn btn-danger float-left"><i class="fa fa-trash-o" aria-hidden="true"></i> Clear Cart</a>
            <h3>Shopping Cart</h3>
        </div>
        
    <table class="table">
          <thead>
            <tr>
                <th scope="col">Item</th>
                <th scope="col">Product Name</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach($cart as $item)
            <tr>
                <th scope="row">
                    <a href="{{ url("single-product-details/$item->id") }}">
                        <img style="width: 150px;" src="{{ asset('img') }}/{{ $item->options->brand }}/{{ $item->options->img }}">
                    </a>
                </th>
                <td><a href="{{ url("single-product-details/$item->id") }}">{{$item->name}}</a></td>
                <td>{{str_replace(',', '.', number_format($item->price))}} &#8363;</td>

                <td class="cart_quantity">
                    <div class="form-inline">
                       <div class="input-group mb-3">
                              <div class="input-group-prepend">
                                   <form method="POST" action="{{url("cart?product_id=$item->id&decrease=1")}}">
                                       <input type="hidden" name="product_id" value="{{ $item->id }}">
                                       <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                       <button type="submit" class="btn btn-warning btn-block"><i class="fa fa-minus" aria-hidden="true"></i></button>
                                   </form>       
                               </div>

                                <input class="form-control" type="text" name="quantity" value="{{$item->qty}}" autocomplete="off" size="2">

                            <div class="input-group-append">
                                    <form method="POST" action="{{url("cart?product_id=$item->id&increment=1")}}">
                                       <input type="hidden" name="product_id" value="{{ $item->id }}">
                                       <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                       <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-plus" aria-hidden="true"></i></button>
                                   </form> 
                                
                            </div>
                        </div>
                    </div>
                </td>
                <td class="cart_total">
                    <p class="cart_total_price" style="color: red;">{{str_replace(',', '.', number_format($item->subtotal))}} &#8363;</p>
                </td>
                <td>
                    <a class="btn btn-danger" href="{{ url("xoasanpham/$item->rowId") }}"><i class="fa fa-trash" aria-hidden="true"></i> Delete</a>
                </td>
            </tr>
            @endforeach
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><h5>Ship</h5></td>
                <td><strong>29000.00 &#8363;</strong></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><h5>Total</h5></td>
                <td><strong>{{str_replace(',', '.', number_format(Cart::total()))}} &#8363;</strong></td>
            </tr>
        </tbody>
    </table>

        <div class="row">
            <div class="col-md-6">
                <a href="{{ url('shop') }}" class="btn btn-warning"><i class="fa fa-home"></i> Home</a>
                
            </div>
            <div class="col-md-6 text-right">
                <a href="{{ url('cart/checkout') }}" class="btn btn-success"><i class="fa fa-credit-card"></i> Checkout</a>
            </div>
        </div>
@else
    <div class="text-center pt-2">
        <h3>Shopping Cart</h3>
    </div>
    <p>You have no items in the shopping cart</p>
@endif


</div>
</div>
</section> <!--/#cart_items-->
@endsection