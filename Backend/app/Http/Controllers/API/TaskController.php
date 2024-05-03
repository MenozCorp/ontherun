<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Task;
use App\Models\UserTask;

class TaskController extends Controller
{
    /**
     * get logged in user, all tasks
     * @return \Illuminate\Http\Response
     */
    public function getAllTasks(Request $request)
    {
        $tasks = Task::where('status', '!=', 2)->get();

        if ($tasks->isEmpty()) {
            return response()->json([
                'success' => true,
                'message' => 'No tasks found.',
                'data' => []
            ], 200);
        }

        return response()->json([
            'success' => true,
            'message' => 'Tasks retrieved successfully.',
            'data' => $tasks
        ], 200);
    }

    /**
     * get logged in user, task detail
     * @return \Illuminate\Http\Response
     */
    public function getTaskDetail(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'id' => 'required'
        ]);        

        if($validate->fails()){
            return response()->json([
                'success' => false,
                'message' => 'Validation Error!',
                'data' => $validate->errors(),
            ], 403);  
        }

        $task = Task::where('id', $request->id)->first();

        if($task) {
            return response()->json([
                'success' => true,
                'message' => 'Task details retrieved successfully.',
                'data' => $task
            ], 200);
        } else {
            return response()->json([
                'success' => true,
                'message' => 'Task not found.'
            ], 200);
        }
    }

    /**
     * get logged in user, task detail
     * @return \Illuminate\Http\Response
     */
    public function acceptOrCompleteTask(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'task_id' => 'required',
            'status' => 'required|in:0,1,2'
        ]);        
        
        if($validate->fails()){
            return response()->json([
                'success' => false,
                'message' => 'Validation Error!',
                'data' => $validate->errors(),
            ], 403);  
        }
        
        $task = Task::where('id', $request->task_id)->first();

        if($task) {
            if($request->status == 2){
                $task->status = $request->status;

                if($task->save()) {
                    UserTask::updateOrCreate(
                        ['user_id' => $request->user()->id, 'task_id' => $request->task_id],
                        ['status' => $request->status]
                    );                   

                    return response()->json([
                        'success' => true,
                        'message' => 'Task completed successfully.'
                    ], 200);
                } else {
                    return response()->json([
                        'success' => false,
                        'message' => 'Something went wrong!!!.'
                    ], 500);
                }
            } else if($request->status == 1) {
                $task->status = $request->status;

                if($task->save()) {
                    UserTask::updateOrCreate(
                        ['user_id' => $request->user()->id, 'task_id' => $request->task_id],
                        ['status' => $request->status]
                    );

                    return response()->json([
                        'success' => true,
                        'message' => 'Task accepted successfully.'
                    ], 200);
                } else {
                    return response()->json([
                        'success' => false,
                        'message' => 'Something went wrong!!!.'
                    ], 500);
                }

            } else {
                $task->status = $request->status;
                $task->save();

                $userTask = UserTask::where('user_id', $request->user()->id)
                    ->where('task_id', $request->task_id)
                    ->first();

                if ($userTask) {
                    $userTask->delete();
                }

                return response()->json([
                    'success' => true,
                    'message' => 'This task is available now for all users.'
                ], 200);
            }
        } else {
            return response()->json([
                'success' => true,
                'message' => 'Task not found.'
            ], 200);
        }
    }
}
