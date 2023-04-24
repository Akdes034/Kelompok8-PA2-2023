<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Product;
use App\Models\OrderDetail;
use App\Models\User;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::orderBy('status','asc')->get();
        return view('pages.orders.index', compact('orders'));
    }

    public function show($id)
    {
        $order = Order::find($id);
        $orders = Order::all();
        $num = 1;
        $product = OrderDetail::where('order_id',$id)->join('products','products.id','=','order_details.product_id')
        ->get(['products.name','products.price','order_details.quantity']);
        $user = User::where('id',$order->user_id)->first();
         return view('pages.orders.show', compact('product','order','orders','num','user'));


    }

    public function process($id)
    {
        $order = Order::find($id);
        $order->status = "Processing";
        $order->save();
        return redirect()->route('orders.show',$id)->with('success', 'Status berhasil diupdate.');

    }

    public function deny($id)
    {
        $order = Order::find($id);
        $order->status = "Cancelled";
        $order->save();
        return redirect()->route('orders.show',$id)->with('success', 'Status berhasil diupdate.');
    }
    public function complete($id){
        $order = Order::find($id);
        $order->status = "Completed";
        $order->save();
        return redirect()->route('orders.show',$id)->with('success', 'Status berhasil diupdate.');
    }
}
