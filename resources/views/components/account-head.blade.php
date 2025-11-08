<nav class="bg-white shadow-md fixed top-17 w-full">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex items-center space-x-4">
                <div class="flex items-center space-x-2">
                    <svg class="w-5 h-5 text-green-500" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                    </svg>
                    <span class="text-[10px] md:text-sm font-medium text-gray-700">Current Plan: Beta - Full access</span>
                </div>
                <a href="{{ route('account', ['section' => 'profile']) }}" class="font-medium {{ request('section') == 'profile' ? 'text-indigo-600 rounded-md border border-gray-500 px-3 py-1 hover:text-indigo-900' : 'text-gray-600 hover:text-gray-900' }}">Profile</a>
                <!-- <a href="{{ route('account', ['section' => 'billing']) }}" class="font-medium {{ request('section') == 'billing' ? 'text-indigo-600 rounded-md border border-gray-500 px-3 py-1 hover:text-indigo-900' : 'text-gray-600 hover:text-gray-900' }}">Billing</a> -->
            </div>
        </div>
    </div>
</nav>