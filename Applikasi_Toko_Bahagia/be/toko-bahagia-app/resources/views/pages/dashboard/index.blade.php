@extends('layouts.master')
@section('title', 'Dashboard')
@section('page', 'Dashboard')
@section('breadcrumb')
    <!--begin::Breadcrumb-->
    <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 pt-1">
        <!--begin::Item-->
        <li class="breadcrumb-item text-muted">Dashboards</li>
        <!--end::Item-->
    </ul>
    <!--end::Breadcrumb-->
@endsection
@section('content')
    <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
        <!--begin::Post-->
        <div class="post d-flex flex-column-fluid" id="kt_post">
            <!--begin::Container-->
            <div id="kt_content_container" class="container-xxl">
                <!--begin::Row-->
                <div class="row g-5 g-xl-8">
                    <div class="col-xl-4">
                        <!--begin::Statistics Widget 5-->
                        <a class="card bg-body-white hoverable card-xl-stretch mb-xl-8 {{ request()->is('orders') ? 'active' : '' }}"
                            href="{{ route('orders.index') }}">
                            <!--begin::Body-->
                            <div class="card-body">
                                <!--begin::Svg Icon | path: icons/duotune/ecommerce/ecm002.svg-->
                                <span class="svg-icon svg-icon-primary svg-icon-3x ms-n1">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M21 10H13V11C13 11.6 12.6 12 12 12C11.4 12 11 11.6 11 11V10H3C2.4 10 2 10.4 2 11V13H22V11C22 10.4 21.6 10 21 10Z"
                                            fill="currentColor" />
                                        <path opacity="0.3"
                                            d="M12 12C11.4 12 11 11.6 11 11V3C11 2.4 11.4 2 12 2C12.6 2 13 2.4 13 3V11C13 11.6 12.6 12 12 12Z"
                                            fill="currentColor" />
                                        <path opacity="0.3"
                                            d="M18.1 21H5.9C5.4 21 4.9 20.6 4.8 20.1L3 13H21L19.2 20.1C19.1 20.6 18.6 21 18.1 21ZM13 18V15C13 14.4 12.6 14 12 14C11.4 14 11 14.4 11 15V18C11 18.6 11.4 19 12 19C12.6 19 13 18.6 13 18ZM17 18V15C17 14.4 16.6 14 16 14C15.4 14 15 14.4 15 15V18C15 18.6 15.4 19 16 19C16.6 19 17 18.6 17 18ZM9 18V15C9 14.4 8.6 14 8 14C7.4 14 7 14.4 7 15V18C7 18.6 7.4 19 8 19C8.6 19 9 18.6 9 18Z"
                                            fill="currentColor" />
                                    </svg>
                                </span>
                                <!--end::Svg Icon-->
                                <div class="text-gray-900 fw-bold fs-2 mb-2 mt-5">Order</div>
                                <div class="fw-semibold text-gray-400">{{ $total_order }}</div>
                            </div>
                            <!--end::Body-->
                        </a>
                        <!--end::Statistics Widget 5-->
                    </div>
                    <div class="col-xl-4">
                        <!--begin::Statistics Widget 5-->
                        <a href="{{ route('products.index') }}" class="card bg-primary hoverable card-xl-stretch mb-xl-8">
                            <!--begin::Body-->
                            <div class="card-body">
                                <!--begin::Svg Icon | path: icons/duotune/general/gen008.svg-->
                                <span class="svg-icon svg-icon-white svg-icon-3x ms-n1">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M3 2H10C10.6 2 11 2.4 11 3V10C11 10.6 10.6 11 10 11H3C2.4 11 2 10.6 2 10V3C2 2.4 2.4 2 3 2Z"
                                            fill="currentColor" />
                                        <path opacity="0.3"
                                            d="M14 2H21C21.6 2 22 2.4 22 3V10C22 10.6 21.6 11 21 11H14C13.4 11 13 10.6 13 10V3C13 2.4 13.4 2 14 2Z"
                                            fill="currentColor" />
                                        <path opacity="0.3"
                                            d="M3 13H10C10.6 13 11 13.4 11 14V21C11 21.6 10.6 22 10 22H3C2.4 22 2 21.6 2 21V14C2 13.4 2.4 13 3 13Z"
                                            fill="currentColor" />
                                        <path opacity="0.3"
                                            d="M14 13H21C21.6 13 22 13.4 22 14V21C22 21.6 21.6 22 21 22H14C13.4 22 13 21.6 13 21V14C13 13.4 13.4 13 14 13Z"
                                            fill="currentColor" />
                                    </svg>
                                </span>
                                <!--end::Svg Icon-->
                                <div class="text-white fw-bold fs-2 mb-2 mt-5">Product</div>
                                <div class="fw-semibold text-white">Checking Products</div>
                            </div>
                            <!--end::Body-->
                        </a>
                        <!--end::Statistics Widget 5-->
                    </div>
                    <div class="col-xl-4">
                        <!--begin::Statistics Widget 5-->
                        <a href="#" class="card bg-dark hoverable card-xl-stretch mb-5 mb-xl-8">
                            <!--begin::Body-->
                            <div class="card-body">
                                <!--begin::Svg Icon | path: icons/duotune/arrows/arr070.svg-->
                                <span class="svg-icon svg-icon-gray-100 svg-icon-3x ms-n1">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <rect x="8" y="9" width="3" height="10" rx="1.5"
                                            fill="currentColor" />
                                        <rect opacity="0.5" x="13" y="5" width="3" height="14"
                                            rx="1.5" fill="currentColor" />
                                        <rect x="18" y="11" width="3" height="8" rx="1.5"
                                            fill="currentColor" />
                                        <rect x="3" y="13" width="3" height="6" rx="1.5"
                                            fill="currentColor" />
                                    </svg>
                                </span>
                                <!--end::Svg Icon-->
                                <div class="text-gray-100 fw-bold fs-2 mb-2 mt-5">Hasil Penjualan</div>
                                <div class="fw-semibold text-gray-100"> Rp.{{number_format($sum_orders, 0, ',', '.') }}</div>
                            </div>
                            <!--end::Body-->
                        </a>
                        <!--end::Statistics Widget 5-->
                    </div>
                </div>
 <!--begin::Content-->
 <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!--begin::Post-->
    <div class="post d-flex flex-column-fluid" id="kt_post">
        <!--begin::Container-->
        <div id="kt_content_container" class="container-xxl">
            <!--begin::Products-->
            <div class="card card-flush">
                <!--begin::Card header-->
                <div class="card-header align-items-center py-5 gap-2 gap-md-5">
                    <!--begin::Card title-->
                    <div class="card-title">
                        <!--begin::Search-->
                        <div class="d-flex align-items-center position-relative my-1">
                            <!--begin::Svg Icon | path: icons/duotune/general/gen021.svg-->
                            <span class="svg-icon svg-icon-1 position-absolute ms-4">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2"
                                        rx="1" transform="rotate(45 17.0365 15.1223)" fill="currentColor" />
                                    <path
                                        d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                        fill="currentColor" />
                                </svg>
                            </span>
                            <!--end::Svg Icon-->
                            <input type="text" data-kt-ecommerce-order-filter="search"
                                class="form-control form-control-solid w-250px ps-14" placeholder="Search Order" />
                        </div>
                        <!--end::Search-->
                    </div>
                    <!--end::Card title-->
                    <!--begin::Card toolbar-->
                    <div class="card-toolbar flex-row-fluid justify-content-end gap-5">
                        <!--begin::Flatpickr-->
                        <div class="input-group w-250px">
                            <input class="form-control form-control-solid rounded rounded-end-0"
                                placeholder="Pick date range" id="kt_ecommerce_sales_flatpickr" />
                            <button class="btn btn-icon btn-light" id="kt_ecommerce_sales_flatpickr_clear">
                                <!--begin::Svg Icon | path: icons/duotune/arrows/arr088.svg-->
                                <span class="svg-icon svg-icon-2">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <rect opacity="0.5" x="7.05025" y="15.5356" width="12" height="2"
                                            rx="1" transform="rotate(-45 7.05025 15.5356)"
                                            fill="currentColor" />
                                        <rect x="8.46447" y="7.05029" width="12" height="2" rx="1"
                                            transform="rotate(45 8.46447 7.05029)" fill="currentColor" />
                                    </svg>
                                </span>
                                <!--end::Svg Icon-->
                            </button>
                        </div>
                        <!--end::Flatpickr-->
                        <div class="w-100 mw-150px">
                            <!--begin::Select2-->
                            <select class="form-select form-select-solid" data-control="select2" data-hide-search="true"
                                data-placeholder="Status" data-kt-ecommerce-order-filter="status">
                                <option></option>
                                <option value="all">All</option>
                                <option value="Cancelled">Cancelled</option>
                                <option value="Completed">Completed</option>
                                <option value="Denied">Denied</option>
                                <option value="Pending">Pending</option>
                                <option value="Processing">Processing</option>
                            </select>
                            <!--end::Select2-->
                        </div>
                    </div>
                    <!--end::Card toolbar-->
                </div>
                <!--end::Card header-->
                <!--begin::Card body-->
                <div class="card-body pt-0">
                    <!--begin::Table-->
                    <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_ecommerce_sales_table">
                        <!--begin::Table head-->
                        <thead>
                            <!--begin::Table row-->
                            <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                <th class="w-10px pe-2">
                                    <div class="form-check form-check-sm form-check-custom form-check-solid me-3">
                                        <input class="form-check-input" type="checkbox" data-kt-check="true"
                                            data-kt-check-target="#kt_ecommerce_sales_table .form-check-input"
                                            value="1" />
                                    </div>
                                </th>
                                <th class="min-w-100px">Nomor</th>
                                <th class="min-w-175px">Nama Customer</th>
                                <th class="min-w-125px">Deskripsi</th>
                                <th class="text-end min-w-70px">Status</th>
                                <th class="text-end min-w-100px">Total</th>
                                <th class="text-end min-w-100px">Actions</th>
                            </tr>
                            <!--end::Table row-->
                        </thead>
                        <!--end::Table head-->
                        <!--begin::Table body-->
                        <tbody class="fw-semibold text-gray-600">
                            @foreach ($orders as $order)
                                <!--begin::Table row-->
                                <tr>
                                    <!--begin::Checkbox-->
                                    <td>
                                        <div class="form-check form-check-sm form-check-custom form-check-solid">
                                            <input class="form-check-input" type="checkbox" value={{ $order->id }} />
                                        </div>
                                    </td>
                                    <!--end::Checkbox-->
                                    <!--begin::Order ID=-->
                                    <td data-kt-ecommerce-order-filter="order_id">
                                        <p class="text-gray-800 text-hover-primary fw-bold">{{ $num++ }}</p>
                                    </td>
                                    <!--end::Order ID=-->
                                    <!--begin::Customer=-->
                                    <td>
                                        <div class="ms-5">
                                            <!--begin::Title-->
                                            <a href="javascript:;"
                                                class="text-gray-800 text-hover-primary fs-5 fw-bold">{{ $order->user->name }}</a>
                                            <!--end::Title-->
                                        </div>
                                    </td>
                                    <!--end::Customer=-->
                                    <!--begin::Description=-->
                                    <td>
                                        <div class="d-flex flex-column w-100 me-2">
                                            <!--begin::Description=-->
                                            <div class="d-flex flex-stack mb-2">
                                                <span class="text-gray-400 me-2">Description:</span>
                                                <span class="text-gray-600 fw-bold">{{ $order->description }}</span>
                                            </div>
                                            <!--end::Description=-->
                                            <!--begin::Date=-->
                                            <div class="d-flex flex-stack">
                                                <span class="text-gray-400 me-2">Date:</span>
                                                <span class="text-gray-600 fw-bold">{{ $order->created_at }}</span>
                                            </div>
                                            <!--end::Date=-->
                                        </div>
                                    </td>
                                    <!--begin::Status=-->
                                    <td class="text-end pe-0" data-order="Completed">
                                        <!--begin::Badges-->
                                        @php
                                            $badge = '';
                                            switch ($order->status ) {
                                                case 'Pending':
                                                    $badge = 'badge-light-warning';
                                                    break;
                                                case 'Processing':
                                                    $badge = 'badge-light-primary';
                                                    break;
                                                case 'Completed':
                                                    $badge = 'badge-light-success';
                                                    break;
                                                case 'Cancelled':
                                                    $badge = 'badge-light-danger';
                                                    break;
                                                case 'Denied':
                                                    $badge = 'badge-light-danger';
                                                    break;
                                                default:
                                                    $badge = 'badge-light-warning';
                                                    break;
                                            }
                                        @endphp
                                        <div class="badge {{ $badge }}"
                                            data-kt-ecommerce-order-filter="order_status">
                                            {{ $order->status }}
                                        </div>

                                        <!--end::Badges-->
                                    </td>
                                    <!--end::Status=-->
                                    <!--begin::Total=-->
                                    <td class="text-end pe-0">
                                        <span class="fw-bold">Rp.
                                            {{ number_format($order->total, 0, ',', '.') }}
                                        </span>
                                    </td>
                                    <!--end::Total=-->
                                    <!--begin::Action=-->
                                    <td class="text-end">
                                        <a href="#" class="btn btn-sm btn-light btn-active-light-primary"
                                            data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">Actions
                                            <!--begin::Svg Icon | path: icons/duotune/arrows/arr072.svg-->
                                            <span class="svg-icon svg-icon-5 m-0">
                                                <svg width="24" height="24" viewBox="0 0 24 24"
                                                    fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                        d="M11.4343 12.7344L7.25 8.55005C6.83579 8.13583 6.16421 8.13584 5.75 8.55005C5.33579 8.96426 5.33579 9.63583 5.75 10.05L11.2929 15.5929C11.6834 15.9835 12.3166 15.9835 12.7071 15.5929L18.25 10.05C18.6642 9.63584 18.6642 8.96426 18.25 8.55005C17.8358 8.13584 17.1642 8.13584 16.75 8.55005L12.5657 12.7344C12.2533 13.0468 11.7467 13.0468 11.4343 12.7344Z"
                                                        fill="currentColor" />
                                                </svg>
                                            </span>
                                            <!--end::Svg Icon-->
                                        </a>
                                        <!--begin::Menu-->
                                        <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4"
                                            data-kt-menu="true">
                                            <!--begin::Menu item-->
                                            <div class="menu-item px-3">
                                                <a href="{{ route('orders.show', $order->id) }}"
                                                    class="menu-link px-3">View</a>
                                            </div>
                                            <!--end::Menu item-->
                                            <!--begin::Menu item-->
                                            <div class="menu-item px-3">
                                                <a href="{{ route('orders.process', $order->id)}}"class="menu-link px-3"
                                                    data-kt-ecommerce-order-filter="process">Process</a>
                                            </div>
                                            <!--end::Menu item-->
                                            <!--begin::Menu item-->
                                            <div class="menu-item px-3">
                                                <a href="javascript:;" class="menu-link px-3"
                                                    data-kt-ecommerce-order-filter="deny">Deny</a>
                                            </div>
                                            <!--end::Menu item-->

                                        </div>
                                        <!--end::Menu-->
                                    </td>
                                    <!--end::Action=-->
                                </tr>
                                <!--end::Table row-->
                            @endforeach
                        </tbody>
                        <!--end::Table body-->
                    </table>
                    <!--end::Table-->
                </div>
                <!--end::Card body-->
            </div>
            <!--end::Products-->
        </div>
        <!--end::Container-->
    </div>
    <!--end::Post-->
