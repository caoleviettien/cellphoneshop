@extends('master')

@section('content')



    <!-- ##### Welcome Area Start ##### -->
    <section class="welcome_area bg-img background-overlay" style="background-image: url(img/bg-img/bg-main.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="hero-content">>
                        <h2>New Phone 2018</h2>
                        <a href="{{ url('shop') }}" class="btn essence-btn">Shopping</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Welcome Area End ##### -->

    <!-- ##### Top Catagory Area Start ##### -->
    <div class="top_catagory_area section-padding-80 clearfix">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Single Catagory -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(img/bg-img/bg-apple.jpg);">
                        <div class="catagory-content">
                            <a href="{{ url('shop/apple') }}">Apple</a>
                        </div>
                    </div>
                </div>
                <!-- Single Catagory -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(img/bg-img/bg-samsung.jpg);">
                        <div class="catagory-content">
                            <a href="{{ url('shop/samsung') }}">SamSung</a>
                        </div>
                    </div>
                </div>
                <!-- Single Catagory -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(img/bg-img/bg-oppo.jpg);">
                        <div class="catagory-content">
                            <a href="{{ url('shop/oppo') }}">Oppo</a>
                        </div>
                    </div>
                </div>
                <!-- Single Catagory -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(img/bg-img/bg-xiaomi.jpg);">
                        <div class="catagory-content">
                            <a href="{{ url('shop/xiaomi') }}">Xiaomi</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Top Catagory Area End ##### -->

    <!-- ##### CTA Area Start ##### -->
    <div class="cta-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="cta-content bg-img background-overlay" style="background-image: url(img/bg-img/bg-sale.jpg);">
                        <div class="h-100 d-flex align-items-center justify-content-end">
                            <div class="cta--text">
                                <h6 style="color: #fff;">-69.96%</h6>
                                <h2 style="color: #fff;">Supper Sale</h2>
                                <a href="{{url('shop')}}" class="btn essence-btn">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
    <!-- ##### CTA Area End ##### -->

    <!-- ##### New Arrivals Area Start ##### -->
    <section class="new_arrivals_area section-padding-80 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center">
                        <h2>Popular Products</h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="popular-products-slides owl-carousel">
                        <!-- Single Product -->                       
                         @foreach($prod as $item) 
                        <div class="single-product-wrapper">
                            <!-- Product Image -->
                            <div class="product-img">
                                <img src="{{ asset("img/$item->brand/$item->img") }}" alt="">
                                <!-- Hover Thumb -->
                                <img class="hover-img" src="{{ asset("img/$item->brand/$item->img") }}" alt="">

                                <!-- Product Badge -->
                                <div class="product-badge new-badge">
                                    <span>New</span>
                                </div>  
                                
                            </div>
                            <!-- Product Description -->
                            <div class="product-description">
                                <span>{{$item->brand}}</span>
                                <a href="{{ url("single-product-details/$item->id") }}">
                                    <h6 style="color: red;">{{$item->name}}</h6>
                                </a>
                                <p class="product-price">{{$item->price}} VNĐ</p>                             

                                    <form method="POST" action="{{url('cart')}}">
                                        <input type="hidden" name="product_id" value="{{$item->id}}">
                                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                        <button type="submit" class="add-to-cart-btn">
                                            <div class="hover-content">
                                                <i class="btn essence-btn">Add to cart</i>                                          
                                            </div>
                                        </button>
                                    </form>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### New Arrivals Area End ##### -->

    <!-- ##### Brands Area Start ##### -->
    <div class="brands-area d-flex align-items-center justify-content-between">
        <!-- Brand Logo -->
        <div class="single-brands-logo">
            <img src="img/core-img/lg-apple.png" alt="">
        </div>
        <!-- Brand Logo -->
        <div class="single-brands-logo">
            <img src="img/core-img/lg-samsung.png" alt="">
        </div>
        <!-- Brand Logo -->
        <div class="single-brands-logo">
            <img src="img/core-img/lg-oppo.png" alt="">
        </div>
        <!-- Brand Logo -->
        <div class="single-brands-logo">
            <img src="img/core-img/lg-xiaomi.png" alt="">
        </div>
    </div>
    <!-- ##### Brands Area End ##### -->

@endsection