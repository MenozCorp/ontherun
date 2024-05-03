<?php

namespace App\Http\Controllers\Admin;

use Yajra\DataTables\Facades\DataTables;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use App\Models\Task;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Task::latest();
            
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('serial_number', function($row) {
                    static $index = 0;
                    return ++$index;
                })
                ->addColumn('status', function($row) {
                    switch ($row->status) {
                        case 0:
                            return '<span style="color: blue;">Open</span>';
                            break;
                        case 1:
                            return '<span style="color: orange;">Accepted</span>';
                            break;
                        case 2:
                            return '<span style="color: green;">Completed</span>';
                            break;
                        default:
                            return '<span style="color: black;">Unknown</span>';
                            break;
                    }
                })
                ->filterColumn('status', function($query, $keyword) {
                    $query->whereRaw("CASE 
                        WHEN status = 0 THEN 'Open'
                        WHEN status = 1 THEN 'Accepted'
                        WHEN status = 2 THEN 'Completed'
                        ELSE 'Unknown'
                    END like ?", ["%{$keyword}%"]);
                })
                ->addColumn('action', function($row){
                    if($row->status != '2'){
                        $edit_btn = '<a href="' . url('edit-task/' . $row->id) . '">
                            <lord-icon data-bs-toggle="modal" data-bs-target="#ct_edit_product" src="https://cdn.lordicon.com/wuvorxbv.json" trigger="hover" colors="primary:#333333,secondary:#333333" style="width:20px;height:20px">
                            </lord-icon>
                        </a>';
                    }else{
                        $edit_btn = '';
                    }

                    $del_btn = '
                           <a href="javascript:;"  title="Delete" onclick="deleteConfirm('.$row->id.')">
                            <lord-icon src="https://cdn.lordicon.com/drxwpfop.json" trigger="hover" colors="primary:#ff0000,secondary:#ff0000" style="width:20px;height:20px">
                            </lord-icon>
                        </a>';
                    return '<div class="d-flex align-items-center">'.$edit_btn.'&nbsp;&nbsp;'.$del_btn.'</div>';
                })
                ->rawColumns(['status', 'action'])
                ->make(true);
        }
        
        return view('admin.task.list');
    }

    /**
     * Display a create of the resource.
     */
    public function create()
    {
        return view('admin.task.add');
    }

    /**
     * store the specified resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'description' => 'required',
            'address' => 'required',
            'latitude' => 'required|numeric|min:-90|max:90',
            'longitude' => 'required|numeric|min:-180|max:180',
        ], [
            'latitude.numeric' => 'Latitude must be a number.',
            'latitude.min' => 'Latitude must be between -90 and 90 degrees.',
            'latitude.max' => 'Latitude must be between -90 and 90 degrees.',
            'longitude.numeric' => 'Longitude must be a number.',
            'longitude.min' => 'Longitude must be between -180 and 180 degrees.',
            'longitude.max' => 'Longitude must be between -180 and 180 degrees.',
        ]);
    
        $task = new Task();
        $task->name = $request->name;
        $task->description = $request->description;
        $task->address = $request->address;
        $task->latitude = $request->latitude;
        $task->longitude = $request->longitude;
        
        if ($task->save()) {
            return redirect('list-task')->with( 'success_msg' , 'Task added successfully!!' );
        } else {
            return redirect('list-task')->with( 'error_msg' , 'Something went wrong!!' );
        }
    }

    /**
     * Display a edit of the resource.
     */
    public function edit($id)
    {
        $data['task'] = Task::where('id', $id)->where('status', '<>', '2')->first();
        return view('admin.task.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'description' => 'required',
            'address' => 'required',
            'latitude' => 'required|numeric|min:-90|max:90',
            'longitude' => 'required|numeric|min:-180|max:180',
        ], [
            'latitude.numeric' => 'Latitude must be a number.',
            'latitude.min' => 'Latitude must be between -90 and 90 degrees.',
            'latitude.max' => 'Latitude must be between -90 and 90 degrees.',
            'longitude.numeric' => 'Longitude must be a number.',
            'longitude.min' => 'Longitude must be between -180 and 180 degrees.',
            'longitude.max' => 'Longitude must be between -180 and 180 degrees.',
        ]);

        $id = $request->id;
        $task = Task::find($id);
        if (!$task) {
            return redirect('list-task')->with('error_msg', 'Task not found.');
        }
        $task->name = $request->name;
        $task->description = $request->description;
        $task->address = $request->address;
        $task->latitude = $request->latitude;
        $task->longitude = $request->longitude;
    
        if ($task->save()) {
            return redirect('list-task')->with('success_msg', 'Task updated successfully!');
        } else {
            return redirect('list-task')->with('error_msg', 'Something went wrong while updating task.');
        }
    }

    /**
     * Distory a record form the storage.
     */
    public function destroy(Request $request)
    {
        $task = Task::where('id',$request->id)->first();
        $task->delete();
        
        return response()->json(['success' => true, 'message' => 'Task deleted successfully.'], 200);
    }

    public function getCoordinates(Request $request)
    {
        $address = $request->input('address');
        $client = new Client();

        // Send a GET request to the Google Maps Geocoding API
        $response = $client->get('https://maps.googleapis.com/maps/api/geocode/json', [
            'query' => [
                'address' => $address,
                'key' => env('GOOGLE_MAP_API_KEY'),
            ],
        ]);
        
        $data = json_decode($response->getBody(), true);

        // Check if the response contains results
        if ($data['status'] === 'OK' && isset($data['results'][0]['geometry']['location'])) {
            // Extract latitude and longitude
            $latitude = $data['results'][0]['geometry']['location']['lat'];
            $longitude = $data['results'][0]['geometry']['location']['lng'];
            
            return response()->json([
                'latitude' => $latitude,
                'longitude' => $longitude
            ]);
        } else {
            return response()->json([
                'error' => 'Failed to retrieve latitude and longitude.'
            ], 400);
        }
    }
}
