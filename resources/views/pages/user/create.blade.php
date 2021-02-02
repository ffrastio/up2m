<x-app-layout>
    <x-slot name="header_content">
        <h1>{{ __('Buat User Baru') }}</h1>

        <div class="section-header-breadcrumb">
            <div class="breadcrumb-item active"><a href="{{ route('dashboard') }}">Dashboard</a></div>
            <div class="breadcrumb-item"><a href="{{ route('user.index') }}">User</a></div>
            <div class="breadcrumb-item"><a href="{{ route('user.create') }}" class="font-bold">Buat User Baru</a></div>
        </div>
    </x-slot>

    <div class="p-8 pt-4 mt-2 bg-white">


        <form action="{{route('user.store')}}" method="POST">
            @csrf
            <div>
                <x-jet-label for="name" value="{{ __('Name') }}" />
                <x-jet-input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name')" required autofocus autocomplete="name" />
            </div>

            <div class="mt-4">
                <x-jet-label for="no_induk" value="{{ __('NIM / NIP') }}" />
                <x-jet-input id="no_induk" class="block mt-1 w-full" type="text" name="no_induk" :value="old('no_induk')" required />
            </div>

            <div class="mt-4">
                <x-jet-label for="email" value="{{ __('Email') }}" />
                <x-jet-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required />
            </div>

            <div class="mt-4">
                <x-jet-label for="password" value="{{ __('Password') }}" />
                <x-jet-input id="password" class="block mt-1 w-full" type="password" name="password" required autocomplete="new-password" />
            </div>

            <div class="mt-4">
                <x-jet-label for="password_confirmation" value="{{ __('Confirm Password') }}" />
                <x-jet-input id="password_confirmation" class="block mt-1 w-full" type="password" name="password_confirmation" required autocomplete="new-password" />
            </div>

            <div class=" flex items-center justify-end mt-4">
                <a href="{{route('user.index')}}" class="bg-gray-500 hover:bg-gray-700 text-white mr-4 font-bold py-2 px-4 rounded">Kembali</a>
            
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" type="submit">
                    Simpan
                </button>
            </div>
        </form>

    </div>

</x-app-layout>