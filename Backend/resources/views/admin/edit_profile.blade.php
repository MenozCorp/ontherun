@extends('admin.layouts.app')

@section('content')          

            <!-- Main Content Area -->
        <div class="main-content introduction-farm">
            <div class="content-wraper-area">
                    <!-- Start Content-->
                    <div class="container-fluid">
                        <div class="row g-4">
                           

                            <div class="col-lg-8 mx-auto mt-5">
                                <div class="card main-profile-cover">
                                    
                                    <div class="card-body bg-white">
                                        <form action="{{url('update-profile')}}" method="post" id="profileForm" enctype="multipart/form-data">
                                            @csrf
                                        <div class="d-flex align-items-center justify-content-center">
                                            <h3 class="mb-4 ct_fs_22 text-center ">Edit Profile</h3>
                                            
                                        </div>
                                        <div class="d-sm-flex align-items-center mt-4">
                                            <div class="single-profile-image ct_profile_pic mx-auto">
                                                <label for="upload_img1" class="position-relative">
                                                    @if(auth()->user()->profile_image)
                                                    <img src="{{auth()->user()->profile_image}}" alt="">
                                                    @else
                                                    <img src="{{asset('admin/img/bg-img/person_1.jpg')}}" alt="">
                                                    @endif
                                                    <div class="ct_edit_img12">
                                                        <i class="fa fa-camera " aria-hidden="true"></i>
                                                    </div>
                                                    <input type="file" class="d-none" id="upload_img1" name="profile_image">
                                                </label>

                                            </div>                                           
                                        </div>
                                        <div class="mt-4">
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <div class="form-group">
                                                    <label for="" class="mb-2">Name</label>
                                                    <input type="text" class="form-control" name="name" value="{{auth()->user()->name}}">
                                                </div>
                                                @if($errors->has('name'))
                                                    <p class="text-danger">{{ $errors->first('name') }}</p>
                                                @endif
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <div class="form-group">
                                                    <label for="" class="mb-2">Email</label>
                                                    <input type="text" class="form-control" name="email" value="{{auth()->user()->email}}">
                                                </div>
                                                @if($errors->has('email'))
                                                    <p class="text-danger">{{ $errors->first('email') }}</p>
                                                @endif
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <div class="form-group">
                                                    <label for="" class="mb-2">Number</label>
                                                    <input type="number" class="form-control" name="number" value="{{auth()->user()->number}}">
                                                 </div>
                                            </div>
                                            @if($errors->has('number'))
                                            <p class="text-danger">{{ $errors->first('number') }}</p>
                                            @endif
                                        </div>
                                        <div class="text-center mt-4">
                                            <button type="submit" class="ct_custom_btn1 mx-auto">Save Changes</button>
                                        </div>
                                          
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
    $('#profileForm').validate({
      rules: {
        name: {
          required: true
        },
        email: {
          required: true,
          email: true
        },
        number: {
          required: true,
          rangelength: [10, 12],
          number: true
        }
      },
      messages: {
        name: 'Please enter Name.',
        email: {
          required: 'Please enter Email Address.',
          email: 'Please enter a valid Email Address.',
        },
        number: {
          required: 'Please enter Contact.',
          rangelength: 'Contact should be 10 digit number.'
        }
      },
      submitHandler: function (form) {
        form.submit();
      }
    });
  });
</script>

@endsection