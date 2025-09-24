@extends('layouts.app')


@section('styles')
    <link rel="stylesheet" href="{{ asset('css/home-styles/style.css') }}">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
@endsection

@section('main-content')
    
    @include('components.head')

    <header class="bg-white shadow-sm border-b border-gray-200">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex flex-col sm:flex-row justify-start sm:justify-between sm:items-center py-6">
                <button onclick="window.location=`{{ route('links') }}`" class="bg-blue-600 hover:bg-blue-700 w-40 text-white px-4 py-2 rounded-md text font-medium transition-colors">
                    <i class="fa-solid fa-trowel-bricks mr-2"></i>Back to List
                </button>
                <h1 class="mt-4 mb-4 text-3xl font-bold text-gray-900">Short URL Analytics</h1>
                <div class="flex items-center space-x-4">
                    <!-- <select class="desktop-type border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <option>Last 7 days</option>
                        <option>Last 30 days</option>
                        <option>Last 90 days</option>
                        <option>Last 120 days</option>
                        <option>Last 240 days</option>
                        <option>Last 366 days</option>
                    </select> -->
                    <div class="desktop-type text-sm">
                        <div class="mt-3 md:mt-0">
                            <label for="start-date">Select Starting Date</label>
                            <input 
                                type="date" 
                                id="start-date" 
                                name="start-date"
                                class="ml-2 px-3 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                            >
                        </div>
                        <div class="mt-3">
                            <label for="end-date">Select End Date</label>
                            <input 
                                type="date" 
                                id="end-date" 
                                name="end-date"
                                class="ml-8 px-3 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                            >
                        </div>
                        <button 
                            type="button" 
                            class="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">
                            Filter
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div class="bg-white rounded-lg shadow-md overflow-hidden mb-10 px-6 py-4">
            <div>
                <p class="text-md font-medium text-gray-600">Link Name: </p>
                <p class="ml-4 text-lg font-medium text-gray-900">Parokya ni Edgar - Gitara || Fingerstyle Guitar Cover Performed by Janiño Abrenica</p>
                <p class="ml-4 text-sm font-sm text-gray-500 break-words">
                    <i class="fa-solid fa-link mr-1"></i>
                    https://www.facebook.com/share/r/19hsAqQMYK/jkhuyuihfiusgfiubiudfiobu/jiusdf
                </p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-8 mb-8">
                <div>
                    <p class="text-md font-medium text-gray-600">Short URL: </p>
                    <a target="_blank" class="mr-4 text font-medium text-indigo-600 hover:underline hover:decoration-indigo-500" href="http://127.0.0.1:8000/lsL2aB">
                        <i class="fa-solid fa-arrow-up-right-from-square mr-2"></i>
                        http://127.0.0.1:8000/E3oYgG
                    </a>
                </div>
                <div>
                    <p class="text-md font-medium text-gray-600">Date Created: </p>
                    <p class="ml-4 text font-medium text-gray-600"><i class="fa-solid fa-calendar mr-2"></i>09/12/2025</p>
                </div>
                <div>
                    <p class="text-md font-medium text-gray-600">Expiry Date: </p>
                    <p class="ml-4 text font-medium text-gray-600"><i class="fa-solid fa-calendar-week mr-2"></i>10/12/2025</p>
                </div>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-8 sm:gap-20 mt-8 mb-8">
                <div class="bg-gradient-to-r from-blue-100 via-blue-200 to-blue-300 rounded-lg shadow-md p-6">
                    <p class="text-lg font-medium text-gray-600">Total Clicks: </p>
                    <p class="ml-10 text-3xl font-medium text-blue-600"><i class="fa-solid fa-arrow-pointer mr-8"></i>25</p>
                </div>
                <div class="bg-gradient-to-r from-indigo-100 via-indigo-200 to-indigo-300 rounded-lg shadow-md p-6">
                    <p class="text-lg font-medium text-gray-600">Clicks today: </p>
                    <p class="ml-10 text-3xl font-medium text-indigo-600"><i class="fa-solid fa-clock mr-8"></i>5</p>
                </div>
            </div>
        </div>

        <div class="bg-white rounded-lg shadow-md overflow-hidden mb-10">
            <div class="px-6 py-4 border-b border-gray-200">
                <h2 class="text-xl font-semibold text-gray-900">Recent Clicks</h2>
            </div>
            <div class="overflow-auto h-96">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Timestamp</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">IP Address</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">User  Agent</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Referrer</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Location</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2023-10-15 14:32</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">192.168.1.1</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Chrome on Windows</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">google.com</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">United States</td>
                        </tr>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2023-10-15 14:32</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">192.168.1.1</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Chrome on Windows</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">google.com</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">United States</td>
                        </tr>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2023-10-15 14:32</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">192.168.1.1</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Chrome on Windows</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">google.com</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">United States</td>
                        </tr>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2023-10-15 14:32</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">192.168.1.1</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Chrome on Windows</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">google.com</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">United States</td>
                        </tr>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2023-10-15 14:32</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">192.168.1.1</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Chrome on Windows</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">google.com</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">United States</td>
                        </tr>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2023-10-15 14:32</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">192.168.1.1</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Chrome on Windows</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">google.com</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">United States</td>
                        </tr>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2023-10-15 13:45</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">10.0.0.5</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Safari on iOS</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">twitter.com</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">United Kingdom</td>
                        </tr>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2023-10-15 12:20</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">172.16.0.2</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Firefox on macOS</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Direct</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Canada</td>
                        </tr>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2023-10-15 11:55</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">203.0.113.1</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Edge on Windows</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">facebook.com</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Australia</td>
                        </tr>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2023-10-15 10:30</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">198.51.100.3</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Chrome on Android</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">email.com</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">India</td>
                        </tr>
                    </tbody>
                </table>
                @include('components.pagination')
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
        
            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-xl font-semibold text-gray-900 mb-4">Clicks Over Time (Last 30 Days)</h2>
                <canvas id="clicksChart" width="400" height="300"></canvas>
            </div>

            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-xl font-semibold text-gray-900 mb-4">Device Breakdown</h2>
                <canvas id="deviceChart" width="100" height="100"></canvas>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
            
            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-xl font-semibold text-gray-900 mb-4">Geographic Distribution</h2>
                <canvas id="geoChart" width="400" height="200"></canvas>
            </div>

            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-xl font-semibold text-gray-900 mb-4">Top Referrers</h2>
                <ul class="space-y-2">
                    <li class="flex justify-between items-center p-3 bg-gray-50 rounded-md">
                        <span class="text-gray-900 font-medium">Google</span>
                        <span class="text-gray-600">320 clicks</span>
                    </li>
                    <li class="flex justify-between items-center p-3 bg-gray-50 rounded-md">
                        <span class="text-gray-900 font-medium">Twitter</span>
                        <span class="text-gray-600">210 clicks</span>
                    </li>
                    <li class="flex justify-between items-center p-3 bg-gray-50 rounded-md">
                        <span class="text-gray-900 font-medium">Facebook</span>
                        <span class="text-gray-600">150 clicks</span>
                    </li>
                    <li class="flex justify-between items-center p-3 bg-gray-50 rounded-md">
                        <span class="text-gray-900 font-medium">Direct</span>
                        <span class="text-gray-600">120 clicks</span>
                    </li>
                    <li class="flex justify-between items-center p-3 bg-gray-50 rounded-md">
                        <span class="text-gray-900 font-medium">Email</span>
                        <span class="text-gray-600">80 clicks</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    @include('components.footer')

    <script>
        const ctx1 = document.getElementById('clicksChart').getContext('2d');
        new Chart(ctx1, {
            type: 'line',
            data: {
                labels: ['Day 1', 'Day 5', 'Day 10', 'Day 15', 'Day 20', 'Day 25', 'Day 30'],
                datasets: [{
                    label: 'Clicks',
                    data: [65, 120, 80, 150, 200, 180, 234],
                    borderColor: 'rgb(59, 130, 246)',
                    backgroundColor: 'rgba(59, 130, 246, 0.1)',
                    tension: 0.4,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        const ctx2 = document.getElementById('deviceChart').getContext('2d');
        new Chart(ctx2, {
            type: 'doughnut',
            data: {
                labels: ['Mobile', 'Desktop', 'Tablet'],
                datasets: [{
                    data: [60, 30, 10],
                    backgroundColor: ['rgb(34, 197, 94)', 'rgb(59, 130, 246)', 'rgb(251, 191, 36)']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true
            }
        });

        const ctx3 = document.getElementById('geoChart').getContext('2d');
        new Chart(ctx3, {
            type: 'pie',
            data: {
                labels: ['United States', 'Europe', 'Asia', 'Other'],
                datasets: [{
                    data: [50, 30, 15, 5],
                    backgroundColor: ['rgb(59, 130, 246)', 'rgb(16, 185, 129)', 'rgb(245, 158, 11)', 'rgb(239, 68, 68)']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true
            }
        });

        const paginationBord = document.getElementById('paginationBorder');
        paginationBord.classList.add('hidden');
    </script>
@endsection
