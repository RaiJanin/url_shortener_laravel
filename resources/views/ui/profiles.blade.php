<div class="container mx-auto px-4 py-8 max-w-5xl">
    <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center md:text-left">Profile Settings</h1>
    
    <div class="bg-white rounded-lg shadow-md p-4 mb-8 animate-fade-in">
        <div class="flex flex-col md:flex-row items-center md:items-start">
            <div class="w-24 h-24 bg-gray-300 rounded-full mb-4 md:mb-0 md:mr-6 flex items-center justify-center">
                <svg class="w-12 h-12 text-gray-600" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path>
                </svg>
            </div>
            <div class="text-center md:text-left">
                <h2 class="text-2xl font-semibold text-gray-800">{{ auth()->user()->name }}</h2>
                <p class="text-gray-600">{{ auth()->user()->email }}</p>
                <p class="text-sm text-gray-500 mt-1">Member since {{ \Carbon\Carbon::parse(auth()->user()->created_at)->format('F Y') }}</p>
            </div>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow-md p-6 mb-8 animate-slide-up">
        <h3 class="text-xl font-semibold text-gray-800 mb-4">Change Name</h3>
        <form action="{{ route('user.nameUpdate') }}" method="post" class="space-y-4">
            @csrf
            @method('patch')
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <label for="Name" class="block text-sm font-medium text-gray-700">Name</label>
                    <input type="text" id="Name" name="Name" value="{{ auth()->user()->name }}" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                </div>
            </div>
            <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition duration-200">
                Update Name
            </button>
        </form>
    </div>

    <div class="bg-white rounded-lg shadow-md p-6 mb-8 animate-slide-up">
        <h3 class="text-xl font-semibold text-gray-800 mb-4">Change Email</h3>
        <form action="{{ route('user.emailUpdate') }}" method="post" class="space-y-4 max-w-xl">
            @csrf
            @method('patch')
            <div>
                <label for="currentEmail" class="block text-sm font-medium text-gray-700">Current Email</label>
                <input type="email" id="currentEmail" name="currentEmail" value="{{ auth()->user()->email }}" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm bg-gray-50 sm:text-sm" readonly>
            </div>
            <div>
                <label for="newEmail" class="block text-sm font-medium text-gray-700">New Email</label>
                <input type="email" id="newEmail" name="newEmail" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
            </div>
            <div>
                <label for="confirmEmail" class="block text-sm font-medium text-gray-700">Confirm New Email</label>
                <input type="email" id="confirmEmail" name="confirmEmail" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
            </div>
            <div>
                <label for="emailPassword" class="block text-sm font-medium text-gray-700">Current Password</label>
                <input type="password" id="emailPassword" name="emailPassword" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
            </div>
            <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition duration-200">
                Update Email
            </button>
        </form>
    </div>

    <div class="bg-white rounded-lg shadow-md p-6 mb-8 animate-slide-up">
        <h3 class="text-xl font-semibold text-gray-800 mb-4">Change Password</h3>
        <form action="{{ route('user.newPass') }}" method="post" class="space-y-4 max-w-xl">
            @csrf
            @method('patch')
            <div>
                <label for="currentPassword" class="block text-sm font-medium text-gray-700">Current Password</label>
                <input type="password" id="currentPassword" name="currentPassword" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                <button type="button" id="show-password" class="p-2 text-sm font-medium hover:text-gray-500">
                    Show password
                </button>
            </div>
            <div>
                <label for="newPassword" class="block text-sm font-medium text-gray-700">New Password</label>
                <input type="password" id="newPassword" name="newPassword" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
            </div>
            <div>
                <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Confirm New Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
            </div>
            <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition duration-200">
                Update Password
            </button>
        </form>
    </div>

    <div class="bg-white rounded-lg shadow-md p-6 mb-8 animate-slide-up">
        <h3 class="text-xl font-semibold text-red-600 mb-4">Terminate Account</h3>
        <p class="text-gray-700 mb-4">Permanently delete your account and all associated data. This action cannot be undone.</p>
        <button id="terminateBtn" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 transition duration-200">
            Terminate Account
        </button>
    </div>

    @include('components.terminate-finale')
</div>