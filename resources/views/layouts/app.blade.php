<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>SIKLAB - Sistem Inventaris Kelas dan Laboratorium</title>

    @isset($meta)
    {{ $meta }}
    @endisset

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans&family=Nunito:wght@400;600;700&family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('vendor/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('css/tailwind.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/components.css') }}">
    <link rel="stylesheet" href="{{ asset('vendor/notyf/notyf.min.css') }}">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="icon" href="{{ asset('assets/images/favicon.ico') }}" />

    <link rel="stylesheet" href="https://kit-free.fontawesome.com/releases/latest/css/free-v4-shims.min.css" media="all">
    <link rel="stylesheet" href="https://kit-free.fontawesome.com/releases/latest/css/free-v4-font-face.min.css" media="all">
    <link rel="stylesheet" href="https://kit-free.fontawesome.com/releases/latest/css/free.min.css" media="all">

    <livewire:styles />

    <!-- Scripts -->
    <script defer src="{{ asset('vendor/alpine.js') }}"></script>
</head>

<body class="antialiased">
    <div id="app">
        <div class="main-wrapper">
            @include('components.navbar')
            @include('components.sidebar')

            <!-- Main Content -->
            <div class="main-content">
                <section class="section">
                    <div class="section-header">
                        @isset($header_content)
                        {{ $header_content }}
                        @else
                        {{ __('Halaman') }}
                        @endisset
                    </div>

                    <div class="section-body">
                        {{ $slot }}
                    </div>
                </section>
            </div>
        </div>
    </div>

    @stack('modals')

    <!-- General JS Scripts -->
    <script src="{{ asset('assets/js/modules/jquery.min.js') }}"></script>
    <script defer async src="{{ asset('assets/js/modules/popper.js') }}"></script>
    <script defer async src="{{ asset('assets/js/modules/tooltip.js') }}"></script>
    <script src="{{ asset('assets/js/modules/bootstrap.min.js') }}"></script>
    <script defer src="{{ asset('assets/js/modules/jquery.nicescroll.min.js') }}"></script>
    <script defer src="{{ asset('assets/js/modules/moment.min.js') }}"></script>
    <script defer src="{{ asset('assets/js/modules/marked.min.js') }}"></script>
    <script defer src="{{ asset('vendor/notyf/notyf.min.js') }}"></script>
    <script defer src="{{ asset('vendor/sweetalert/sweetalert.min.js') }}"></script>
    <script defer src="{{ asset('assets/js/modules/chart.min.js') }}"></script>
    <script defer src="{{ asset('vendor/select2/select2.min.js') }}"></script>

    <script src="{{ asset('assets/js/stisla.js') }}"></script>
    <script src="{{ asset('assets/js/scripts.js') }}"></script>

    <livewire:scripts />
    <script src="{{ mix('js/app.js') }}" defer></script>

    @isset($script)
    {{ $script }}
    @endisset
</body>

</html>