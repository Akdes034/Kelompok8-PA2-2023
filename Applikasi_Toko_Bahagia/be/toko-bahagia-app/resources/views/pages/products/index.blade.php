@extends('layouts.master')
@section('title', 'Products')
@section('page', 'Products')
@section('breadcrumb')
    <!--begin::Breadcrumb-->
    <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 pt-1">
        <!--begin::Item-->
        <li class="breadcrumb-item text-muted">Products</li>
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
                                <input type="text" data-kt-ecommerce-product-filter="search"
                                    class="form-control form-control-solid w-250px ps-14" placeholder="Search Product" />
                            </div>
                            <!--end::Search-->
                        </div>
                        <!--end::Card title-->
                        <!--begin::Card toolbar-->
                        <div class="card-toolbar flex-row-fluid justify-content-end gap-5">
                            <!--begin::Add product-->
                            <a href="{{ route('products.create') }}" class="btn btn-primary">
                                Add Product</a>
                            <!--end::Add product-->
                        </div>
                        <!--end::Card toolbar-->
                    </div>
                    <!--end::Card header-->
                    <!--begin::Card body-->
                    <div class="card-body pt-0">
                        <!--begin::Table-->
                        <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_ecommerce_products_table">
                            <!--begin::Table head-->
                            <thead>
                                <!--begin::Table row-->
                                <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                    <th class="w-10px pe-2">
                                        <div class="form-check form-check-sm form-check-custom form-check-solid me-3">
                                            <input class="form-check-input" type="checkbox" data-kt-check="true"
                                                data-kt-check-target="#kt_ecommerce_products_table .form-check-input"
                                                value="1" />
                                        </div>
                                    </th>
                                    <th class="min-w-200px">Product</th>
                                    <th class="text-end min-w-100px">SKU</th>
                                    <th class="text-end min-w-100px">Category</th>
                                    <th class="text-end min-w-70px">Qty</th>
                                    <th class="text-end min-w-100px">Price</th>
                                    <th class="text-end min-w-70px">Actions</th>
                                </tr>
                                <!--end::Table row-->
                            </thead>
                            <!--end::Table head-->
                            <!--begin::Table body-->
                            <tbody class="fw-semibold text-gray-600">
                                @foreach ($products as $item)
                                    <!--begin::Table row-->
                                    <tr>
                                        <!--begin::Checkbox-->
                                        <td>
                                            <div class="form-check form-check-sm form-check-custom form-check-solid">
                                                <input class="form-check-input" type="checkbox" value={{ $item->id }}
                                                    data-kt-ecommerce-product-filter="product_id" />
                                            </div>
                                        </td>
                                        <!--end::Checkbox-->
                                        <!--begin::Category=-->
                                        <td>
                                            <div class="d-flex align-items-center">
                                                @if ($item->image)
                                                    <!--begin::Thumbnail-->
                                                    <a href="{{ route('products.edit', $item->id) }}"
                                                        class="symbol symbol-50px">
                                                        <span class="symbol-label"
                                                            style="background-image:url('{{ asset('images/products/' . $item->image) }}')">
                                                        </span>
                                                    </a>
                                                    <!--end::Thumbnail-->
                                                @endif
                                                <div class="ms-5">
                                                    <!--begin::Title-->
                                                    <a href="{{ route('products.edit', $item->id) }}"
                                                        class="text-gray-800 text-hover-primary fs-5 fw-bold"
                                                        data-kt-ecommerce-product-filter="product_name">{{ $item->name }}</a>
                                                    <!--end::Title-->
                                                </div>
                                            </div>
                                        </td>
                                        <!--end::Category=-->
                                        <!--begin::SKU=-->
                                        <td class="text-end pe-0">
                                            <span class="fw-bold">{{ $item->sku }}</span>
                                        </td>
                                        <!--end::SKU=-->
                                        <!--begin::Category=-->
                                        <td class="text-end pe-0">
                                            <span class="fw-bold">{{ $item->category }}</span>
                                        </td>
                                        <!--begin::Qty=-->
                                        <td class="text-end pe-0" data-order="{{ $item->quantity }}">
                                            <span class="fw-bold ms-3">{{ $item->quantity }}</span>
                                        </td>
                                        <!--end::Qty=-->
                                        <!--begin::Price=-->
                                        <td class="text-end pe-0">
                                            <span class="fw-bold ms-3">Rp.{{ number_format($item->price) }}</span>
                                        </td>
                                        <!--end::Price=-->
                                        <!--begin::Action=-->
                                        <td class="text-end">
                                            <a href="javascript:;" class="btn btn-sm btn-light btn-active-light-primary"
                                                data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">Actions
                                                <!--begin::Svg Icon | path: icons/duotune/arrows/arr072.svg-->
                                                <span class="svg-icon svg-icon-5 m-0">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg">
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
                                                    <form action="{{ route('products.edit', $item->id) }}">
                                                    <button  class="btn btn-warning menu link px-3" type="submit"> Update </button>
                                                    </form>
                                                </div>
                                                <!--end::Menu item-->
                                                <!--begin::Menu item-->
                                                <div class="menu-item px-3">
                                                    <form action="{{ route('products.destroy', $item->id) }}" method="POST" class="delete-form">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger menu link px-3 delete-btn">Delete</button>
                                                    </form>
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
@endsection

