@extends('layouts.app')


@section('styles')
    <link rel="stylesheet" href="{{ asset('css/home-styles/style.css') }}">
    <style>
        #clicksChart{
            max-height: 300px;
        }
        @media (max-width: 640px) {
            #clicksChart{
                max-height: 400px;
            } 
        }

        @media (min-width: 641px) and (max-width: 1024px) {
            #clicksChart {
                max-height: 360px;
            }
        }

        @media (min-width: 1025px) {
            #clicksChart {
                max-height: 340px;
            }
        }
    </style>
@endsection

@section('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll('[data-clicked-at]').forEach(cell => {
        const raw = cell.getAttribute('data-clicked-at');
        if (!raw) return;

        const dt = new Date(raw);
        const localTime = dt.toLocaleString('en-US', {
            timeZone: Intl.DateTimeFormat().resolvedOptions().timeZone,
            year: 'numeric', month: 'short', day: '2-digit',
            hour: 'numeric', minute: '2-digit', hour12: true
        });

        cell.textContent = localTime;
    });
});
</script>
@endsection

@section('main-content')
    
    @include('components.head')

    <header class="bg-white shadow-sm border-b border-gray-200">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex flex-col sm:flex-row justify-start sm:justify-between sm:items-center py-6">
                <h1 class="mt-4 mb-4 text-3xl font-bold text-gray-900">Short URL Analytics</h1>
                <button onclick="window.location=`{{ route('links') }}`" class="bg-blue-600 hover:bg-blue-700 w-40 text-white px-4 py-2 rounded-md text font-medium transition-colors">
                    <i class="fa-solid fa-trowel-bricks mr-2"></i>Back to List
                </button>
            </div>
        </div>
    </header>

    <div class="max-w-7xl mx-auto px-4 sm:px-6">
        <div class="flex flex-col sm:flex-row justify-start sm:justify-between sm:items-center py-6">
            <div class="flex items-center">
                <div class="desktop-type text-sm mt-3 md:mt-0">
                    <form action="{{ route('url.logs') }}" method="GET" class="grid grid-cols-1 sm:grid-cols-4 gap-6 py-6">
                    <input type="hidden" name="url_id" value="{{ request('url_id') }}">
                    <div class="text-sm">
                        <label for="range"></label>
                        <select 
                            id="range" 
                            name="range"
                            class="px-3 py-2 border border-gray-300 rounded-lg shadow-sm"
                        >
                            <option value="7" {{ ($filters['range'] ?? 7) == 7 ? 'selected' : '' }}>Past 7 Days</option>
                            <option value="14" {{ ($filters['range'] ?? 7) == 14 ? 'selected' : '' }}>Past 14 Days</option>
                            <option value="30" {{ ($filters['range'] ?? 7) == 30 ? 'selected' : '' }}>Past 30 Days</option>
                            <option value="60" {{ ($filters['range'] ?? 7) == 60 ? 'selected' : '' }}>Past 60 Days</option>
                            <option value="120" {{ ($filters['range'] ?? 7) == 120 ? 'selected' : '' }}>Past 120 Days</option>
                            <option value="360" {{ ($filters['range'] ?? 7) == 360 ? 'selected' : '' }}>Past 360 Days</option>
                            <option value="all" {{ ($filters['range'] ?? 7) == 'all' ? 'selected' : '' }}>All dates</option>
                        </select>
                    </div>
                    <button 
                        type="submit" 
                        class="px-4 py-2 w-20 bg-blue-600 text-white text-sm font-medium rounded-lg shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">
                        Filter
                    </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div class="bg-white rounded-lg shadow-md overflow-hidden mb-10 px-6 py-4">
            <div>
                <p class="text-md font-medium text-gray-600">Link Name: </p>
                <p class="ml-4 text-lg font-medium text-gray-900">{{ $linkName }}</p>
                <p class="ml-4 text-sm font-sm text-gray-500 break-words">
                    <i class="fa-solid fa-link mr-1"></i>
                    {{ $OrigLink }}
                </p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-8 mb-8">
                <div>
                    <p class="text-md font-medium text-gray-600">Short URL: </p>
                    <a target="_blank" class="mr-4 text font-medium text-indigo-600 hover:underline hover:decoration-indigo-500" href="{{ $shortUrl }}">
                        <i class="fa-solid fa-arrow-up-right-from-square mr-2"></i>
                        {{ $shortUrl }}
                    </a>
                </div>
                <div>
                    <p class="text-md font-medium text-gray-600">Date Created: </p>
                    <p class="ml-4 text font-medium text-gray-600"><i class="fa-solid fa-calendar mr-2"></i>{{ $linkCreated }}</p>
                </div>
                <div>
                    <p class="text-md font-medium text-gray-600">Expiry Date: </p>
                    <p class="ml-4 text font-medium text-gray-600"><i class="fa-solid fa-calendar-week mr-2"></i>{{ $expiryDate }}</p>
                </div>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-8 sm:gap-20 mt-8 mb-8">
                <div class="bg-gradient-to-r from-blue-100 via-blue-200 to-blue-300 rounded-lg shadow-md p-6">
                    <p class="text-lg font-medium text-gray-600">Total Clicks: </p>
                    <p class="ml-10 text-3xl font-medium text-blue-600"><i class="fa-solid fa-arrow-pointer mr-8"></i>{{ $totalClicks }}</p>
                </div>
                <div class="bg-gradient-to-r from-indigo-100 via-indigo-200 to-indigo-300 rounded-lg shadow-md p-6">
                    <p class="text-lg font-medium text-gray-600">Clicks today: </p>
                    <p class="ml-10 text-3xl font-medium text-indigo-600"><i class="fa-solid fa-clock mr-8"></i>{{ $todayClicks }}</p>
                </div>
            </div>
        </div>

        @if(!$clickLogs->isEmpty())
        <div>
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
                <div class="bg-white rounded-lg shadow-md p-6 col-span-2">
                    <h2 class="text-xl font-semibold text-gray-900 mb-4">Clicks Over Time</h2>
                    <canvas id="clicksChart" width="300"></canvas>
                </div>

                <div class="bg-white rounded-lg shadow-md p-6">
                    <h2 class="text-xl font-semibold text-gray-900 mb-4">Device Breakdown</h2>
                    <div class="w-64 h-64 mx-auto">
                        <canvas id="deviceChart" width="100"></canvas>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
                <div class="bg-white rounded-lg shadow-md p-6">
                    <h2 class="text-xl font-semibold text-gray-900 mb-4">Geographic Distribution</h2>
                    <div class="w-full h-full mx-auto">
                        <canvas id="geoChart" width="400" height="200"></canvas>
                    </div>
                </div>

                <div class="bg-white rounded-lg shadow-md p-6">
                    <h2 class="text-xl font-semibold text-gray-900 mb-4">Top Referrers</h2>
                    <ul class="space-y-2">
                        @foreach($refferStats as $ref => $refCount)
                        <li class="flex justify-between items-center p-3 bg-gray-50 rounded-md">
                            <span class="text-gray-900 font-medium">{{ $ref ?? 'Direct' }}</span>
                            <span class="text-gray-600">{{ $refCount }}</span>
                        </li>
                        @endforeach
                    </ul>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-md overflow-hidden mb-10">
                <div class="px-6 py-4 border-b border-gray-200">
                    @php
                        if($LogsCount == 50){
                            $LogsCount = '50 (max)';
                        }else{
                            $LogsCount;
                        }
                    @endphp
                    <h2 class="text-xl font-semibold text-gray-900">Recent 50 Clicks <span class="text-sm font-small text-gray-500">(Showing: {{ $LogsCount }} entries)</span></h2>
                </div>
                <div class="overflow-auto max-h-96">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Timestamp</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Local Time</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Location</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Device</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Referrer</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Browser</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @foreach($clickLogs as $logData)
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900" data-clicked-at="{{ $logData['clickedAt'] }}"></td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    {{ 
                                        \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $logData['clickedAt'], 'UTC')
                                        ->setTimezone('Asia/Manila')
                                        ->format('M d, Y h:i A') 
                                    }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ $logData['location'] }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ $logData['device'] }} || {{ $logData['deviceType'] }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ $logData['referrer'] }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ $logData['source'] }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        @else
        <div class="bg-white rounded-lg shadow-md overflow-hidden mb-10">
            <div class="overflow-auto max-h-96">
                <div class="error-container">
                    <div class="no-data-icon">
                        <svg viewBox="0 0 24 24">
                            <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-2 10h-4v4h-2v-4H7v-2h4V7h2v4h4v2z"/>
                        </svg>
                    </div>
                    
                    <h2 class="error-title">Zero logs</h2>
                    <p class="error-message">No click logs yet for this date or no logs yet available</p>
                </div>
            </div>
        </div>
        @endif
    </div>

    @include('components.footer')

    <script>

        const dailyClicks = @json($dailyClicks);
        const deviceStats = @json($deviceStats);
        const geoStats = @json($geoStats);
        const referrerStats = @json($refferStats);

        const ctx1 = document.getElementById('clicksChart').getContext('2d');
        new Chart(ctx1, {
            type: 'line',
            data: {
                labels: dailyClicks.map(d => d.clickDate),
                datasets: [{
                    label: 'Clicks',
                    data: dailyClicks.map(d => d.dayTotal),
                    borderColor: 'rgb(59, 130, 246)',
                    backgroundColor: 'rgba(59, 130, 246, 0.1)',
                    tension: 0.4,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    },
                    x: {
                        reverse: true
                    }
                }
            }
        });

        const ctx2 = document.getElementById('deviceChart').getContext('2d');
        new Chart(ctx2, {
            type: 'doughnut',
            data: {
                labels: Object.keys(deviceStats),
                datasets: [{
                    data: Object.values(deviceStats),
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
            type: 'bar',
            data: {
                labels: Object.keys(geoStats),
                datasets: [{
                    data: Object.values(geoStats),
                    backgroundColor: [
                        'rgb(59, 130, 246)', 
                        'rgb(16, 185, 129)', 
                        'rgb(245, 158, 11)', 
                        'rgb(239, 68, 68)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                indexAxis: 'y',
                scales : {
                    y : {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    
@endsection
