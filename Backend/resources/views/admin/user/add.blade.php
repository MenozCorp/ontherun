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
                                    <h3 class="mb-0 ct_fs_22">Add User</h3>
                                    <a href="{{url('list-user')}}" > <button class="ct_custom_btn1 mx-auto"> Back to List </button> </a>
                                </div>
                                <form action="{{url('save-user')}}" method="POST" id="addUser" enctype="multipart/form-data">
                                        @csrf
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group mb-3">
                                                <label for="" class="mb-2">Name</label>
                                                <input type="text" class="form-control" name="name" placeholder="Name" value="{{ old('name')}}">
                                                @error('name')
                                                    <div class="text text-danger mt-2">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group mb-3">
                                                <label for="" class="mb-2">Email</label>
                                                <input type="email" class="form-control" name="email" placeholder="Email" value="{{ old('email')}}">
                                                @error('email')
                                                    <div class="text text-danger mt-2">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group mb-3">
                                                <label for="" class="mb-2">Number</label>
                                                <input type="number" class="form-control" name="number" placeholder="Number" value="{{ old('number')}}">
                                                @error('number')
                                                    <div class="text text-danger mt-2">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group mb-3">
                                                <label for="" class="mb-2">Profile Image</label>
                                                <input type="file" class="form-control" name="profile_image" placeholder="Number" value="{{ old('number')}}">
                                                @error('profile_image')
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
    $('#addUser').validate({
      rules: {
        name: {
          required: true,
        },
        email: {
          required: true,
          email: true,
        },
        number: {
            required: true,
            minlength: 10,
            maxlength: 15,
        },
      },
      messages: {
        name: 'Please enter user name.',
        email: {
            required: "Please enter your email address.",
            email: "Please enter a valid email address.",
        },
        number: {
            required: 'Please enter user mobile number.',
            minlength: 'Mobile number must be at least 10 digits.',
            maxlength: 'Mobile number cannot exceed 15 digits.',
        },
      },
      
      submitHandler: function (form) {
        form.submit();
      }
    });
  });
</script>
@endsection