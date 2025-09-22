const paginationDiv = document.getElementById('pagination');
const paginationBord = document.getElementById('paginationBorder');

function handlePagination(pagination) {
    const currentPage = pagination.page;
    const totalPages  = pagination.totalPages;
    const perPage     = pagination.perPage;
    const total       = pagination.total;

    const maxVisible = 2;
    let start = Math.max(1, currentPage - Math.floor(maxVisible / 2));
    let end   = Math.min(totalPages, start + maxVisible - 1);

    if (end - start < maxVisible - 1) {
        start = Math.max(1, end - maxVisible + 1);
    }

    return `
        <div class="bg-white px-4 py-3 flex items-center justify-between sm:px-6">
            <div class="flex-2 gap-4 flex items-center justify-between">
                <div>
                <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
                    <!-- Prev button -->
                    <button onclick="loadSavedUrls(${Math.max(1, currentPage - 1)})"
                        class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                        <span class="sr-only">Previous</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                        </svg>
                    </button>

                    <!-- Page numbers -->
                    ${start > 1 ? `
                        <button onclick="loadSavedUrls(1)" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-3 py-2 border text-sm font-medium">1</button>
                        <span class="px-2 border border-gray-300 text-gray-500">...</span>
                    ` : ""}

                    ${Array.from({ length: end - start + 1 }, (_, i) => {
                        let page = start + i;
                        return `
                            <button onclick="loadSavedUrls(${page})"
                                class="${page === currentPage 
                                    ? 'z-10 bg-indigo-50 border-indigo-500 text-indigo-600' 
                                    : 'bg-white border-gray-300 text-gray-500 hover:bg-gray-50'} 
                                relative inline-flex items-center px-3 py-2 border text-sm font-medium">
                                ${page}
                            </button>
                        `;
                    }).join("")}

                    ${end < totalPages ? `
                        <span class="px-2 border border-gray-300 text-gray-500">...</span>
                        <button onclick="loadSavedUrls(${totalPages})" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-3 py-2 border text-sm font-medium">${totalPages}</button>
                    ` : ""}

                    <!-- Next button -->
                    <button onclick="loadSavedUrls(${Math.min(totalPages, currentPage + 1)})"
                        class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                        <span class="sr-only">Next</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                        </svg>
                    </button>
                </nav>
                <p class="text-sm text-gray-700">
                    Showing
                    <span class="font-medium">${(total === 0 ? 0 : ((currentPage - 1) * perPage) + 1)}</span>
                    to
                    <span class="font-medium">${(total === 0 ? 0 : Math.min(currentPage * perPage, total))}</span>
                    of
                    <span class="font-medium">${total}</span>
                    results
                </p>
                </div>
            </div>
        </div>
    `;
}
