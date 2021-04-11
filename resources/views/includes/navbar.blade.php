    <!-- Topbar -->
    <nav x-data="{ open: false }" class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
        </button>

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">


        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="mr-2 d-none d-lg-inline text-gray-600 small">{{ Auth::user()->nama }}</span> <!-- {Auth::user()->name}}  -->
            <img class="img-profile rounded-circle" src="{{ Auth::user()->profile_photo_url }}" alt="{{ Auth::user()->nama }}"> <!-- {Auth::user()->name}}  -->
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
            </a>
            <a class="dropdown-item" href="#">
                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                Settings
            </a>
            <a class="dropdown-item" href="{{ route('profile.show') }}">
                <i class="fas fa-user-circle fa-sm fa-fw mr-2 text-gray-400"></i>
                {{ __('Profile') }}
            </a>
            @if (Laravel\Jetstream\Jetstream::hasApiFeatures())
            <a class="dropdown-item" href="{{ route('api-tokens.index') }}">
                {{ __('API Tokens') }}
            </a>
            @endif
            
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                Logout
            </a>
            </div>
        </li>

        </ul>

    </nav>
    <!-- End of Topbar -->
