@extends('layouts.app')


@section('route-links')

@endsection

@section('styles')

@endsection
@section('scripts')

@endsection

@section('main-content')
<div class="flex h-full">
    <div class="flex flex-col flex-1 overflow-hidden">
        @include('components.head')
        @include('components.account-head')

        <div class="mt-29">
            @if(request()->routeIs('account') && request('section') == 'profile')
                @include('ui.profiles')
            @endif
        </div>
        @include('components.footer')
    </div>
</div>
@endsection

@section('jscripts')
    <script src="{{ asset('js/account-js/jscript.js') }}"></script>
@endsection