</div>
<!--end::Content-->
            </div>
        </div>
@endsection
@section('scripts')
<script>
    "use strict";
    var KTAppEcommerceSalesListing = function() {
        var e, t, n, r, o, a = (e, n, a) => {
                r = e[0] ? new Date(e[0]) : null, o = e[1] ? new Date(e[1]) : null, $.fn.dataTable.ext.search.push((
                    function(e, t, n) {
                        var a = r,
                            c = o,
                            l = new Date(moment($(t[5]).text(), "DD/MM/YYYY")),
                            u = new Date(moment($(t[6]).text(), "DD/MM/YYYY"));
                        return null === a && null === c || null === a && c >= u || a <= l && null === c ||
                            a <= l && c >= u
                    })), t.draw()
            },
            c = () => {
                e.querySelectorAll('[data-kt-ecommerce-order-filter="process"]').forEach((function(e) {
                    e.addEventListener("click", (function(e) {
                        e.preventDefault();
                        const n = e.target.closest("tr"),
                            r = n.querySelector(
                                '[data-kt-ecommerce-order-filter="order_id"]').innerText,
                            s = n.querySelector(
                                '[data-kt-ecommerce-order-filter="order_status"]')
                            .innerText;
                        Swal.fire({
                            text: "Are you sure you want to process this order?",
                            icon: "warning",
                            showCancelButton: !0,
                            buttonsStyling: !1,
                            confirmButtonText: r,
                            cancelButtonText: "No, cancel",
                            customClass: {
                                confirmButton: "btn fw-bold btn-danger",
                                cancelButton: "btn fw-bold btn-active-light-primary"
                            }
                        }).then((function(e) {
                            if (e.value) {
                                var url =
                                    "{{ route('orders.process', ':id') }}";
                                url = url.replace(':id', r);
                                $.ajax({
                                    url: url,
                                    type: "POST",
                                    data: {
                                        _token: "{{ csrf_token() }}"
                                    },
                                    success: function(data) {
                                        if (data.status ==
                                            'success') {
                                            Swal.fire({
                                                text: "You have successfully processed " +
                                                    r +
                                                    "!",
                                                icon: "success",
                                                buttonsStyling:
                                                    !1,
                                                confirmButtonText: "Ok, got it!",
                                                customClass: {
                                                    confirmButton: "btn fw-bold btn-primary"
                                                }
                                            });
                                            s.innerText =
                                                "Processing";
                                        }
                                    }
                                });
                            } else "cancel" === e.dismiss && Swal.fire({
                                text: "Your order is safe :)",
                                icon: "error",
                                buttonsStyling: !1,
                                confirmButtonText: "Ok, got it!",
                                customClass: {
                                    confirmButton: "btn fw-bold btn-primary"
                                }
                            })
                        }))
                    }))
                }))
            },
            d = () => {
                e.querySelectorAll('[data-kt-ecommerce-order-filter="deny"]').forEach((function(e) {
                    e.addEventListener("click", (function(e) {
                        e.preventDefault();
                        const n = e.target.closest("tr"),
                            r = n.querySelector(
                                '[data-kt-ecommerce-order-filter="order_id"]').innerText,
                            s = n.querySelector(
                                '[data-kt-ecommerce-order-filter="order_status"]')
                            .innerText;
                        Swal.fire({
                            text: "Are you sure you want to deny this order?",
                            icon: "warning",
                            showCancelButton: !0,
                            buttonsStyling: !1,
                            confirmButtonText: "Yes, delete!",
                            cancelButtonText: "No, cancel",
                            customClass: {
                                confirmButton: "btn fw-bold btn-danger",
                                cancelButton: "btn fw-bold btn-active-light-primary"
                            }
                        }).then((function(e) {
                            if (e.value) {
                                var url = "{{ route('orders.deny', ':id') }}";
                                url = url.replace(':id', r);
                                $.ajax({
                                    url: url,
                                    type: "POST",
                                    data: {
                                        _token: "{{ csrf_token() }}"
                                    },
                                    success: function(data) {
                                        if (data.status ==
                                            'success') {
                                            Swal.fire({
                                                text: "You have successfully denied " +
                                                    r +
                                                    "!",
                                                icon: "success",
                                                buttonsStyling:
                                                    !1,
                                                confirmButtonText: "Ok, got it!",
                                                customClass: {
                                                    confirmButton: "btn fw-bold btn-primary"
                                                }
                                            });
                                            s.innerText =
                                                "Denied";
                                        }
                                    }
                                });
                            } else "cancel" === e.dismiss && Swal.fire({
                                text: "Your order is safe :)",
                                icon: "error",
                                buttonsStyling: !1,
                                confirmButtonText: "Ok, got it!",
                                customClass: {
                                    confirmButton: "btn fw-bold btn-primary"
                                }
                            })
                        }))
                    }))
                }))
            };
        return {
            init: function() {
                (e = document.querySelector("#kt_ecommerce_sales_table")) && ((t = $(e).DataTable({
                    info: !1,
                    order: [],
                    pageLength: 10,
                    columnDefs: [{
                        orderable: !1,
                        targets: 0
                    }, {
                        orderable: !1,
                        targets: 6
                    }]
                })).on("draw", (function() {
                    c()
                })), (() => {
                    const e = document.querySelector("#kt_ecommerce_sales_flatpickr");
                    n = $(e).flatpickr({
                        altInput: !0,
                        altFormat: "d/m/Y",
                        dateFormat: "Y-m-d",
                        mode: "range",
                        onChange: function(e, t, n) {
                            a(e, t, n)
                        }
                    })
                })(), document.querySelector('[data-kt-ecommerce-order-filter="search"]').addEventListener(
                    "keyup", (function(e) {
                        t.search(e.target.value).draw()
                    })), (() => {
                    const e = document.querySelector('[data-kt-ecommerce-order-filter="status"]');
                    $(e).on("change", (e => {
                        let n = e.target.value;
                        "all" === n && (n = ""), t.column(3).search(n).draw()
                    }))
                })(), c(), document.querySelector("#kt_ecommerce_sales_flatpickr_clear").addEventListener(
                    "click", (e => {
                        n.clear()
                    })))
            }
        }
    }();
    KTUtil.onDOMContentLoaded((function() {
        KTAppEcommerceSalesListing.init()
    }));
</script>
@endsection
