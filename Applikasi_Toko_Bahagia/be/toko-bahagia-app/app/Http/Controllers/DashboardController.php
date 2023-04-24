<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use Illuminate\Support\Facades\DB;
class DashboardController extends Controller
{

    public function index()
    {
        $total_order = Order::where('status','Pending')->count();
        $orders = Order::get()->where('status', 'Pending');
        $sum_orders = Order::where('status','Completed')->sum('total');
        $num = 1;
        return view('pages.dashboard.index', compact('total_order','sum_orders','orders','num'));

    }
}
