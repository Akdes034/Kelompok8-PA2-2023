@extends('layouts.master')
@section('title', 'Process Order')
@section('page', 'Order')
@section('breadcrumb')
    <!--begin::Breadcrumb-->
    <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 pt-1">
        <!--begin::Item-->
        <li class="breadcrumb-item text-muted">Order</li>
        <!--end::Item-->
        <!--begin::Item-->
        <li class="breadcrumb-item">
            <span class="bullet bg-gray-200 w-5px h-2px"></span>
        </li>
        <!--end::Item-->
        <!--begin::Item-->
        <li class="breadcrumb-item text-dark">Process Order</li>
        <!--end::Item-->
    </ul>
    <!--end::Breadcrumb-->
@endsection

@section('content')
@if(session('success'))
    <div class="alert alert-success">
        {{ session('success') }}
    </div>
@endif
    <!--begin::Content-->
    <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
        <!--begin::Post-->
        <div class="post d-flex flex-column-fluid" id="kt_post">
            <!--begin::Container-->
            <div id="kt_content_container" class="container-xxl">
                <!--begin::Order details page-->
                <div class="d-flex flex-column gap-7 gap-lg-10">
                    <div class="d-flex flex-wrap flex-stack gap-5 gap-lg-10">
                        <!--begin:::Tabs-->
                        <ul
                            class="nav nav-custom nav-tabs nav-line-tabs nav-line-tabs-2x border-0 fs-4 fw-semibold mb-lg-n2 me-auto">
                            <!--begin:::Tab item-->
                            <li class="nav-item">
                                <a class="nav-link text-active-primary pb-4 active" data-bs-toggle="tab"
                                    href="#kt_ecommerce_sales_order_summary">Order Summary</a>
                            </li>
                            <!--end:::Tab item-->
                            <!--begin:::Tab item-->
                          
                            <!--end:::Tab item-->
                        </ul>
                        <!--end:::Tabs-->
                        <!--begin::Button-->
                        <a href="../../demo8/dist/apps/ecommerce/sales/listing.html"
                            class="btn btn-icon btn-light btn-sm ms-auto me-lg-n7">
                            <!--begin::Svg Icon | path: icons/duotune/arrows/arr074.svg-->
                            <span class="svg-icon svg-icon-2">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M11.2657 11.4343L15.45 7.25C15.8642 6.83579 15.8642 6.16421 15.45 5.75C15.0358 5.33579 14.3642 5.33579 13.95 5.75L8.40712 11.2929C8.01659 11.6834 8.01659 12.3166 8.40712 12.7071L13.95 18.25C14.3642 18.6642 15.0358 18.6642 15.45 18.25C15.8642 17.8358 15.8642 17.1642 15.45 16.75L11.2657 12.5657C10.9533 12.2533 10.9533 11.7467 11.2657 11.4343Z"
                                        fill="currentColor" />
                                </svg>
                            </span>
                            <!--end::Svg Icon-->
                        </a>
                        <!--end::Button-->
                        <form method="POST" action="{{ route('orders.process', $order->id) }}">
                            @csrf
                            @method('PUT')
                            <button  class="btn btn-success btn-sm me-lg-n7" type="submit">Process</button>
                        </form>
                        <!--end::Button-->
                    
                        <!--begin::Button-->
                        <form method="POST" action="{{ route('orders.deny', $order->id) }}">
                            @csrf
                            @method('PUT')
                            <button  class="btn btn-danger btn-sm me-lg-n7" type="submit">Cancel</button>
                        </form>
                        <form method="POST" action="{{ route('orders.complete', $order->id) }}">
                            @csrf
                            @method('PUT')
                            <button  class="btn btn-warning btn-sm me-lg-n7" type="submit">Complete</button>
                        </form>
                       
                        <!--end::Button-->
                    </div>
                    <!--begin::Order summary-->
                    <div class="d-flex flex-column flex-xl-row gap-7 gap-lg-10">
                        <!--begin::Order details-->
                        <div class="card card-flush py-4 flex-row-fluid">
                            <!--begin::Card header-->
                            <div class="card-header">
                                <div class="card-title">
                                    <h2>Order Details {{ $order->code }}</h2>
                                </div>
                            </div>
                            <!--end::Card header-->
                            <!--begin::Card body-->
                            <div class="card-body pt-0">
                                <div class="table-responsive">
                                    <!--begin::Table-->
                                    <table class="table align-middle table-row-bordered mb-0 fs-6 gy-5 min-w-300px">
                                        <!--begin::Table body-->
                                        <tbody class="fw-semibold text-gray-600">
                                            <!--begin::Date-->
                                            <tr>
                                                <td class="text-muted">
                                                    <div class="d-flex align-items-center">
                                                        <!--begin::Svg Icon | path: icons/duotune/files/fil002.svg-->
                                                        <span class="svg-icon svg-icon-2 me-2">
                                                            <svg width="20" height="21" viewBox="0 0 20 21"
                                                                fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path opacity="0.3"
                                                                    d="M19 3.40002C18.4 3.40002 18 3.80002 18 4.40002V8.40002H14V4.40002C14 3.80002 13.6 3.40002 13 3.40002C12.4 3.40002 12 3.80002 12 4.40002V8.40002H8V4.40002C8 3.80002 7.6 3.40002 7 3.40002C6.4 3.40002 6 3.80002 6 4.40002V8.40002H2V4.40002C2 3.80002 1.6 3.40002 1 3.40002C0.4 3.40002 0 3.80002 0 4.40002V19.4C0 20 0.4 20.4 1 20.4H19C19.6 20.4 20 20 20 19.4V4.40002C20 3.80002 19.6 3.40002 19 3.40002ZM18 10.4V13.4H14V10.4H18ZM12 10.4V13.4H8V10.4H12ZM12 15.4V18.4H8V15.4H12ZM6 10.4V13.4H2V10.4H6ZM2 15.4H6V18.4H2V15.4ZM14 18.4V15.4H18V18.4H14Z"
                                                                    fill="currentColor" />
                                                                <path
                                                                    d="M19 0.400024H1C0.4 0.400024 0 0.800024 0 1.40002V4.40002C0 5.00002 0.4 5.40002 1 5.40002H19C19.6 5.40002 20 5.00002 20 4.40002V1.40002C20 0.800024 19.6 0.400024 19 0.400024Z"
                                                                    fill="currentColor" />
                                                            </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->Date Added
                                                    </div>
                                                </td>
                                                <td class="fw-bold text-end">{{ $order->created_at }}</td>
                                            </tr>
                                            <!--end::Date-->
                                            <!--begin::Payment method-->
                                            <tr>
                                                <td class="text-muted">
                                                    <div class="d-flex align-items-center">
                                                        <!--begin::Svg Icon | path: icons/duotune/finance/fin008.svg-->
                                                        <span class="svg-icon svg-icon-2 me-2">
                                                            <svg width="24" height="24" viewBox="0 0 24 24"
                                                                fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path opacity="0.3"
                                                                    d="M3.20001 5.91897L16.9 3.01895C17.4 2.91895 18 3.219 18.1 3.819L19.2 9.01895L3.20001 5.91897Z"
                                                                    fill="currentColor" />
                                                                <path opacity="0.3"
                                                                    d="M13 13.9189C13 12.2189 14.3 10.9189 16 10.9189H21C21.6 10.9189 22 11.3189 22 11.9189V15.9189C22 16.5189 21.6 16.9189 21 16.9189H16C14.3 16.9189 13 15.6189 13 13.9189ZM16 12.4189C15.2 12.4189 14.5 13.1189 14.5 13.9189C14.5 14.7189 15.2 15.4189 16 15.4189C16.8 15.4189 17.5 14.7189 17.5 13.9189C17.5 13.1189 16.8 12.4189 16 12.4189Z"
                                                                    fill="currentColor" />
                                                                <path
                                                                    d="M13 13.9189C13 12.2189 14.3 10.9189 16 10.9189H21V7.91895C21 6.81895 20.1 5.91895 19 5.91895H3C2.4 5.91895 2 6.31895 2 6.91895V20.9189C2 21.5189 2.4 21.9189 3 21.9189H19C20.1 21.9189 21 21.0189 21 19.9189V16.9189H16C14.3 16.9189 13 15.6189 13 13.9189Z"
                                                                    fill="currentColor" />
                                                            </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->Payment Method
                                                    </div>
                                                </td>
                                                <td class="fw-bold text-end">
                                                    {{ $order->payment_method }}
                                                </td>
                                            </tr>
                                            <!--end::Payment method-->
                                            <tr>
                                                <td class="text-muted">
                                                    <div class="d-flex align-items-center">
                                                        <!--begin::Svg Icon | path: icons/duotune/communication/com006.svg-->
                                                        <span class="svg-icon svg-icon-2 me-2">
                                                            <svg width="18" height="18" viewBox="0 0 18 18"
                                                                fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path opacity="0.3"
                                                                    d="M16.5 9C16.5 13.125 13.125 16.5 9 16.5C4.875 16.5 1.5 13.125 1.5 9C1.5 4.875 4.875 1.5 9 1.5C13.125 1.5 16.5 4.875 16.5 9Z"
                                                                    fill="currentColor" />
                                                                <path
                                                                    d="M9 16.5C10.95 16.5 12.75 15.75 14.025 14.55C13.425 12.675 11.4 11.25 9 11.25C6.6 11.25 4.57499 12.675 3.97499 14.55C5.24999 15.75 7.05 16.5 9 16.5Z"
                                                                    fill="currentColor" />
                                                                <rect x="7" y="6" width="4"
                                                                    height="4" rx="2" fill="currentColor" />
                                                            </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->Customer
                                                    </div>
                                                </td>
                                                <td class="fw-bold text-end">
                                                    <div class="d-flex align-items-center justify-content-end">
                                                        <!--begin:: Avatar -->
                                                        <div class="symbol symbol-circle symbol-25px overflow-hidden me-3">
                                                        </div>
                                                        <!--end::Avatar-->
                                                        <!--begin::Name-->
                                                        <p> {{ $user->name }} </p>
                                                        <!--end::Name-->
                                                    </div>
                                                </td>
                                            </tr>
                                            <!--end::Customer name-->
                                            <!--begin::Customer email-->
                                            <tr>
                                                <td class="text-muted">
                                                    <div class="d-flex align-items-center">
                                                        <!--begin::Svg Icon | path: icons/duotune/communication/com011.svg-->
                                                        <span class="svg-icon svg-icon-2 me-2">
                                                            <svg width="24" height="24" viewBox="0 0 24 24"
                                                                fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path opacity="0.3"
                                                                    d="M21 19H3C2.4 19 2 18.6 2 18V6C2 5.4 2.4 5 3 5H21C21.6 5 22 5.4 22 6V18C22 18.6 21.6 19 21 19Z"
                                                                    fill="currentColor" />
                                                                <path
                                                                    d="M21 5H2.99999C2.69999 5 2.49999 5.10005 2.29999 5.30005L11.2 13.3C11.7 13.7 12.4 13.7 12.8 13.3L21.7 5.30005C21.5 5.10005 21.3 5 21 5Z"
                                                                    fill="currentColor" />
                                                            </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->Email
                                                    </div>
                                                </td>
                                                <td class="fw-bold text-end">
                                                    <p> {{ $user->email }}</p>
                                                </td>
                                            </tr>
                                            <!--end::Payment method-->
                                            <!--begin::Date-->
                                            <tr>
                                                <td class="text-muted">
                                                    <div class="d-flex align-items-center">
                                                        <!--begin::Svg Icon | path: icons/duotune/electronics/elc003.svg-->
                                                        <span class="svg-icon svg-icon-2 me-2">
                                                            <svg width="24" height="24" viewBox="0 0 24 24"
                                                                fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M5 20H19V21C19 21.6 18.6 22 18 22H6C5.4 22 5 21.6 5 21V20ZM19 3C19 2.4 18.6 2 18 2H6C5.4 2 5 2.4 5 3V4H19V3Z"
                                                                    fill="currentColor" />
                                                                <path opacity="0.3" d="M19 4H5V20H19V4Z"
                                                                    fill="currentColor" />
                                                            </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->Phone
                                                    </div>
                                                </td>
                                                <td class="fw-bold text-end">{{ $user->phone }}</td>
                                            </tr>
                                            <tr>
                                                <td class="text-muted">
                                                    <div class="d-flex align-items-center">
                                                        <!--begin::Svg Icon | path: icons/duotune/electronics/elc003.svg-->
                                                        <span class="svg-icon svg-icon-2 me-2">
                                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                                                                <circle cx="12" cy="12" r="10" fill="currentColor"/>
                                                                <path fill="currentColor" d="M11 16.2l-3.2-3.1L7 14l4 4 8-8-1.4-1.4z"/>
                                                              </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->Status
                                                    </div>
                                                </td>
                                                <td class="fw-bold text-end">{{ $order->status }}</td>
                                            </tr>
                                             <tr>
                                                <td class="text-muted">
                                                    <div class="d-flex align-items-center">
                                                        <!--begin::Svg Icon | path: icons/duotune/electronics/elc003.svg-->
                                                        <span class="svg-icon svg-icon-2 me-2">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                                                <path fill="#757575" d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"/>
                                                                <path fill="#757575" d="M11 7h2v7h-2z"/>
                                                                <circle fill="#757575" cx="12" cy="17" r="1"/>
                                                              </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->Total Pembayaran
                                                    </div>
                                                </td>
                                                <td class="fw-bold text-end">Rp.{{number_format($order->total, 0, ',', '.')}} </td>
                                            </tr>
                                        </tbody>
                                        <!--end::Table body-->
                                    </table>
                                    <!--end::Table-->
                                </div>
                            </div>
                            <!--end::Card body-->
                        </div>
                        <!--end::Order details-->
                        <!--begin::Customer details-->
                        <div class="card card-flush py-4 flex-row-fluid">
                            <!--begin::Card header-->
                            <div class="card-header">
                                <div class="card-title">
                                    <h2>Bukti Pembayaran</h2>
                                </div>
                            </div>
                            <!--end::Card header-->
                            <!--begin::Card body-->
                            <div class="card-body pt-0">
                                <div class="table-responsive">
                                    <!--begin::Table-->
                                    <table class="table align-middle table-row-bordered mb-0 fs-6 gy-5 min-w-300px">
                                        <!--begin::Table body-->
                                        <tbody class="fw-semibold text-gray-600">
                                            <!--begin::Customer name-->
                                            <tr>
                                                <td class="fw-bold text-end">
                                                    <div class="d-flex align-items-center justify-content-end">
                                                        <!--begin:: Avatar -->
                                                        <div class="symbol symbol-circle symbol-25px overflow-hidden me-3">
                                                        </div>
                                                        <!--end::Avatar-->
                                                        <!--begin::Name-->
                                                       <img src="{{ asset('images/bukti/' . $order->bukti_pembayaran) }}">
                                                        <!--end::Name-->
                                                    </div>
                                                </td>
                                            </tr>
                                            <!--end::Customer name-->
                                        </tbody>
                                        <!--end::Table body-->
                                    </table>
                                    <!--end::Table-->
                                </div>
                            </div>
                            <!--end::Card body-->
                        </div>
                        <!--end::Customer details-->
                    </div>
                    <!--end::Order summary-->
                    <!--begin::Tab content-->
                   
                                <div class="card card-flush py-4 flex-row-fluid overflow-hidden">
                                    <!--begin::Card header-->
                                    <div class="card-header">
                                        <div class="card-title">
                                            <h2>Order {{ $order->code }}</h2>
                                        </div>
                                    </div>
                                    <!--end::Card header-->
                                    <!--begin::Card body-->
                                    <div class="card-body pt-0">
                                        <div class="table-responsive">
                                            <!--begin::Table-->
                                            <table class="table align-middle table-row-dashed fs-6 gy-5 mb-0">
                                                <!--begin::Table head-->
                                                <thead>
                                                    <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                                        <th class="min-w-10px">No</th>
                                                        <th class="min-w-70px text-end">Nama Barang</th>
                                                        <th class="min-w-70px text-end">Qty</th>
                                                        <th class="min-w-70px text-end">Unit Price</th>
                                                        <th class="min-w-70px text-end">Total</th>
                                                    </tr>
                                                </thead>
                                                <!--end::Table head-->
                                                <!--begin::Table body-->
                                                <tbody class="fw-semibold text-gray-600">
                                                    @foreach($product as $products)
                                                    <tr>
                                                        <td class="text-end">{{ $num }}</td>
                                                        <td class="text-end">{{ $products->name }}</td>
                                                        <td class="text-end">{{ $products->quantity }}</td>
                                                        <td class="text-end">{{ $products->price }}</td>
                                                        <td class="text-end">Rp.{{ number_format( $products->price * $products->quantity, 0, ',', '.') }}</td>
                                                    </tr>
                                                    @endforeach
                                                    <!--end::Grand total-->
                                                </tbody>
                                                <tfoot >
                                                <!--end::Table head-->
                                            </table>
                                            <!--end::Table-->
                                        </div>
                                    </div>
                                    <!--end::Card body-->
                                </div>
                                <!--end::Product List-->
                            </div>
                            <!--end::Orders-->
                        </div>
                        <!--end::Tab pane-->
                    
                    </div>
                    <!--end::Tab content-->
                </div>
                <!--end::Order details page-->
            </div>
            <!--end::Container-->
        </div>
        <!--end::Post-->
    </div>
    <!--end::Content-->
    
@endsection