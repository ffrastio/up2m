<div class="main-sidebar">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="{{ route('dashboard') }}" class="font-bold text-xl">siir</a>
        </div>
        <div class="sidebar-brand sidebar-brand-sm">
            <a href="{{ route('dashboard') }}">
                <img class="d-inline-block" width="32px" height="30.61px" src="" alt="">
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
                    <li><a class="nav-link" href="{{ route('user') }}">Barang Ruangan</a></li>
                    <li><a class="nav-link" href="{{ route('barangjurusan.index') }}">Barang Jurusan</a></li>
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
                <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-chart-bar"></i> <span>User</span></a>
                <ul class="dropdown-menu">
                    <li><a class="nav-link" href="{{ route('user') }}">Data User</a></li>
                    <li><a class="nav-link" href="{{ route('user.new') }}">Buat User</a></li>
                </ul>
            </li>
        </ul>
    </aside>
</div>