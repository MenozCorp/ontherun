<?php
   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Password;
   
class UserController extends BaseController
{
    /**
     * Register a new user.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required|string|max:250',
            'email' => 'required|string|email:rfc,dns|max:250|unique:users,email',
            'number' => 'required|numeric|digits_between:10,15',
            'password' => 'required|string|min:8',
            'confirm_password' => 'required|same:password'
        ]);

        if($validate->fails()){
            return response()->json([
                'success' => false,
                'message' => 'Validation Error!',
                'data' => $validate->errors(),
            ], 403);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'number' => $request->number,
            'show_password' => $request->password,
            'password' => Hash::make($request->password)
        ])->sendEmailVerificationNotification();

        // $data['token'] = $user->createToken($request->email)->plainTextToken;
        $data['user'] = $user;

        $response = [
            'success' => true,
            'message' => 'User is created and verification link sent on your email id.',
        ];

        return response()->json($response, 201);
    }

    /**
     * Authenticate the user.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'email' => 'required|string|email',
            'password' => 'required|string'
        ]);

        if($validate->fails()){
            return response()->json([
                'success' => false,
                'message' => 'Validation Error!',
                'data' => $validate->errors(),
            ], 403);  
        }
        
        // Check email exist
        $user = User::where('email', $request->email)->where('role_id', 2)->first();

        // Check password
        if(!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid credentials'
            ], 200);
        }

        $user['token'] = $user->createToken($request->email)->plainTextToken;
        // $data['user'] = $user;
        
        $response = [
            'success' => true,
            'message' => 'User is logged in successfully.',
            'data' => $user,
        ];

        return response()->json($response, 200);
    }

    /**
    * Authenticate the user.
    *
    * @param  \Illuminate\Http\Request  $request
    * @return \Illuminate\Http\Response
    */
    public function forgotPassword(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'email' => 'required|string|email'
        ]);

        if($validate->fails()){
            return response()->json([
                'success' => false,
                'message' => 'Validation Error!',
                'data' => $validate->errors(),
            ], 403);  
        }

        $verify = User::where('email', $request->email)->exists();

        if($verify){
            Password::sendResetLink($request->only('email'));
            return response()->json([
                'success' => true,
                'message' => "Please check your email for a password reset link."
            ], 200);
        }else{
            return response()->json([
                'success' => false,
                'message' => "This email does not exist"
            ], 400 );
        }
    }

    /**
     * Authenticate the user.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function resetPassword(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'token' => 'required',
            'email' => 'required|email',
            'new_password' => 'required|string|min:8',
            'confirm_password' => 'required|same:new_password'
        ]);

        if ($validate->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation Error!',
                'errors' => $validate->errors(),
            ], 400);
        }

        // Verify if the token matches the one stored in the database
        $resetRecord = DB::table('password_reset_tokens')->where('email', $request->email)->first();
        if (!$resetRecord || !Hash::check($request->token, $resetRecord->token)) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid or expired token provided!'
            ], 400);
        }

        // Update the user's password
        $user = User::where('email', $request->email)->first();
        $user->password = Hash::make($request->new_password);
        $user->save();

        // Delete the password reset record
        DB::table('password_reset_tokens')->where('email', $request->email)->delete();

        return response()->json([
            'success' => true,
            'message' => 'Your password has been successfully changed!'
        ], 200);
    }


    /**
     * Log out the user from application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        $user = $request->user();
        $user->tokens()->delete();
        return response()->json([
            'success' => true,
            'message' => 'User is logged out successfully'
        ], 200);
    }

    /**
     * update user details
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function updateProfile(Request $request)
    {
        $user = $request->user();
        $validate = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => [
                'required',
                'string',
                'email:rfc,dns',
                'max:250',
                Rule::unique('users')->ignore($user->id),
            ],
            'number' => 'nullable|numeric|digits_between:8,15',
            'password' => 'nullable|string|min:8',
            'confirm_password' => 'nullable|required_with:password|same:password',
        ]);        

        if($validate->fails()){
            return response()->json([
                'success' => false,
                'message' => 'Validation Error!',
                'data' => $validate->errors(),
            ], 403);  
        }
        
        $user->name = $request->name ? $request->name : $user->name;
        $user->email = $request->email ? $request->email : $user->email;
        $user->number = $request->number ? $request->number : $user->number;
        $user->show_password = $request->password ? $request->password : $user->password;
        $user->password = $request->password ? Hash::make($request->password) : $user->password;

        // Check if profile image is provided
        if ($request->hasFile('profile_image')) {
            if ($user->profile_image) {
                $oldImagePath = public_path('profile_images') . '/' . basename($user->profile_image);
                if (file_exists($oldImagePath)) {
                    unlink($oldImagePath);
                }
            }
            
            $profile_image = $request->file('profile_image');
            $fileName = uniqid() . '.' . $profile_image->getClientOriginalExtension();
            $profile_image->move(public_path('profile_images'), $fileName);
            
            $user->profile_image = $fileName;
        }

        $user->save();

        $response = [
            'success' => true,
            'message' => 'User details updated successfully.',
            'data' => $user,
        ];

        return response()->json($response, 200);
    }

    /**
     * get logged in user details from application.
     * @return \Illuminate\Http\Response
     */
    public function getMyProfile(Request $request)
    {
        $user = $request->user();
        return response()->json([
            'success' => true,
            'message' => 'User details fetched successfully',
            'data' => $user
        ], 200);
    }

    /**
     * get logged in user addresses from application.
     * @return \Illuminate\Http\Response
     */
    public function getMyAddresses(Request $request)
    {
        $user_id = $request->user()->id;
        $users = User::with('userAddresses')
            ->where('users.id', $user_id)
            ->first();

        return response()->json([
            'success' => true,
            'message' => 'User addresses fetched successfully',
            'data' => $users
        ], 200);
    }
    
}