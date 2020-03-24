@extends('layouts.app')

@section('content')

<div class="container">
    {{-- <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    You are logged in!
                </div>
            </div>
        </div>
    </div> --}}
    <div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-sm-offset-2 col-md-offset-3">
        <form id="FormEdit" role="form" action="{{ URL::action('HomeController@update') }}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
            <h2 class="text-center">Sửa sản phẩm</h2>
            <hr class="colorgraph">
            <div class="row">
                <input type="hidden" name="id" value="{{ old('id', $getProductById['id'])}}">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input value="{{ old('name', $getProductById['name'])}}" type="text" name="name" id="first_name" class="form-control input-lg" placeholder="Tên Sản Phẩm" tabindex="1">
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <div class="controls">
                            <select name="brand">
                                <option value="Apple" <?php if($getProductById['brand'] == 'Apple') echo "selected='selected'" ?>>Apple</option>
                                <option value="Samsung" <?php if($getProductById['brand'] == 'Samsung') echo "selected='selected'" ?>>Samsung</option>
                                <option value="Xiaomi" <?php if($getProductById['brand'] == 'Xiaomi') echo "selected='selected'" ?>>Xiaomi</option>
                                <option value="Oppo" <?php if($getProductById['brand'] == 'Oppo') echo "selected='selected'" ?>>Oppo</option>
                            </select> *
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input value="{{ old('price', $getProductById['price'])}}" type="number" name="price" id="price" class="form-control input-lg" placeholder="Giá Sản Phẩm" tabindex="3">
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <textarea name="detail" id="detail" class="form-control input-lg" placeholder="detail of product" tabindex="6">{{ old('details', $getProductById['details'])}}</textarea>
                    </div>
                </div>
            </div>
    
            <div class="row text-center">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <?php 
                          $brand = old('brand', $getProductById['brand']);
                          $img =  old('img', $getProductById['img']);
                    ?>

                    <div class="form-group" style="width: 100px;" >                 
                            <input type="file" name="img" class="form-control" tabindex="5"  onchange="document.getElementById('imgChange').src = window.URL.createObjectURL(this.files[0])">
                    </div>
                    <div class="form-group">
                        <img id="imgChange" name="imgChange" style="margin-left:50px; margin-top:-65px; width: 300px;" src="{{asset('img/'.$brand.'/'.$img)}}" height="250px">
                    </div>                  
                
                </div>              
                
            </div>
            
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-12 col-md-6"><input type="submit" value="Sửa" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                <div class="col-xs-12 col-md-6"><input onclick="myFunction()" type="button" value="Làm Lại" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
            </div>
        </form>
    </div>
</div>
</div>
@endsection

<script>
function myFunction() {
    document.getElementById("FormEdit").reset();
}
</script>