<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use App\Models\User;
use App\Models\Task;

class AdminController extends Controller
{
    /**
     * Authenticate the user.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'email' => 'required|max:255|email',
            'password' => 'required|min:8'
        ]);
   
        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            if ($user->role_id == 1) {
                return redirect()->intended('dashboard')->with( 'success_msg' , 'You have Successfully logged in' );
            } else {
                // Redirect users with other role IDs to a different page
                return redirect('/')->with('error_msg', 'Oppes! You have entered invalid credentials');
            }
        }
  
        return redirect('/')->with('error_msg', 'Oppes! You have entered invalid credentials');
    }

    /**
     * Display a dashboard to authenticated users.
     *
     * @return \Illuminate\Http\Response
     */
    public function dashboard()
    {
        $data['totalTask'] = Task::count();
        $data['totalUser'] = User::where('role_id', 2)->count();
        return view('admin.dashboard', $data);
    }

    public function logout()
    {
        Session::flush();
        session()->forget('admin_info');
        return redirect('/');
    }
    
    public function getProfile(){
        return view('admin.profile');
    }

    public function editProfile(){
        return view('admin.edit_profile');
    }


    public function updateProfile(Request $request){
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . Auth::id(),
            'number' => 'required'
            // Add more validation rules for other fields if needed
        ]);
    
        // Update the user's profile information
        $userId = Auth::id();
        $user = User::find($userId);
        $user->name = $request->name;
        $user->role_id = '1';
        $user->email = $request->email;
        $user->number = $request->number;
        
        if ($request->hasFile('profile_image')) {
            if ($user->profile_image) {
                $oldImagePath = public_path('profile_images') . '/' . basename($user->profile_image);
                if (file_exists($oldImagePath)) {
                    unlink($oldImagePath);
                }
            }
            
            // Upload the new profile image
            $profile_image = $request->file('profile_image');
            $fileName = uniqid() . '.' . $profile_image->getClientOriginalExtension();
            $profile_image->move(public_path('profile_images'), $fileName);
            
            $user->profile_image = $fileName;
        }
        
        // Update other fields as needed
    
        if ($user->save()) {
            Session::flash('message', 'Profile Updated Succesfully !');
            Session::flash('alert-class', 'success');
            return redirect('get-profile');
        } else {
            Session::flash('message', 'Oops !! Something went wrong!');
            Session::flash('alert-class', 'error');
            return redirect()->back();
        }
    }

    public function changePassword(){
        return view('admin.update_password');
    }

    public function updatePassword(Request $request){
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'current_password' => 'required',
            'password' => 'required',
        ]);
        
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }
        
        // Check if the user is authenticated
        if (Auth::check()) {
            // $user = Auth::user();
            $user = User::find(Auth::id());
            // Verify current password
            if (Hash::check($request->current_password, $user->password)) {
                $user->password = Hash::make($request->password);
                $user->show_password = $request->password;
                $user->save();
                
                Session::flash('message', 'Password Changed Succesfully !');
                Session::flash('alert-class', 'success');
                return redirect()->back();
            } else {
                Session::flash('message', 'Oops !! Something went wrong!');
                Session::flash('alert-class', 'error');
                return redirect()->back();
            }
        } else {
            // Redirect with error message
            return redirect()->back()->withErrors(['current_password' => 'Authentication error.'])->withInput();
        }
    }
}
