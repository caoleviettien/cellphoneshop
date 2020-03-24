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
    <div class="row text-center">
            <div class="col-xs-12 col-md-12">
                <a href="{{ url('home/addnewproduct') }}" class="btn btn-primary btn-block">
                    <i class="fa fa-plus"></i> Add new
                </a>
            </div>
        </div>
    <!-- Begin show all product -->
    <div class="row pt-2 pt-2">
        @foreach ($prod as $item)
        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item pt-2 pb-2">
            <div class="card h-100">
                <div class="card-header">
                    <strong>{{$item->brand}}</strong>
                </div>
                <a href="#"><img class="card-img-top img-prod mx-auto d-block" src="{{ asset('img/' . $item->brand . '/'. $item->img. '') }}"></a>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="#">{{$item->name}}</a>
                    </h4>
                    <h6 class="card-subtitle mb-2 text-muted">{{ str_replace(',', '.', number_format($item->price)) }} &#8363;</h6>
                    <p class="card-text"></p>
                    <div class="div">
                        <a href="{{ url("home/$item->id/edit") }}" class="btn btn-info"><i class="fa fa-pencil" aria-hidden="true"></i> Edit</a>
                        <a onclick="return confirmAction()" href="{{ url("home/$item->id/deleteproduct") }}" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i> Delete</a>
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    </div>
    <!-- End show all product -->

    <!-- Begin Pagination -->
    <div class="row justify-content-center">
        {{$prod->render()}}
    </div>
    <!-- End Pagination -->
</div>
<SCRIPT LANGUAGE="JavaScript">
        function confirmAction() {
            return confirm("Bạn Có Muốn Xóa Sản Phẩm Này Không?")
        }
    </SCRIPT>
@endsection