@section('scripts')
  <script>
    // batasan
    "use strict";
    $('.delete-form').submit(function(e) {
      e.preventDefault();

      // Use sweet alert for confirmation box
      Swal.fire({
        title: 'Are you sure?',
        text: 'You won\'t be able to revert this!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#dc3545',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        if (result.isConfirmed) {
          $(this).unbind('submit').submit();
        }
      });
    });
        var KTAppEcommerceProducts = function() {
            var t, e, n = () => {
                t.querySelectorAll('[data-kt-ecommerce-product-filter="delete_row"]').forEach((t => {
                    t.addEventListener("click", (function(t) {
                        t.preventDefault();
                        const n = t.target.closest("tr"),
                            r = n.querySelector(
                                '[data-kt-ecommerce-product-filter="product_name"]')
                            .innerText,
                            o = n.querySelector(
                                '[data-kt-ecommerce-product-filter="product_sku"]');
                        Swal.fire({
                            text: "Are you sure you want to delete " + r + "?",
                            icon: "warning",
                            showCancelButton: !0,
                            buttonsStyling: !1,
                            confirmButtonText: "Yes, delete!",
                            cancelButtonText: "No, cancel",
                            customClass: {
                                confirmButton: "btn fw-bold btn-danger",
                                cancelButton: "btn fw-bold btn-active-light-primary"
                            }
                        }).then((function(t) {
                            if (t.value) {
                                var url =
                                    "{{ route('products.destroy', ':id') }}";
                                url = url.replace(':id', o.value);
                                $.ajax({
                                    url: url,
                                    type: "DELETE",
                                    data: {
                                        _token: "{{ csrf_token() }}"
                                    },
                                    success: function(response) {
                                        Swal.fire({
                                            text: "You have deleted " +
                                                r + "!.",
                                            icon: "success",
                                            buttonsStyling:
                                                !1,
                                            confirmButtonText: "Ok, got it!",
                                            customClass: {
                                                confirmButton: "btn fw-bold btn-primary"
                                            }
                                        }).then((function() {
                                            e.row($(n))
                                                .remove()
                                                .draw()
                                        }))
                                    }
                                })
                            }
                        }))
                    }))
                }))
            };
            return {
                init: function() {
                    (t = document.querySelector("#kt_ecommerce_products_table")) && ((e = $(t).DataTable({
                        info: !1,
                        order: [],
                        pageLength: 10,
                        columnDefs: [{
                            orderable: !1,
                            targets: 0
                        }, {
                            orderable: !1,
                            targets: 5
                        }]
                    })).on("draw", (function() {
                        n()
                    })), document.querySelector('[data-kt-ecommerce-product-filter="search"]').addEventListener(
                        "keyup", (function(t) {
                            e.search(t.target.value).draw()
                        })), (() => {
                        const t = document.querySelector('[data-kt-ecommerce-product-filter="status"]');
                        $(t).on("change", (t => {
                            let n = t.target.value;
                            "all" === n && (n = ""), e.column(6).search(n).draw()
                        }))
                    })(), n())
                }
            }
        }();
        KTUtil.onDOMContentLoaded((function() {
            KTAppEcommerceProducts.init()
        }));
  </script>

@endsection

@section('styles')
 <style> 
 /* Customize the sweet alert style */
 .swal2-popup {
    font-size: 1.1rem !important;
  }

  .swal2-title {
    font-size: 1.5rem !important;
  }

  .swal2-actions button {
    border-radius: 4px !important;
    padding: 10px 20px !important;
  }

  .swal2-confirm {
    background-color: #dc3545 !important;
    border-color: #dc3545 !important;
    color: #fff !important;
    margin-right: 10px !important;
  }

  .swal2-confirm:hover {
    background-color: #c82333 !important;
    border-color: #c82333 !important;
  }

  .swal2-cancel {
    background-color: #6c757d !important;
    border-color: #6c757d !important;
    color: #fff !important;
  }

  .swal2-cancel:hover {
    background-color: #5a6268 !important;
    border-color: #5a6268 !important;
  }
</style>
@endsection