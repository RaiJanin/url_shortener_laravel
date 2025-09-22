<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Shorter - URL Shortener</title>
    <link rel="icon" type="image/x-icon" href="{{ asset('icons/link.png') }}">
    @yield('route-links')
    @include ('includes.styles')
    @include ('includes.vendor-incl')
    @yield('styles')
</head>
<body class="min-h-screen bg-gray-50">
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    @yield('main-content')

    <div id="loading-template" class="hidden">
        @include('components.loading')
    </div>

    <div id="zero-dat" class="hidden">
        @include('components.zero-dat')
    </div>

    <div id="error-dat" class="hidden">
        @include('components.error-dat')
    </div>

    @include('components.cfFire')
    @include('components.noti')
</body>
    @include('includes.scripts')
    @yield('jscripts')