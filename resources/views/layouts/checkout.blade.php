@extends('./master')
@section('content') 

    <section class="pt-5 pb-5">
        <div class="container">
            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Your cart</span>
            <span class="badge badge-secondary badge-pill">{{$cart->count()}}</span>
          </h4>
          <ul class="list-group mb-3">
            @if(count($cart))
            @foreach($cart as $item)
            <li class="list-group-item d-flex justify-content-between lh-condensed">

              <div class="row">
                <div class="col-sm-4">
                    <img class="" width="80px" src="{{ asset('img') }}/{{ $item->options->brand }}/{{ $item->options->img }}">
                </div>
                <div class="col-sm-8">
                    <h6 class="my-0">{{$item->name}}</h6>
                <small class="text-muted">Qty: {{ $item->qty }}</small>
                </div>
                
              </div>
              <span class="text-muted">{{str_replace(',', '.', number_format($item->subtotal))}} &#8363;</span>
            </li>
            @endforeach
            @else
                <li class="list-group-item d-flex justify-content-between">
                  <span>Cart Emty</span>
                  <a href="{{ url('shop') }}" class="btn btn-warning">Back to Shop</a>
                </li>
            @endif
            <li class="list-group-item d-flex justify-content-between">
              <span>Total (VND)</span>
              <strong>{{str_replace(',', '.', number_format($total))}} &#8363;</strong>
            </li>
          </ul>

        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Thông tin khách hàng</h4>
          <form action="{{ url('/cart/checkout') }}" method="post" class="needs-validation" novalidate="">
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
            @if(count($errors) >0)
                <ul>
                @foreach($errors->all() as $error)
                    <li class="text-danger">{{ $error }}</li>
                @endforeach
                </ul>
            @endif
            <div class="mb-3">
              <label for="email">Fullname</span></label>
              <input type="email" class="form-control" name="fullName" value="{{ old('fullName') }}" placeholder="Nhập họ và tên">
              <div class="invalid-feedback">
                Hãy nhập họ tên đầy đủ.
              </div>
            </div>

            <div class="mb-3">
              <label for="email">Email <span class="text-muted">(Optional)</span></label>
              <input type="email" class="form-control" name="email" value="{{ old('email') }}" placeholder="you@example.com">
              <div class="invalid-feedback">
                Hãy nhập email hợp lệ.
              </div>
            </div>

            <div class="mb-3">
              <label for="address">Address</label>
              <input type="text" class="form-control" name="address" value="{{ old('address') }}" placeholder="Nhập địa chỉ" required="">
              <div class="invalid-feedback">
                Hãy nhập địa chỉ.
              </div>
            </div>

            <div class="mb-3">
              <label for="email">Phone Number</span></label>
              <input type="email" class="form-control" name="phoneNumber" value="{{ old('phoneNumber') }}" placeholder="Nhập số điện thoại">
              <div class="invalid-feedback">
                Hãy nhập số điện thoại.
              </div>
            </div>
            <hr class="mb-4">
            <div class="form-group">
              <label for="comment">Note:</label>
              <textarea class="form-control" name="note" value="{{ old('message') }}"  rows="5"></textarea>
            </div>
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
          </form>
        </div>
            </div>

        </div>
    </section>
@endsection