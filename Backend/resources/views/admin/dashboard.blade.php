@extends('admin.layouts.app')

@section('content')          

            <!-- Main Content Area -->
            <div class="main-content introduction-farm">
                <div class="content-wraper-area">
                    <div class="dashboard-area">
                        <div class="container-fluid">
                            <div class="row g-4">
                                <div class="col-12">
                                    @if(Session::has('error_msg'))
                                        <div class="alert alert-danger"> {{ Session::get('error_msg') }} </div>
                                    @endif
                        
                                    @if (Session::has('success_msg'))
                                        <div class="alert alert-success"> {{ Session::get('success_msg') }} </div>
                                    @endif
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="dashboard-header-title">
                                            <h5 class="mb-0">Welcome Back!</h5>
                                            <!--<p class="mb-0">You have earns <span class="text-success">${{ $totalTodaySales ?? '0' }}</span> today.-->
                                            </p>
                                        </div>

                                    
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-6 col-xxl-6">
                                    <div class="card ">
                                        <div class="card-body" >
                                            <div
                                                class="single-widget d-flex align-items-center justify-content-center">
                                                <div>
                                                    <div class="widget-icon mx-auto">
                                                        <lord-icon
                                                            src="https://cdn.lordicon.com/taymdfsf.json"
                                                            trigger="loop"
                                                            delay="2000"
                                                            style="width:50px;height:50px">
                                                        </lord-icon>
                                                    </div>
                                                    <div class="widget-desc">
                                                        <h3 class="text-center">{{ $totalTask ?? '0' }}</h3>
                                                        <h5><a href="{{url('list-task');}}">Total Tasks</a></h5>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-6 col-xxl-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <div
                                                class="single-widget d-flex align-items-center justify-content-center">
                                                <div>
                                                    <div class="widget-icon mx-auto">
                                                        <lord-icon
                                                            src="https://cdn.lordicon.com/piwupaqb.json"
                                                            trigger="loop"
                                                            style="width:50px;height:50px">
                                                        </lord-icon>
                                                    </div>
                                                    <div class="widget-desc">
                                                        <h3 class="text-center">{{ $totalUser ?? '0' }}</h3>
                                                        <h5><a href="{{url('list-user');}}">All Users</a></h5>
                                                       
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
@endsection