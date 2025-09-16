<div class="header gradient-bg">
    <div class="navbar container mx-auto flex justify-between items-center py-4">
        <button class="mobile-menu-btn text-white">☰</button>
        <a href="{{ url('/s-app') }}" class="logo text-white text-2xl font-bold">Shorter</a>
        <ul class="nav-links flex gap-6">
            <li>
                <a href="{{ route('home') }}" class="nav-link text-white">
                    <i class="fas fa-home"></i>
                    <span>Home</span>
                </a>
            </li>
            <li>
                <a href="{{ route('links') }}" class="nav-link text-white">
                    <i class="fas fa-link"></i>
                    <span>Manage Links</span>
                </a>
            </li>
            <li>
                <a href="{{ route('account') }}" class="nav-link text-white">
                    <i class="fas fa-user-circle"></i>
                    <span>Account</span>
                </a>
            </li>
        </ul>
        <div class="relative">
            <!-- User Button -->
            <button type="button" class="flex items-center gap-2 focus:outline-none" id="user-menu-button">
                <span class="text-white text-sm font-medium" id="account_name"></span>
                <div class="user-avatar bg-white text-blue-500 rounded-full w-10 h-10 flex items-center justify-center font-bold shadow-sm transition-transform duration-200 hover:scale-105 cursor-pointer">U</div>
            </button>
            
            <!-- Dropdown Menu -->
            <div id="user-dropdown" class="dropdown-transition hidden origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none z-10">
                <div class="px-4 py-3 border-b border-gray-100">
                    <p class="text-sm font-medium text-gray-900">Signed in as</p>
                    <p class="text-sm text-gray-500 truncate" id="dropdown-email"></p>
                </div>
                <!-- <div class="pt-1 pb-1">
                    <a href="#" class="dropdown-item block px-4 py-2 text-sm text-gray-700">Your Profile</a>
                    <a href="#" class="dropdown-item block px-4 py-2 text-sm text-gray-700">Settings</a>
                    <a href="#" class="dropdown-item block px-4 py-2 text-sm text-gray-700">Notifications <span class="ml-1 bg-blue-100 text-blue-800 text-xs font-medium px-2 py-0.5 rounded-full">3 new</span></a>
                </div> -->
                <div class="pt-1 border-t border-gray-100">
                    <button class="dropdown-item block px-4 py-2 text-sm text-gray-700" id="logout-button">Sign out</button>
                </div>
            </div>
        </div>
    </div>
</div>
