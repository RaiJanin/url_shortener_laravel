document.addEventListener('DOMContentLoaded', function () {

    const refreshBtn = document.getElementById('refreshBtn');
    const searchBtn = document.getElementById('search-btn');

    const cardContainer = document.getElementById('card-container');
    const searchIn = document.getElementById('search');
    const sortSelect = document.getElementById('sort');

    const loadingOverlay = document.getElementById('loadingOverlay');
    const urlDetailsModal = document.getElementById('urlDetailsModal');
    const closeModalBtn = document.getElementById('closeModalBtn');
    const urlName = document.getElementById('url-name');
    const urlShort = document.getElementById('url-short');
    const urlLong = document.getElementById('url-long');
    const urlCreated = document.getElementById('url-created');
    const urlClicks = document.getElementById('url-clicks');
    const urlExpires = document.getElementById('url-expires');

    const copyBtn = document.querySelector('.copy-btn');

    const editUrlBtn = document.querySelector('.edit-url-btn-sin');
    const viewLogsBtn = document.querySelector('.view-url-logs');

    const loadingOverlayUpM = document.getElementById('loadingOverlayUpM');
    const urlUpdateModal = document.getElementById('urlUpdateModal');
    const updateUrlBtn = document.getElementById('updateUrlBtn');
    const updateCancelBtn = document.getElementById('closeModalCancel');
    const urlNameUpdt = document.getElementById('url-nameUpdate');
    const urlDomain = document.getElementById('url-domain');
    const urlbackHalf = document.getElementById('url-backHalf');
    const origUrl = document.getElementById('url-long-prev');
    
    const errorUpdateUrl = document.getElementById('errorUpdateURL');

    let currentUrlId = null;

    paginationBord.classList.add('hidden'); // always hide

    async function loadSavedUrls(page = 1) {
        
        cardContainer.innerHTML = `
                ${document.getElementById('loading-template').innerHTML}
            `;

        try {
            
            const searchValue = searchIn.value;
            const sortSelectValue = sortSelect.value.toLowerCase().replace(" ","");
            
            const response = await fetch(`${window.appRoutes.loadAllUrls}?page=${page}&search=${searchValue}&sort=${sortSelectValue}`, {
                method: "GET",
                headers: {"Accept" : "application/json"}
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
                document.getElementById("totalUrls").textContent = result.stats.totalUrls;
                document.getElementById("totalClicks").textContent = result.stats.totalClicks;
                document.getElementById("todayClicks").textContent = result.stats.clicksToday;
                document.getElementById("expiringSoon").textContent = result.stats.expiringSoon;
            }

            if (!result.hasData) {
                paginationDiv.classList.add('hidden');
                cardContainer.innerHTML = `
                    <div class="col-span-full w-full" style="text-align:center; ">
                        ${document.getElementById('zero-dat').innerHTML}
                    </div>`;
                showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>${result.message}`);
                return;
            }

            cardContainer.innerHTML = '';
            cardContainer.innerHTML = result.data.map(url => {

                let exBadge = "";
                let clkMsg = "";
                if(url.expiresAt == null && url.expireWarning == false) {
                    exBadge = `<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-blue-800 mt-2">
                                    Expires on: Never
                                </span>`;
                } else 
                if(!url.expireWarning) {
                    exBadge = `<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800 mt-2">
                                    Expires on: ${formatDate(url.expiresAt)}
                                </span>`;
                } else 
                if(url.expireWarning) {
                    exBadge = `<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-orange-100 text-orange-800 mt-2">
                                    Expires on: ${formatDate(url.expiresAt)}
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
                            <div class="text-lg font-medium text-gray-900 truncate w-80">${url.urlName}</div>
                        </div>
                        <div class="text-sm text-gray-900 truncate w-60">${url.longUrl}</div>
                        <div class="text-sm font-medium text-indigo-600">${url.shortUrl}</div>
                        ${clkMsg}
                        <!--<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800 mt-2">
                            Expires on: ${url.expiresAt}
                        </span>-->
                        ${exBadge}
                        <div class="flex items-center space-x-2 mt-4">
                            <button class="copy-url-btn text-xs sm:text-base bg-blue-100 text-gray-600 px-2 sm:px-4 py-2 rounded-lg font-medium hover:bg-blue-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" data-url="${url.shortUrl}">
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
            paginationDiv.innerHTML = handlePagination(result);
            
        } catch (error) {
            console.error(error);
            paginationDiv.classList.add('hidden');
            cardContainer.innerHTML = `
                    <div class="col-span-full w-full" style="text-align:center; ">
                        ${document.getElementById('error-dat').innerHTML}
                    </div>
                    `;

            const retryBtn = document.getElementById("retryBtn");

            retryBtn.addEventListener("click", () => {
                loadSavedUrls(page);
            });
            showNotification('<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>Failed to load URLs.');
        }
    }

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
                showLinkDetails(currentUrlId);
            });
        });

        document.querySelectorAll('.edit-url-btn').forEach(button => {
            button.onclick = function () {
                currentUrlId = button.getAttribute('data-url-id');
                urlUpdateModal.classList.remove('hidden');
                loadingOverlayUpM.classList.remove('hidden');
                console.log("Edit URL Mode ID (queryAll): "+currentUrlId);
                editUrl(currentUrlId);
            };
        });

        document.querySelectorAll('.delete-btn').forEach(button => {
            button.onclick = function () {
                currentUrlId = button.getAttribute('data-url-id');
                showConfirmationModal("Confirm Delete?", "Are you sure you want to delete this URL?", () => {
                    deleteUrl(currentUrlId, this);
                });
            };
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

    function showLinkDetails(sID) {
        urlDetailsModal.classList.remove('hidden');
        document.body.style.overflow = 'hidden';
        loadingOverlay.classList.remove('hidden');

        fetch(`${window.appRoutes.urlLogs}/${sID}`, {
            method : 'GET',
            headers : {"Accept" : "application/json"}
        }).then (async res => {
            const text = await res.text();
            try{
                const data = JSON.parse(text);
                if(!data.success) {
                    showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>${data.message}`);
                    return;
                }

                let clkMsg = "";
                if(data.clicks == 0) {
                    clkMsg = "No Click Logs Yet";
                } else {
                    clkMsg = data.clicks;
                }
                console.log(data);

                let expiryDate = "";
                if(data.expiryDate == null) {
                    expiryDate = "Never";
                } else {
                    expiryDate = formatDate(data.expiryDate);
                }

                urlName.value = data.linkName;
                urlShort.value = data.shortUrl;
                urlLong.value = data.link;
                urlCreated.value = formatDate(data.dateCreated);
                urlClicks.value = clkMsg;
                urlExpires.value = expiryDate;

                copyBtn.setAttribute('data-url', data.shortUrl);
                editUrlBtn.setAttribute('data-edit-id' ,data.id);
                viewLogsBtn.setAttribute('data-id-view', data.id);

                copyBtn.onclick = function (e) {
                    e.preventDefault();
                    const urlToCopy = this.getAttribute('data-url');
                    navigator.clipboard.writeText(urlToCopy).then(() => {
                        showNotification('<i class="fa-solid fa-paperclip w-10" style="color: green;"></i>URL copied to clipboard!');
                    });
                };

                editUrlBtn.onclick = function (e) {
                    e.preventDefault();
                    const editUrlId = this.getAttribute('data-edit-id');
                    urlUpdateModal.classList.remove('hidden');
                    loadingOverlayUpM.classList.remove('hidden');
                    console.log("Edit URL Mode ID (eventListen): "+editUrlId);
                    editUrl(editUrlId);
                };

                viewLogsBtn.onclick = function (e) {
                    e.preventDefault();
                    const thisID = this.getAttribute('data-id-view');
                    console.log("View URL Mode ID: "+thisID);
                    viewLinkLogs(this, thisID);
                };

            } catch(err) {
                console.error(err);
            }

        }).catch(error => {
            console.error("Network or fetch error:", error);
            showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i> Unable to reach server.`);
        }).finally(() => {
                loadingOverlay.classList.add('hidden');
        });
    }

    function editUrl(urlId) {

        console.log("Received ID: "+urlId);

        fetch(`${window.appRoutes.urlUpdatePrev}/${urlId}`, {
            method : 'GET',
            headers : {"Accept" : "application/json"}
        }).then (async res => {
            const text = await res.text();
            try{
                const data = JSON.parse(text);
                if(!data.success) {
                    showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>${data.message}`);
                    return;
                }

                urlNameUpdt.value = data.linkName;
                urlDomain.value = data.urlDomain;
                urlbackHalf.value = data.shortCode;
                origUrl.value = data.longUrl;

                updateUrlBtn.setAttribute('data-edi-ID', data.id);

                updateUrlBtn.onclick = function() {
                    updateSelUrl(data.id, urlNameUpdt.value, urlbackHalf.value, this);
                };

            } catch(err) {
                console.error(err);
            }

        }).catch(error => {
            console.error("Network or fetch error:", error);
            showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i> Unable to reach server.`);
        }).finally(() => {
                loadingOverlayUpM.classList.add('hidden');
        });
    }

    function viewLinkLogs(button, vID) {

        console.log("Received ID: "+vID);
        button.disabled = true;
        button.textContent = 'Redirecting...';
        button.classList.add('active');
        const rHref = '/s-app/logs?url_id='+vID;

        const redirStatus = (url, options, timeout = 30000) => {
            return new Promise((resolve, reject) => {
                const timer = setTimeout(() => reject(new Error('Request timed out')), timeout);
                fetch(url, options)
                    .then(response => {
                        clearTimeout(timer);
                        resolve(response);
                    })
                    .catch(err => {
                        clearTimeout(timer);
                        reject(err);
                        showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i> ${err}`);
                    });
            });
        };

        redirStatus(rHref, { method: 'HEAD' }, 30000)
            .then(response => {
                if (response.ok) {
                    window.location.href = rHref; 
                } else {
                    throw new Error('Server responded with an error');
                }
            })
            .catch(error => {
                console.error(error);
                button.disabled = false;
                button.textContent = 'View Analytics';
                button.classList.remove('active');
                showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i> Failed to redirect. Please try again.`);
            });
    }

    function updateSelUrl(eID, LinkName, BackHalf, button) {

        errorUpdateUrl.classList.add('hidden');
        button.disabled = true;
        button.textContent = 'Updating...';

        if (!LinkName) {
            errorUpdateUrl.classList.remove('hidden');
            errorUpdateUrl.textContent = 'Fields must not be empty';
            urlNameUpdt.focus();
            return;
        }
        if (!BackHalf) {
            errorUpdateUrl.classList.remove('hidden');
            errorUpdateUrl.textContent = 'Fields must not be empty';
            urlbackHalf.focus();
            return;
        }

        console.log('Updating url with ID: '+eID);

        fetch(`${window.appRoutes.urlUpdate}/${eID}`, {
            method: 'PUT',
            headers: {
                'Accept' : 'Application/json',
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({
                linkNameUp: LinkName,
                backHalfUp: BackHalf
            })
        })
        .then(async response => {
            const reply = await response.json();
            if(!reply.success) {
                showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i> ${reply.message}`);
                return;
            }
            showNotification(`<i class="fa-solid fa-file-circle-check w-10" style="color:green;"></i> URL Updated Successfully`);
            loadSavedUrls();
            urlUpdateModal.classList.add('hidden');
            showLinkDetails(eID);
        })
        .catch(err => {
            console.error(err);
            showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i> Update failed. Please try again.`);
        }).finally(() => {
            button.disabled = false;
            button.textContent = 'Save';
            updateUrlBtn.setAttribute('data-edi-ID', '');
        });
    }

    function deleteUrl(urlId, button) { 
        console.log(`Deleting URL with ID: ${urlId}`);
        button.disabled = true;
        button.textContent = 'Deleting...';

        fetch(`${window.appRoutes.urlDelete}/${urlId}`, {
            method: 'DELETE',
            headers: {
                'Accept' : 'Application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({
                urlId: urlId
            })
        })
        .then(async response => {
            const reply = await response.json();

            if(!reply.success) {
                showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i> ${reply.message}`);
                return;
            }
            showNotification(`<i class="fa-solid fa-delete-left w-10" style="color:red;"></i> URL Deleted Successfully`);
            loadSavedUrls();
        })
        .catch(err => {
            console.error(err);
            showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i> URL Deletion Failed. Please try again.`);
        })
        .finally(() => {
            button.disabled = true;
            button.textContent = 'Delete';
            currentUrlId == null;
        });
    }

    closeModalBtn.addEventListener('click', () => {
        urlName.value = '';
        urlShort.value = '';
        urlLong.value = '';
        urlClicks.value = '';
        urlCreated.value = '';
        urlExpires.value = '';

        copyBtn.setAttribute('data-url', '');
        editUrlBtn.setAttribute('data-edit-id', '');
        viewLogsBtn.setAttribute('data-id-view', '');
        urlDetailsModal.classList.add('hidden');
        document.body.style.overflow = 'auto';
    });

    updateCancelBtn.addEventListener('click', () => {
        urlUpdateModal.classList.add('hidden');
        updateUrlBtn.setAttribute('data-edi-ID', '');
    });

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