@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row justify-content-center">
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
    </div>
    

    <div class="search pt-2 pt-2">
        <form action="" method="">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Search</span>
                </div>
                <input type="text" class="form-control" name="keyword" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
            </div>
        </form>
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
                        <button type="button" class="btn btn-info"><i class="fa fa-pencil" aria-hidden="true"></i> Edit</button>
                        <button type="button" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i> Delete</button>
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
@endsection
