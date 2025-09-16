@extends('layouts.app')

@section('route-links')
<script>
    window.appRoutes = {
        createUrl: "{{ route('url.createLink') }}",
        savedUrls: "{{ route('url.savedUrls') }}"
    };
</script>
@endsection

@section('styles')
    <link rel="stylesheet" href="{{ asset('css/home-styles/style.css') }}">
@endsection

@section('main-content')
    <main class="main-content">
    
    @include('components.head')

        <div class="header-container text-lg">
            <div class="flex justify-end mr-px">
                <button id="savedUrlsBtn" class="px-8 py-4 bg-blue-500 text-white hover:bg-blue-600 transition">
                    Saved URLs
                </button>
            </div>
        </div>

        <div class="container mx-auto px-4 py-12">
            <div class="max-w-2xl mx-auto bg-white rounded-lg shadow-lg overflow-hidden">
                <div class="p-6">
                    <h2 class="text-xl font-semibold mb-4">Create Short URL</h2>
                    <div class="mb-6">
                        <div class="relative">
                            <label for="urlInput" class="block text-sm font-medium text-gray-700 mb-1">Paste Url Here: </label>
                            <input type="url" id="urlInput" placeholder="Paste your long URL here (e.g. https://www.example.com)" 
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg url-input text-gray-700">
                        </div>
                        <p id="errorMessageURL" class="text-red-500 text-sm hidden">Please enter a valid URL (e.g., https://example.com)</p>
                    </div>
                    <div class="relative mb-4">
                        <label for="urlName" class="block text-sm font-medium text-gray-700 mb-1">Short URL Name:</label>
                        <input type="text" id="urlName" placeholder="Name this link (e.g., Project Docs, Blog, etc.)"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg url-input text-gray-700">
                    </div>
                    <p id="errorMessageName" class="text-red-500 text-sm hidden"></p>
                    <div class="flex flex-col md:flex-row gap-4">
                        <div class="flex-1">
                            <label for="customAlias" class="block text-sm font-medium text-gray-700 mb-1">Custom alias (optional)</label>
                            <div class="relative">
                                <input type="text" id="customAlias" placeholder="mycmlk" maxlength="6"
                                    class="w-full px-4 py-2 border border-gray-300 rounded-lg url-input text-gray-700">
                                <div class="absolute top-0 right-0 mt-2 mr-3 text-xs text-gray-500">
                                    <span id="charCount"></span> 
                                </div>
                            </div>
                        </div>
                        <div class="flex-1" id="expiry-select">
                            <label for="expiryDate" class="block text-sm font-medium text-gray-700 mb-1">Expires after (optional)</label>
                            <select id="expiryDate" class="w-full px-4 py-2 border border-gray-300 rounded-lg url-input text-gray-700">
                                <option value="none">Never</option>
                                <option value="1d">1 day</option>
                                <option value="7d">7 days</option>
                                <option value="30d">30 days</option>
                            </select>
                        </div>
                    </div>

                    <button id="shortenBtn" class="w-full mt-6 py-3 px-4 bg-gradient-to-r from-blue-500 to-purple-600 text-white font-semibold rounded-lg btn-primary">
                        <svg id="shortenLoading" class="flex items-center w-5 h-5 animate-spin hidden" fill="none" viewBox="0 0 24 24">
                            <circle class="opacity-25 w-10 h-10" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                            <path class="opacity-75" fill="currentColor"
                                d="M4 12a8 8 0 018-8v4a4 4 0 00-4 4H4z"></path>
                        </svg>
                        <span id="shortenText">Shorten URL</span>
                    </button>
                </div>
            </div>

            <div id="resultContainer" class="max-w-2xl mx-auto mt-8 bg-white rounded-lg shadow p-6 hidden">
                <h3 class="text-xl font-semibold text-gray-800 mb-4">Your Shorter URL is ready!</h3>
                <div class="flex flex-col sm:flex-row gap-2">
                    <input type="text" id="shortUrl" readonly 
                        class="flex-1 px-4 py-2 border border-gray-300 rounded-lg bg-gray-50 text-purple-600 font-medium">
                    <button id="copyBtn" class="px-4 py-2 bg-blue-500 text-white font-semibold rounded-lg hover:bg-blue-600 transition">
                        Copy
                    </button>
                </div>
                <div class="mt-4 flex items-center justify-between">
                    <div>
                        <span class="text-sm text-gray-500">Original URL:</span>
                        <span id="originalUrl" class="text-sm text-gray-700 ml-2 overflow-hidden overflow-ellipsis"></span>
                        <div id="customNameWrapper" class="mt-4">
                            <span class="text-sm text-gray-500"><strong>Name: </strong></span>
                            <span id="shrturlnm" class="text-sm text-gray-700 ml-2"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="container mx-auto px-4 mb-10">
            <div class="flex flex-col md:flex-row justify-between">
                <div class="mb-6 md:mb-0">
                    <div class="flex items-center">
                        <h3 class="text-lg font-semibold">Shorter</h3>
                    </div>
                    <p class="mt-2 text-gray-400 max-w-md">Transform Long Links into Short, Shareable URLs with Shorter.</p>
                </div>
            </div>
            <div class="border-t border-gray-700 mt-8 pt-8 text-sm text-gray-400">
                <div class="flex flex-col md:flex-row justify-between items-center">
                    <p>© 2025 Shorter. All rights reserved.</p>
                    <!-- <div class="flex space-x-6 mt-4 md:mt-0">
                        <a href="#" class="hover:text-white">Terms</a>
                        <a href="#" class="hover:text-white">Privacy</a>
                        <a href="#" class="hover:text-white">About</a>
                    </div> -->
                </div>
            </div>
        </footer>
    </main>

    <div id="savedUrlsSidebar" class="fixed top-0 right-0 w-80 h-full bg-white shadow-lg transform translate-x-full transition-transform duration-300 z-50">
        <button id="closeSidebarBtn" class="text-white hover:text-gray-300 fixed">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
        </button>
        <div class="p-6">
            <div class="flex fixed justify-between items-center mb-6">
                <h3 class="text-xl font-semibold ml-10">Saved URLs</h3>
            </div>
            <div id="savedUrlsTable" class="space-y-4 mt-10 table-text">
                <table class="min-w-full divide-y divide-gray-200" id="savedUrlsTable">
                    <thead>
                        <!--Table headers-->
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                            <!-- Data from the server displays here-->
                    </tbody>
                </table>
            </div>
        </div>
        @include('components.pagination')
    </div>
    
    <div id="urlModal" class="modal">
        <div class="modal-content">
            <div class="close-btn-container mb-5">
                <button class="closeModal">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
            </div>
            <div class="modal-head mt-5">
                <h2><strong>Original Link</strong></h2>
            </div>
            <div class="modal-text mt-8 pt-8 pb-10 border-t border-gray-700">
                <h2 id="modalUrlName" class="text-lg font-semibold"></h2>
                <p id="modalOriginalUrl" class="text-gray-700 break-all max-h-40 overflow-y-auto"></p>
            </div>
        </div>
    </div>
@endsection

@section('jscripts')
    <script src="{{ asset('js/home-js/jscript.js') }}"></script>
    @include('includes.scripts')
@endsection