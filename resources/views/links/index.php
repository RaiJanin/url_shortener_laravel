<?php 
require_once __DIR__. '/../src/utils/base-pth.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shorter - URL Shortener</title>
    <link rel="stylesheet" href="style.css">
    <?php include BASE_PATH_TRANS.'src/includes/vendor-incl.php';?>
    <?php include BASE_PATH_TRANS.'src/includes/styles.php';?>
</head>
<body class="min-h-screen">
    <div class="flex h-full">
        <div class="flex flex-col flex-1 overflow-hidden">
            
            <?php include BASE_PATH_TRANS. 'src/assets/ui/head.html';?>

            <div class="flex-1 overflow-auto h-full focus:outline-none">
                <div class="max-w-7xl mx-auto px-4 py-6 sm:px-6 lg:px-8">
   
                    <div class="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-4 mb-6">
                        <div class="bg-white overflow-hidden shadow rounded-lg">
                            <div class="px-4 py-5 sm:p-6">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0 bg-indigo-500 rounded-md px-4 pt-3 pb-3 text-white">
                                        <i class="fas fa-link"></i>
                                    </div>
                                    <div class="ml-5 w-0 flex-1">
                                        <dl>
                                            <dt class="text-sm font-medium text-gray-500 truncate">Total URLs</dt>
                                            <dd>
                                                <div class="text-lg font-medium text-gray-900" id="totalUrls"></div>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white overflow-hidden shadow rounded-lg">
                            <div class="px-4 py-5 sm:p-6">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0 bg-red-500 rounded-md px-4 pt-3 pb-3">
                                        <i class="fa-regular fa-clipboard text-white"></i>
                                    </div>
                                    <div class="ml-5 w-0 flex-1">
                                        <dl>
                                            <dt class="text-sm font-medium text-gray-500 truncate">Total Clicks</dt>
                                            <dd>
                                                <div class="text-lg font-medium text-gray-900" id="totalClicks"></div>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white overflow-hidden shadow rounded-lg">
                            <div class="px-4 py-5 sm:p-6">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0 bg-green-500 rounded-md p-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                        </svg>
                                    </div>
                                    <div class="ml-5 w-0 flex-1">
                                        <dl>
                                            <dt class="text-sm font-medium text-gray-500 truncate">Today's Clicks</dt>
                                            <dd>
                                                <div class="text-lg font-medium text-gray-900" id="todayClicks"></div>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white overflow-hidden shadow rounded-lg">
                            <div class="px-4 py-5 sm:p-6">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0 bg-yellow-500 rounded-md p-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                    </div>
                                    <div class="ml-5 w-0 flex-1">
                                        <dl>
                                            <dt class="text-sm font-medium text-gray-500 truncate">Expiring Soon</dt>
                                            <dt class="text-xs font-small text-gray-500 truncate">< 3 days</dt>
                                            <dd>
                                                <div class="text-lg font-medium text-gray-900" id="expiringSoon"></div>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
  
                    <div class="mb-6 bg-white rounded-lg shadow px-4 py-3">
                        <div class="flex flex-col md:flex-row md:items-center md:justify-between">
                            <div class="flex-1 mb-4 md:mb-0">
                                <div class="relative max-w-xs">
                                    <label for="search" class="sr-only">Search</label>
                                    <div class="relative flex items-center">
                                        <input type="text" id="search" class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-l-md leading-5 bg-white placeholder-gray-500 focus:outline-none focus:placeholder-gray-400 focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" placeholder="Search URLs...">
                                        <button class="bg-gray-200 text-gray rounded-r-md border border-gray-300 px-3 py-2 focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500" id="search-btn">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="flex items-center space-x-4">
                                <div>
                                    <label for="sort" class="sr-only">Sort by</label>
                                    <select id="sort" class="block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                        <option value="newest">Newest First</option>
                                        <option value="oldest">Oldest First</option>
                                        <option value="clicks">Most Clicks</option>
                                    </select>
                                </div>
                                <button type="button" id="refreshBtn" class="p-2 rounded-full text-gray-500 hover:text-indigo-600 hover:bg-indigo-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="bg-gray-50 shadow overflow-hidden sm:rounded-lg">
                        <div class="px-4 py-5 border-b border-gray-200 sm:px-6">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">Shortened URLs</h3>
                            <p class="mt-1 text-sm text-gray-500">All URLs shortened through your account</p>
                        </div>
                        <div class="bg-gray-100 overflow-hidden">
                            <div class="flex flex-col">
                                <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                                    <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                                        <div class="border-b border-gray-200">
                                            <div id="card-container" class="grid grid-cols-1 md:grid-cols-2 gap-2"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="pagination"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div id="urlDetailsModal" class="fixed z-10 inset-0 overflow-y-auto hidden">
        <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
            <div class="fixed inset-0 transition-opacity" aria-hidden="true">
                <div class="absolute inset-0 bg-gray-500 opacity-75"></div>
            </div>
            <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">​</span>
            <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-2xl sm:w-full">
                <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                    <div class="sm:flex sm:items-start">
                        <div class="mt-3 text-center sm:mt-0 sm:text-left w-full">
                            <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-title">URL Details</h3>
                            <div class="mt-5">
                                <div class="grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-2">
                                    <div>
                                        <label for="url-name" class="block text-sm font-medium text-gray-700">Name</label>
                                        <div class="mt-1">
                                            <input type="text" name="url-name" id="url-name" class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2 bg-gray-100" readonly>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <label for="url-short" class="block text-sm font-medium text-gray-700">Short URL</label>
                                        <div class="mt-1 flex items-center">
                                            <input type="text" name="url-short" id="url-short" class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2 bg-gray-100" readonly>
                                            <button class="ml-2 p-1 rounded-full border border-gray-300 text-gray-400 hover:text-indigo-600 hover:bg-indigo-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 copy-btn" data-url="https://shrt.in/abc123">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                    
                                    <div class="sm:col-span-2">
                                        <label for="url-long" class="block text-sm font-medium text-gray-700">Destination URL</label>
                                        <div class="mt-1">
                                            <input type="text" name="url-long" id="url-long" class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2 bg-gray-100" readonly>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <label for="url-clicks" class="block text-sm font-medium text-gray-700">Total Clicks</label>
                                        <div class="mt-1">
                                            <input type="text" name="url-clicks" id="url-clicks" class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2 bg-gray-100" readonly>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <label for="url-expires" class="block text-sm font-medium text-gray-700">Expires At</label>
                                        <div class="mt-1">
                                            <input type="text" name="url-expires" id="url-expires" class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2 bg-gray-100" readonly>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <label for="url-created" class="block text-sm font-medium text-gray-700">Created At</label>
                                        <div class="mt-1">
                                            <input type="text" name="url-created" id="url-created" class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2 bg-gray-100" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                    <button type="button" id="closeModalBtn" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-red-600 text-base font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm">
                        Close
                    </button>
                    <button type="button" class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm">
                        Edit URL
                    </button>
                    <button type="button" class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-indigo-600 text-white font-medium text-gray-700 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm">
                        View Click Logs
                    </button>
                </div>
            </div>
        </div>
    </div>

<?php include BASE_PATH_TRANS. 'src/assets/ui/cfFire.html';?>
<?php include BASE_PATH_TRANS. 'src/assets/ui/noti.html';?>
<?php include BASE_PATH_TRANS. 'src/includes/scripts.php';?>
<?php include 'jscript.php';?>