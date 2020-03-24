@extends('layouts.app')
@section('content') 


<div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="page-title text-center">                    
                        <h2>THANH TOÁN THÀNH CÔNG</h2>
                        <h2> CHÂN THÀNH CẢM ƠN QUÝ KHÁCH ĐÃ MUA HÀNG CỦA SHOP</h2>
                </div>
            </div>
        </div>
    <div class="row">
        <div class="row text-center">
            <div class="col-xs-12 col-md-12" style="margin-left: 300px; margin-bottom: 20px;">
                <a href="{{ url("shop") }}"><input type="submit" value="Tiếp tục mua sắm...->" class="btn btn-primary btn-block btn-lg" tabindex="7"></a>
            </div> 
                     
        </div>
        
    </div>
    <div class="text-center">
    	<h4>Chuyển về SHOP sau 7  giây</h4><progress value="" max="7" id="progressBar"></progress>
    </div>
    
</div>

<script type="text/javascript">
    window.setTimeout(function(){
        // Move to a new location or you can do something else
        window.location.href = "http://localhost/blog/public/shop";
    }, 7000);


    var timeleft = 10;
    var downloadTimer = setInterval(function(){
    	document.getElementById("progressBar").value = 10 - --timeleft;
    	if(timeleft <= 0)
    		clearInterval(downloadTimer);
    },1000);
</script>
@endsection