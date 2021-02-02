<x-app-layout>
    <x-slot name="header_content">
        <h1>{{ __('User') }}</h1>

        <div class="section-header-breadcrumb">
            <div class="breadcrumb-item active"><a href="{{ route('dashboard') }}">Dashboard</a></div>
            <div class="breadcrumb-item">
                <a href="{{ route('barangjurusan.index') }}" class="font-bold">User
                </a>
            </div>
        </div>
    </x-slot>
    <div class="p-8 pt-4 mt-2 bg-white">
        

        <!-- untuk input search -->

        <div class="row">
            <div class="table-responsive">
                <table class="table table-bordered table-striped text-sm text-gray-600 text-center">
                    <thead>
                        <tr>
                            <th>
                                NIM / NIP
                            </th>
                            <th>
                                Nama Pengguna
                            </th>
                            <th>
                                Email
                            </th>
                            <th>
                                Tanggal dibuat
                            </th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($items as $item)
                        <tr>
                            <td>{{ $item->no_induk }}</td>
                            <td>{{ $item->name}}</td>
                            <td>{{ $item->email}}</td>
                            <td>{{ $item->created_at->format('d M Y')}}</td>
                            <td class="whitespace-no-wrap row-action--icon">
                                <a role="button" href="{{ url('user/' . $item->no_induk . '/edit') }}" class="mr-3">
                                    <i class="fa fa-16px fa-pen"></i>
                                </a>
                                <form action="{{ url('user', $item->id) }}" method="post" class="d-inline">
                                    @csrf
                                    @method('delete')
                                    <button>
                                        <i class="fa fa-16px fa-trash text-red-500"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="7" class="text-center">
                                Data tidak ada
                            </td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</x-app-layout>