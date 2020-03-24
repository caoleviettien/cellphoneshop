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
    
    <div class="breadcumb_area bg-img" style="background-image: url({{ asset('img/bg-img/breadcumb.jpg') }});">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="page-title text-center">                    
                        <h2>THÊM SẢN PHẨM THÀNH CÔNG</h2>
                </div>
            </div>
        </div>
    <div class="row">
        <div class="row text-center">
            <div class="col-xs-12 col-md-12" style="margin-left: 300px; margin-bottom: 20px;">
                <a href="{{ url("shop") }}"><input type="submit" value="Về Trang Chủ" class="btn btn-primary btn-block btn-lg" tabindex="7"></a>

                <a href="{{ url("home") }}"><input type="submit" value="Về Trang Admin" class="btn btn-primary btn-block btn-lg" tabindex="7"></a>

                <a href="{{ url("home/addnewpr") }}"><input type="submit" value="Thêm Mới Tiếp" class="btn btn-primary btn-block btn-lg" tabindex="7"></a>

            </div>            
        </div>
    </div>
</div>
@endsection
