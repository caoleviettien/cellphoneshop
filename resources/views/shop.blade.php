@extends('master')

@section('content')


<!-- ##### Breadcumb Area Start ##### -->
<div class="breadcumb_area bg-img" style="background-image: url({{ asset('img/bg-img/breadcumb.jpg') }});">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="page-title text-center">
                    <h2>Products</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ##### Breadcumb Area End ##### -->

<!-- ##### Shop Grid Area Start ##### -->
<section class="shop_grid_area section-padding-80">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-4 col-lg-3">
                <div class="shop_sidebar_area">

                    <!-- ##### Single Widget ##### -->
                    <div class="widget brands mb-50">
                        <!-- Widget Title 2 -->
                        <p class="widget-title2 mb-30">Brands</p>
                        <div class="widget-desc">
                            <ul>
                                <li><a href="{{url('shop/Apple') }}">Apple</a></li>
                                <li><a href="{{url('shop/Samsung')}}">Samsung</a></li>
                                <li><a href="{{url('shop/Oppo')}}">Oppo</a></li>
                                <li><a href="{{url('shop/Xiaomi')}}">Xiaomi</a></li>
                                
                            </ul>
                        </div>
                    </div>

                    <!-- ##### Single Widget ##### -->
                    <div class="widget price mb-50">                        

                        <form action="{{ url('/shop') }}" method="post">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                            <div class="input-group mb-3">
                              <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">Min</span>
                            </div>
                            <input type="number" class="form-control" placeholder="Nhập giá nhỏ nhất" name="min_price">
                        </div>

                        <div class="input-group mb-3">
                          <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Max</span>
                        </div>
                        <input type="number" class="form-control" placeholder="Nhập giá lớn nhất" name="max_price">
                    </div>                     
                    <button type="submit" class="btn btn-primary">Lọc</button>
                </form>
            </div>


        </div>
    </div>

    <div class="col-12 col-md-8 col-lg-9">
        <div class="shop_grid_product_area">
            <div class="row">
                <div class="col-12">
                    <div class="product-topbar d-flex align-items-center justify-content-between">
                        <!-- Total Products -->
                        <div class="total-products">
                            <p><span>{{$prod->total()}}</span> products found</p>

                        </div>
                        <!-- Sorting -->
                                <!-- <div class="product-sorting d-flex">
                                    <p>Sort by:</p>
                                    <form action="#" method="get">
                                        <select name="select" id="sortByselect">
                                            <option value="value">Highest Rated</option>
                                            <option value="value">Newest</option>
                                            <option value="value">Price: $$ - $</option>
                                            <option value="value">Price: $ - $$</option>
                                        </select>
                                        <input type="submit" class="d-none" value="">
                                    </form>
                                </div> -->
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        @foreach($prod as $item)
                        <!-- Single Product -->
                        <div class="col-12 col-sm-6 col-lg-4">
                            <div class="single-product-wrapper">
                                <!-- Product Image -->
                                <div class="product-img">
                                    <a href="{{ url("single-product-details/$item->id") }}">
                                        <img src="{{ asset("img/$item->brand/$item->img") }}" height="250px">
                                    </a>

                                </div>

                                <!-- Product Description -->
                                <div class="product-description text-center">
                                    <span>{{$item->brand}}</span>
                                    <a href="{{ url("single-product-details/$item->id") }}">
                                        <h6>{{$item->name}}</h6>
                                    </a>
                                    <p class="product-price">{{str_replace(',', '.', number_format($item->price))}} &#8363;</p>

                                    <!-- Hover Content -->
                                    <!-- Hover Content -->
                                    <div class="hover-content">
                                        <!-- Add to Cart -->
                                        <div class="add-to-cart-btn">
                                            <form method="POST" action="{{url('cart')}}">
                                                <input type="hidden" name="product_id" value="{{$item->id}}">
                                                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                                <button type="submit" class="btn essence-btn"><i class="fa fa-shopping-cart"></i> Add to cart</button>
                                            </form>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        @endforeach



                    </div>
                </div>

                <!-- Pagination -->
                <div class="row justify-content-center">
                    <nav aria-label="navigation">
                        {!! str_replace("/?", "?", $prod->render()) !!}
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Shop Grid Area End ##### -->
@endsection