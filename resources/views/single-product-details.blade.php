@extends('master')

@section('content')


    <!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area d-flex align-items-center">

        <!-- Single Product Thumb -->
        <div class="single_product_thumb clearfix">
            <div class="product_thumbnail_slides owl-carousel">
                <img style="width: 70%;" src="{{ asset("img/$prod->brand/$prod->img") }}" alt="">
                <img style="width: 70%;" src="{{ asset("img/$prod->brand/$prod->img") }}" alt="">
            </div>
        </div>

        <!-- Single Product Description -->
        <div class="single_product_desc clearfix">
            <span>{{ $prod->brand }}</span>
            <a href="">
                <h2>{{ $prod->name }}</h2>
            </a>
            <p class="product-price">{{str_replace(',', '.', number_format($prod->price))}} &#8363;</p>
            <p style="font-weight: 0.5em;" class="product-desc">{{ $prod->details }}</p>
          
                    <!-- <button type="submit" name="addtocart" value="5" class="btn essence-btn">Add to cart</button> -->
                    <form method="post" action="{{url('cart')}}">
                        <input type="hidden" name="product_id" value="{{$prod->id}}">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        <button type="submit" name="addtocart" value="5" class="btn essence-btn"><i class="fa fa-shopping-cart"></i> Add to cart</button>
                    </form>                   
                
        </div>
    </section>
    <!-- ##### Single Product Details Area End ##### -->

@endsection