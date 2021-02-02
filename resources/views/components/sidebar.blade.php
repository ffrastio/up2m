<div class="main-sidebar">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand py-4 px-4 mb-4">
            <a href="{{ route('dashboard') }}"><img src="{{ asset('assets/images/logo-siklab.png') }}" alt="Logo Siklab"></a>
        </div>
        <div class="sidebar-brand sidebar-brand-sm">
            <a href="{{ route('dashboard') }}">
                <img class="d-inline-block" width="32px" height="30.61px" src="{{ asset('assets/images/favicon.png') }}" alt="">
            </a>
        </div>
        <ul class="sidebar-menu">
            <li class="menu-header">Dashboard</li>
            <li>
                <a class="nav-link" href="{{ route('dashboard') }}"><i class="fas fa-fire"></i><span>Dashboard</span></a>
            </li>
            <li class="menu-header">Menu</li>
            <li>
                <a class="nav-link" href="#"><i class="fas fa-university"></i><span>Manajemen Ruangan</span></a>
            </li>
            <li>
                <a class="nav-link has-dropdown" href="#"><i class="fas fa-boxes"></i><span>Manajemen Barang</span></a>
                <ul class="dropdown-menu">
                    <li><a class="nav-link" href="#">Barang Ruangan</a></li>
                    <li><a class="nav-link" href="#">Barang Jurusan</a></li>
                </ul>
            </li>
            <li>
                <a class="nav-link" href="#"><i class="fas fa-handshake"></i><span>Peminjaman</span></a>
            </li>
            <li>
                <a class="nav-link" href="#"><i class="fas fa-tools"></i><span>Pelaporan Kerusakan</span></a>
            </li>
            <li class="menu-header">User</li>
            <li>
                <a href="{{ route('user.index') }}" class="nav-link" ><i class="fas fa-chart-bar"></i> <span>User</span></a>
            </li>
        </ul>
    </aside>
</div>