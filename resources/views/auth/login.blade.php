@extends('layouts.auth-layout')

@section('title', 'Login')

@section('auth-content')
    <div class="flex items-center justify-center mt-28">
        <div class="bg-white w-[24rem] rounded-xl shadow-sm border border-gray-100">
            <div class="flex items-center justify-center p-3 mt-4">
                <h2 class="text-2xl font-bold text-gray-800">Login to Continue</h2>
            </div>
            @if ($errors->any())
                <div class="py-2 px-10">
                    <div class="text-sm text-red-500 bg-red-100 p-2">
                        {{ $errors->first() }}
                    </div>
                </div>
            @endif
            <!-- From Uiverse.io by z7dev --> 
            <form method="POST" action="{{ route('user.login') }}">
                @csrf
                <div class="flex items-center justify-center p-3 mt-6">
                    <div class="relative">
                        <input id="email" name="email" type="email" placeholder="" class="w-58 md:w-64 text-sm py-2 border-b border-gray-300 py-1 focus:border-b-2 focus:border-blue-700 transition-colors focus:outline-none peer bg-inherit" required/>
                        <label for="email" class="absolute -top-4 text-xs left-0 cursor-text peer-focus:text-xs peer-focus:-top-4 transition-all peer-focus:text-blue-700 peer-placeholder-shown:top-1 peer-placeholder-shown:text-sm">
                            Email
                        </label>
                    </div>
                </div>
                <div class="flex items-center justify-center p-3 mt-3 ml-8">
                    <div class="relative">
                        <input id="password" name="password" type="password" placeholder="" class="w-58 md:w-64 text-sm py-2 border-b border-gray-300 py-1 focus:border-b-2 focus:border-blue-700 transition-colors focus:outline-none peer bg-inherit" required/>
                        <button type="button" id="show-password" class="rounded-xl px-1 hover:bg-gray-300">
                            <i id="eye-icon" class="fa-solid fa-eye-slash"></i>
                        </button>
                        <label for="password" class="absolute -top-4 text-xs left-0 cursor-text peer-focus:text-xs peer-focus:-top-4 transition-all peer-focus:text-blue-700 peer-placeholder-shown:top-1 peer-placeholder-shown:text-sm">
                            Password
                        </label>
                    </div>
                </div>
                <div class="flex items-center justify-between px-14 md:px-16">
                    <div class="flex justify-center">
                        <input type="checkbox" id="save-cred" name="save-cred">
                        <label for="save-cred" class="ml-2 text-xs text-gray-500">Remember me</label>
                    </div>
                    <a href="#" class="text-xs text-cyan-600">Forgot password?</a>
                </div>
                <div class="mt-6 flex items-center justify-center p-3 mb-6">
                    <div class="grid grid-cols-1">
                        <button type="submit" id="login-btn" class="bg-blue-500 rounded-lg shadow-md text-white text-md font-medium hover:bg-blue-400 px-20 py-2">Log In</button>
                        <div class="mt-1 flex items-center">
                            <span class="border-t border-gray-300 w-24"></span>
                            <span class="text-xs p-3">or</span>
                            <span class="border-t border-gray-300 w-24"></span>
                        </div>
                        <div class="items-center text-sm">
                            <span class="text-gray-600">Create Account.</span>
                            <a href="{{ route('register') }}" class="text-cyan-700 font-semibold text-underline ml-2">Sign up here</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@section('scripts')
<script>
    const showPassBtn = document.getElementById('show-password');
    const eyeIcon = document.getElementById('eye-icon');
    const passwordVal = document.getElementById('password');

    let passShow = false;

    showPassBtn.addEventListener('click', function () {
        passShow = !passShow;

        if(passShow) {
            eyeIcon.classList.remove('fa-eye-slash');
            eyeIcon.classList.add('fa-eye');
            passwordVal.setAttribute('type', 'text');
        } else {
            eyeIcon.classList.remove('fa-eye');
            eyeIcon.classList.add('fa-eye-slash');
            passwordVal.setAttribute('type', 'password');
        }
    });
</script>
@endsection