@extends('admin.layouts.app')
@section('content')
<div class="main-content introduction-farm">
    <div class="content-wraper-area">
        <div class="dashboard-area">
            <div class="container-fluid">
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                @if(Session::has('error_msg'))
                                    <div class="alert alert-danger"> {{ Session::get('error_msg') }} </div>
                                @endif
                    
                                @if (Session::has('success_msg'))
                                    <div class="alert alert-success"> {{ Session::get('success_msg') }} </div>
                                @endif
                                <div class="card-title border-bootom-none mb-30 d-flex align-items-center justify-content-between">
                                    <h6 class="mb-0">All Tasks</h6>
                                    <a href="{{ url('add-task') }}">
                                        <button class="ct_custom_btn1 mx-auto">Add New Task</button>
                                    </a>
                                </div>
                                <table class="table task-data-table table-responsive table-bordered table-hover mb-0" id="taskTable">
                                    <thead>
                                        <tr>
                                            <th width="5%">No</th>
                                            <th width="20%">Name</th>
                                            <th width="55%">Description</th>
                                            <th width="10%">Status</th>
                                            <th width="10%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- geting this result from dataTable -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
     
<script type="text/javascript">
    $(function () {  
        var table = $('.task-data-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: "{{ url('list-task') }}",
            columns: [
                {data: 'serial_number', name: 'serial_number'},
                {data: 'name', name: 'name'},
                {data: 'description', name: 'description'},
                {data: 'status', name: 'status'},
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ],
            "columnDefs": [
                {
                    "targets": 2,
                    "render": function(data, type, row, meta) {
                        // Convert HTML to plain text
                        var plainText = $("<div/>").html(data).text();
                        return plainText;
                    }
                }
            ]
        });
        $('.task-data-table thead th').css({
            'font-weight': 'bold',
            'color': 'black'
        });
    });
</script>
<script>
    function deleteConfirm(id) {
        bootbox.confirm({
            message: "Are you sure you want to delete?",
            buttons: {
                cancel: { label: 'No', className: 'btn-danger' },
                confirm: { label: 'Yes', className: 'btn-success' }
            },
            callback: function(result) {
                if (result) {
                    $.ajax({
                        url: "{{ url('delete-task') }}",
                        type: "POST",
                        cache: false,
                        data: {
                            _token: '{{ csrf_token() }}',
                            id: id
                        },
                        success: function(response) {
                            if (response.error) {
                                toastr.error(response.error);
                            } else {
                                toastr.success(response.message);
                                $('#taskTable').DataTable().ajax.reload(null, false);
                            }
                        },
                        error: function(xhr, textStatus, errorThrown) {
                            if (xhr.status === 422) {
                                toastr.error(xhr.responseJSON.error);
                            } else if (xhr.status === 404) {
                                toastr.error(xhr.responseJSON.error);
                            } else {
                                toastr.error('An error occurred while processing your request.');
                            }
                        }

                    });
                }
            }
        });
    }

</script>
@endsection