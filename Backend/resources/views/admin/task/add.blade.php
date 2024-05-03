@extends('admin.layouts.app')
@section('content')

<!-- Main Content Area -->
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
                                <div
                                    class="card-title border-bootom-none mb-30 d-flex align-items-center justify-content-between">
                                    <h3 class="mb-0 ct_fs_22">Add Task</h3>
                                    <a href="{{url('list-task')}}" > <button class="ct_custom_btn1 mx-auto"> Back to List </button> </a>
                                </div>
                                <form action="{{url('save-task')}}" method="POST" id="addTask" enctype="multipart/form-data">
                                        @csrf
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group mb-3">
                                                <label for="" class="mb-2">Task Name</label>
                                                <input type="text" class="form-control" name="name" placeholder="Task Name" value="{{ old('name')}}">
                                                @error('name')
                                                    <div class="text text-danger mt-2">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group mb-3">
                                                <label for="" class="mb-2">Description</label>
                                                <textarea rows="4" class="form-control ckeditor" name="description" id="description" placeholder="Description">{{ old('description')}}</textarea>
                                                @error('description')
                                                    <div class="text text-danger mt-2">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group mb-3">
                                                <label for="" class="mb-2">Address</label>
                                                <input type="text" class="form-control" name="address" placeholder="Address" value="{{ old('address')}}" id="address">
                                                <div id="address-error" class="error-message error mt-2"></div>
                                                @error('address')
                                                    <div class="text text-danger mt-2">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label for="" class="mb-2">Latitude</label>
                                                <input type="text" class="form-control" name="latitude" placeholder="Latitude" value="{{ old('latitude')}}" id="latitude" readonly>
                                                @error('latitude')
                                                    <div class="text text-danger mt-2">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label for="" class="mb-2">Longitude</label>
                                                <input type="text" class="form-control" name="longitude" placeholder="Longitude" value="{{ old('longitude')}}"  id="longitude" readonly>
                                                @error('longitude')
                                                    <div class="text text-danger mt-2">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center mt-4">
                                        <button type="submit" class="ct_custom_btn1 mx-auto">Save</button>
                                    </div>  
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('script')
<script>
    $(document).ready(function () {
        // add coordinate using addresses
        var form = $('#addTask');
        form.validate({
            ignore: [],
            debug: false,
            rules: {
                name: {
                    required: true,
                },
                description: {
                    required: function() {
                        var editorData = CKEDITOR.instances.description.getData();
                        return editorData.trim() === '';
                    }
                },
                address: {
                    required: true,
                },
                latitude: {
                    required: true,
                    number: true,
                    range: [-90, 90]
                },
                longitude: {
                    required: true,
                    number: true,
                    range: [-180, 180]
                }
            },
            messages: {
                name: 'Please enter name.',
                description: 'Please enter task description.',
                address: 'Please enter address.',
                latitude: {
                    required: "Please enter latitude.",
                    number: "Latitude must be a number.",
                    range: "Latitude must be between -90 and 90 degrees."
                },
                longitude: {
                    required: "Please enter longitude.",
                    number: "Longitude must be a number.",
                    range: "Longitude must be between -180 and 180 degrees."
                }
            },
            errorPlacement: function(error, element) {
                if (element.attr("name") == "description") {
                    error.appendTo(element.parent());
                } else if (element.attr("name") == "address") {
                    error.appendTo($('#address').parent());
                } else {
                    error.insertAfter(element);
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });

        // Add coordinate using addresses and trigger validation on keyup
        $('#address').keyup(function() {
            var address = $(this).val().trim();
            var csrfToken = $('meta[name="csrf-token"]').attr('content');

            if (address === '') {
                // Clear latitude and longitude inputs
                $('#latitude').val('');
                $('#longitude').val('');
                $('#address-error').text('');
                return;
            }

            $.ajax({
                url: "{{url('get-coordinates')}}",
                method: 'POST',
                data: {
                    address: address
                },
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                success: function(response) {
                    // Check if latitude and longitude are valid
                    if (response.latitude && response.longitude) {
                        $('#latitude').val(response.latitude);
                        $('#longitude').val(response.longitude);
                        $('#address-error').text(''); // Clear error message
                    } else {
                        // Clear latitude and longitude inputs if retrieval failed
                        $('#latitude').val('');
                        $('#longitude').val('');
                    }
                },
                error: function(xhr, status, error) {
                    // Clear latitude and longitude inputs if retrieval failed
                    $('#latitude').val('');
                    $('#longitude').val('');
                    $('#address-error').text('Failed to retrieve latitude and longitude due to incorrect address');
                }
            });
        });
    });
</script>
@endsection