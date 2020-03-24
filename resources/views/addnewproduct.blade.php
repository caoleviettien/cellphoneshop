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

        <div class="col-xs-12 col-sm-12 col-md-12 col-sm-offset-2 col-md-offset-3">
        <form id="FormAdd" role="form" action="{{ URL::action('HomeController@addNew') }}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
            <h2 class="text-center">Thêm mới sản phẩm</h2>
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input type="text" name="name" id="first_name" class="form-control input-lg" placeholder="Tên Sản Phẩm" tabindex="1">
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <div class="controls">
                            <select name="brand">
                                <option value="Apple">Apple</option>
                                <option value="Samsung">Samsung</option>
                                <option value="Xiaomi">Xiaomi</option>
                                <option value="Oppo">Oppo</option>
                            </select> *
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <input type="text" name="price" id="price" class="form-control input-lg" placeholder="Giá Sản Phẩm" tabindex="3">
            </div>  
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input type="file" name="file" id="file" class="form-control" tabindex="5">
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <textarea name="detail" id="detail" class="form-control input-lg" placeholder="detail of product" tabindex="6"></textarea>
                    </div>
                </div>
            </div>
            
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-12 col-md-6"><input type="submit" value="Thêm Mới" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                <div class="col-xs-12 col-md-6"><input onclick="myFunction()" type="button" value="Làm Lại" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
            </div>
        </form>
    </div>
</div>
@endsection

<script>
function myFunction() {
    document.getElementById("FormAdd").reset();
}
</script>