<!DOCTYPE html>
<html lang="en">
   
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> On The Run Admin </title>
     
    <link rel="stylesheet" href="{{url('/adm-assets/vendors/mdi/css/materialdesignicons.min.css')}}">
    <link rel="stylesheet" href="{{url('/adm-assets/vendors/flag-icon-css/css/flag-icon.min.css')}}">
    <link rel="stylesheet" href="{{url('/adm-assets/vendors/css/vendor.bundle.base.css')}}">    
    <link rel="stylesheet" href="{{url('/adm-assets/css/style.css')}}">
    <link rel="shortcut icon" href="{{url('/adm-assets/images/favicon.png')}}" />
  </head>
  <style>
        div.dataTables_wrapper div.dataTables_length select {
            width: 58px;
            display: inline-block;
        }
    
        #password-strength-status, #reinsert-password-status {
            padding: 5px 10px;
            border-radius: 4px;
            margin-top: 5px;
        }
         
        .medium-password {
            background-color: #fd0;
        }
        
        .weak-password {
            background-color: #FBE1E1;
        }
        
        .strong-password {
            background-color: #D5F9D5;
        }
        
    </style>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <div class="" >
                  <img src="{{url('/logo/logo.png')}}" alt="logo" style="height: 100px;" /> 
                </div>
                <br>
                <h4> Forgot Password ! let's get started</h4>
                
                <form class="pt-3" action="{{url('/forgot-password-submit')}}" method="post">
                  @csrf

                    @if(Session::has('error_msg'))
                      <div class="alert alert-danger">{{ Session::get('error_msg')}}</div>
                    @endif   
                    
                    @if (Session::has('success_msg'))
                      <div class="alert alert-success">{{ Session::get('success_msg')}}</div>
                    @endif   
                   
                  <div class="form-group" >
                    <label for="exampleInputPassword4">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword4" placeholder="Password" name="password" onkeyup="checkPasswordStrength();" required >
                    <div id="password-strength-status" > </div>
                   
                    <label for="exampleInputPassword4">Re-insert Password</label>
                    <input type="password" class="form-control form-control-lg" id="re_password" placeholder="Re-insert Password" name="re_password" required >
                    <div id="reinsert-password-status" > </div>
                  </div>

                  <div class="mt-3">
                    <button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" >UPDATE</button>
                  </div>
                  <div class="my-2 d-flex justify-content-between align-items-center">
                    <div class="form-check"> 
                    
                    </div>
                    <a href="{{url('/admin-login')}}" class="auth-link text-black"> Back to Login </a>
                  </div>
                  
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="{{url('/adm-assets/vendors/js/vendor.bundle.base.js')}}"></script>
    <script src="{{url('/adm-assets/js/off-canvas.js')}}"></script>
    <script src="{{url('/adm-assets/js/hoverable-collapse.js')}}"></script>
    <script src="{{url('/adm-assets/js/misc.js')}}"></script>
    <!-- endinject -->
    <script>
      function checkPasswordStrength() {
        
        var number = /([0-9])/;
        var alphabets = /([a-zA-Z])/;
        var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
        var password = $('#exampleInputPassword4').val().trim();
        if (password.length < 6) {
          $('#password-strength-status').removeClass();
          $('#password-strength-status').addClass('weak-password');
          $('#password-strength-status').html("Weak (should be atleast 6 characters.)");
          $('.submitBtn').attr('disabled', 'disabled');
        } else {
          if (password.match(number) && password.match(alphabets) && password.match(special_characters)) {
            $('#password-strength-status').removeClass();
            $('#password-strength-status').addClass('strong-password');
            $('#password-strength-status').html("Strong");
            $('.submitBtn').prop("disabled", false);
          }
          else {
            $('#password-strength-status').removeClass();
            $('#password-strength-status').addClass('medium-password');
            $('#password-strength-status').html("Medium (should include alphabets, numbers and special characters.)");
                  $('.submitBtn').attr('disabled', 'disabled');
          }
        }
    }
    
    $('body').on('keyup','#re_password',function(){
      var pass = $('#exampleInputPassword4').val() ;
      var repass = $(this).val() ;
      
      if(pass != "" && repass != "" ) {
        if(pass != repass) {
            $('#reinsert-password-status').addClass('medium-password');
            $('#reinsert-password-status').html('Password does not match') ;   
        } else {
            $('#reinsert-password-status').removeClass();
            $('#reinsert-password-status').html('');
        }
      }
      
    }) ;

    </script>
  </body>
 
</html>