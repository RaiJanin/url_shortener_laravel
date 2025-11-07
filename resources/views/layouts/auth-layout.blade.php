<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    @include('includes.vendor-incl')
    @yield('styles')
</head>
<body class="bg-gray-50 text-gray-600">
    <div class="grid grid-cols-3 gap-2">
        <div class="col-span-3 md:hidden">
            <div class="flex justify-start mt-2 ml-3">
                <h1 class="text-3xl font-bold text-indigo-500">Shorter</h1>
            </div>
        </div>
        <div class="col-span-3 md:col-span-2 p-4">
            @yield('auth-content')
        </div>
        <div class="md:flex hidden justify-end p-6 mt-2 mr-4">
            <h1 class="text-3xl font-bold text-indigo-500">Shorter</h1>
        </div>
    </div>
    @yield('scripts')
</body>
</html>