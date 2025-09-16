<script>
document.addEventListener('DOMContentLoaded', function () {
    const refreshBtn = document.getElementById('refreshBtn');
    const searchBtn = document.getElementById('search-btn');

    const confirmationModal = document.getElementById('confirmationModal');
    const confirmBtn = document.getElementById('confirmBtn');
    const cancelBtn = document.getElementById('cancelBtn');

    const cardContainer = document.getElementById('card-container');
    const searchIn = document.getElementById('search');
    const sortSelect = document.getElementById('sort');
    const paginationDiv = document.getElementById('pagination');
    const urlDetailsModal = document.getElementById('urlDetailsModal');
    const closeModalBtn = document.getElementById('closeModalBtn');
    const copyBtn = document.querySelector('.copy-btn');

    const urlName = document.getElementById('url-name');
    const urlShort = document.getElementById('url-short');
    const urlLong = document.getElementById('url-long');
    const urlCreated = document.getElementById('url-created');
    const urlClicks = document.getElementById('url-clicks');
    const urlExpires = document.getElementById('url-expires');

    let currentUrlId = null;
    let allUrls = [];
    let filteredUrls = [];

    async function loadSavedUrls(page = 1) {
        

        cardContainer.innerHTML = `
                <?php include BASE_PATH_TRANS. 'src/assets/ui/loading.html';?>
            `;

        try {
            const formData = new FormData();
            formData.append("page", page);
            formData.append("search", searchIn.value);
            formData.append("sort", sortSelect.value.toLowerCase().replace(" ",""));

            const response = await fetch('../src/api/loadAll.php', {
                method: "POST",
                body: formData
            });
            const raw = await response.text();
            let result;

            try {
                result = JSON.parse(raw);
            } catch {
                throw new Error('Invalid JSON from Server');
            }

            if (result.error) {
                throw new Error(result.error);
            }

            if (result.stats) {
                document.getElementById("totalUrls").textContent = result.stats.total_urls;
                document.getElementById("totalClicks").textContent = result.stats.total_clicks;
                document.getElementById("todayClicks").textContent = result.stats.clicks_today;
                document.getElementById("expiringSoon").textContent = result.stats.expiring_soon;
            }

            if (result.data.length === 0 && result.has_data === false) {
                paginationDiv.classList.add('hidden');
                cardContainer.innerHTML = `
                    <div class="col-span-full w-full" style="text-align:center; ">
                        <?php include BASE_PATH_TRANS. 'src/assets/ui/zero-dat.html';?>
                    </div>`;
                showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>${result.message}`);
                return;
            }

            cardContainer.innerHTML = '';
            cardContainer.innerHTML = result.data.map(url => {

                
            
                let exBadge = "";
                let clkMsg = "";
                if(url.expires_at == null && url.expire_warning == false) {
                    exBadge = `<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-blue-800 mt-2">
                                    Expires on: Never
                                </span>`;
                } else 
                if(!url.expire_warning) {
                    exBadge = `<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800 mt-2">
                                    Expires on: ${formatDate(url.expires_at)}
                                </span>`;
                } else 
                if(url.expire_warning) {
                    exBadge = `<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-orange-100 text-orange-800 mt-2">
                                    Expires on: ${formatDate(url.expires_at)}
                                </span>`;
                }

                if(url.clicks == 0) {
                    clkMsg = `<div class="text-m font-medium text-gray-900 mt-2">No Click Logs</div>`;
                } else {
                    clkMsg = `<div class="text-m font-medium text-gray-900 mt-2">${url.clicks} clicks</div>`;
                }
            
                return `
                <div>
                    <div class="bg-white shadow-md rounded-lg p-4 transition duration-200 ease-in-out hover:shadow-lg">
                        <div class="flex items-center justify-between">
                            <div class="text-lg font-medium text-gray-900 truncate w-80">${url.url_name}</div>
                        </div>
                        <div class="text-sm text-gray-900 truncate w-60">${url.long_url}</div>
                        <div class="text-sm font-medium text-indigo-600">${url.short_url}</div>
                        ${clkMsg}
                        <!--<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800 mt-2">
                            Expires on: ${url.expires_at}
                        </span>-->
                        ${exBadge}
                        <div class="flex items-center space-x-2 mt-4">
                            <button class="copy-url-btn text-xs sm:text-base bg-blue-100 text-gray-600 px-2 sm:px-4 py-2 rounded-lg font-medium hover:bg-blue-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" data-url="${url.short_url}">
                                <i class="fas fa-copy mr-2"></i>Copy
                            </button>
                            <button class="show-details-btn text-xs sm:text-base bg-gray-100 text-gray-600 px-2 sm:px-4 py-2 rounded-lg font-medium hover:bg-gray-200" data-url-id="${url.id}">
                                <i class="fas fa-chart-bar mr-2"></i>Details
                            </button>
                            <button class="edit-url-btn text-xs sm:text-base bg-gray-100 text-gray-600 px-2 sm:px-4 py-2 rounded-lg font-medium hover:bg-gray-200" data-url-id="${url.id}">
                                <i class="fas fa-edit mr-2"></i>Edit
                            </button>
                            <button class="delete-btn text-xs sm:text-base bg-red-100 text-red-600 px-2 sm:px-4 py-2 rounded-lg font-medium hover:bg-red-200" data-url-id="${url.id}">
                                <i class="fas fa-trash mr-2"></i>Delete
                            </button>
                        </div>
                    </div>
                </div>
            `}).join('');

            addEventListeners();

            paginationDiv.classList.remove('hidden');
            paginationDiv.innerHTML = '';
            paginationDiv.innerHTML = handlePagination(result.page, result.totalPages, result.perPage, result.total);
            
        } catch (error) {
            console.error(error);
            paginationDiv.classList.add('hidden');
            cardContainer.innerHTML = `
                    <div class="col-span-full w-full" style="text-align:center; ">
                        <?php include BASE_PATH_TRANS. 'src/assets/ui/error-dat.html';?>
                    </div>
                    `;

            const retryBtn = document.getElementById("retryBtn");

            retryBtn.addEventListener("click", () => {
                loadSavedUrls(page);
            });
            showNotification('<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>Failed to load URLs.');
        }
    }

    <?php include BASE_PATH_TRANS. 'src/assets/js/pagination.js';?>

    function addEventListeners() {

        document.querySelectorAll('.copy-url-btn').forEach(button => {
            button.addEventListener('click', function (e) {
                e.preventDefault();
                const urlToCopy = this.getAttribute('data-url');
                navigator.clipboard.writeText(urlToCopy).then(() => {
                    showNotification('<i class="fa-solid fa-paperclip w-10" style="color: green;"></i>URL copied to clipboard!');
                });
            });
        });

        document.querySelectorAll('.show-details-btn').forEach(button => {
            button.addEventListener('click', function () {
                currentUrlId = button.getAttribute('data-url-id');
                urlDetailsModal.classList.remove('hidden');
                document.body.style.overflow = 'hidden';
                console.log(currentUrlId);
                
                fetch('../src/api/lnkDetails.php', {
                    method : 'POST',
                    headers : {'Content-type': 'application/json'},
                    body : JSON.stringify({
                        urlId : currentUrlId
                    })
                }).then (async res => {
                    const text = await res.text();
                    try{
                        const data = JSON.parse(text);
                        if(!data.success) {
                            showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>${data.message}`);
                            return;
                        }

                        let clkMsg = "";
                        if(!data.has_click_logs) {
                            clkMsg = "No Click Logs Yet";
                        } else {
                            clkMsg = data.link_details.clicks;
                        }
                        console.log(data);

                        let expiryDate = "";
                        if(data.link_details.expiry_date == null) {
                            expiryDate = "Never";
                        } else {
                            expiryDate = formatDate(data.link_details.expiry_date);
                        }

                        urlName.value = data.link_details.web_name;
                        urlShort.value = data.link_details.short_url;
                        urlLong.value = data.link_details.long_url;
                        urlCreated.value = formatDate(data.link_details.created_at);
                        urlClicks.value = clkMsg;
                        urlExpires.value = expiryDate;

                        copyBtn.setAttribute('data-url', data.link_details.short_url);

                        copyBtn.addEventListener('click', function (e) {
                            e.preventDefault();
                            const urlToCopy = this.getAttribute('data-url');
                            navigator.clipboard.writeText(urlToCopy).then(() => {
                                showNotification('<i class="fa-solid fa-paperclip w-10" style="color: green;"></i>URL copied to clipboard!');
                            });
                        });

                    } catch(err) {
                        console.error(err);
                    }

                }).catch(error => {
                    console.error("Network or fetch error:", error);
                    showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i> Unable to reach server.`);
                }).finally(() => {
                        // disable loading ui
                });
            });
        });

        document.querySelectorAll('.edit-url-btn').forEach(button => {
            button.addEventListener('click', function () {
                currentUrlId = button.getAttribute('data-url-id');
            });
        });

        document.querySelectorAll('.delete-btn').forEach(button => {
            button.addEventListener('click', function () {
                currentUrlId = button.getAttribute('data-url-id');
                showConfirmationModal("Confirm Delete?", "Are you sure you want to delete this URL?", () => {
                    deleteUrl(currentUrlId);
                });
            });
        });
        
    }

    function formatDate(dateStr) {
        if (!dateStr) return null; 
        let d = new Date(dateStr);
        let month = String(d.getMonth() + 1).padStart(2, '0');
        let day = String(d.getDate()).padStart(2, '0');
        let year = d.getFullYear();
        return `${month}/${day}/${year}`;
    }

    function deleteUrl(urlId) { //delete functionality move inside the event listener
        // Implement the delete URL functionality here
        console.log(`Deleting URL with ID: ${urlId}`);
        // After deletion, refresh the URL list
        loadSavedUrls();
    }

    closeModalBtn.addEventListener('click', () => {
        urlName.value = '';
        urlShort.value = '';
        urlLong.value = '';
        urlClicks.value = '';
        urlCreated.value = '';
        urlExpires.value = '';

        copyBtn.setAttribute('data-url', '');
        urlDetailsModal.classList.add('hidden');
        document.body.style.overflow = 'auto';
    })

    refreshBtn.addEventListener('click', () => {
        loadSavedUrls();
    });

    searchBtn.addEventListener('click', () => {
        loadSavedUrls();
    });

    sortSelect.addEventListener('change', () => {
        loadSavedUrls();
    });


    loadSavedUrls(1);
    window.loadSavedUrls = loadSavedUrls;
});
</script>