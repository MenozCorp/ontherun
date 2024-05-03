<!-- Sidemenu Area -->
<div class="flapt-sidemenu-wrapper">
    <!-- Desktop Logo -->
    <div class="flapt-logo">
        <a href="{{url('dashboard')}}"><img class="desktop-logo" src="{{asset('/public/admin/img/core-img/logo.png')}}" alt="Desktop Logo"> <img class="small-logo" src="{{asset('/public/admin/img/core-img/logo.png')}}" alt="Mobile Logo"></a>
        <h4>
            <!-- {{config('app.name')}} -->
        </h4>
    </div>

    <!-- Side Nav -->
    <div class="flapt-sidenav" id="flaptSideNav">
        <!-- Side Menu Area -->
        <div class="side-menu-area">
            <!-- Sidebar Menu -->
            <nav>
                <ul id="ct_sidebar" class="sidebar-menu" data-widget="tree">
                    <li class="menu-header-title {{ request()->is('dashboard') ? 'active' : '' }} ps-0"> <a href="{{url('dashboard')}}">Dashboard</a></li>
                    <li class="menu-header-title {{ request()->is('list-user','add-user', 'edit-user/*') ? 'active' : '' }} ps-0"> <a href="{{url('list-user')}}">Users</a></li>
                    <li class="menu-header-title {{ request()->is('list-task','add-task', 'edit-task/*') ? 'active' : '' }} ps-0"> <a href="{{url('list-task')}}">Tasks</a></li>
                </ul>

            </nav>
        </div>
    </div>
</div>