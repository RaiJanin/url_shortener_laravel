    document.addEventListener('DOMContentLoaded', function() {

    const urlInput = document.getElementById('urlInput');
    const urlName = document.getElementById('urlName');
    const shortenBtn = document.getElementById('shortenBtn');

    const errorMessageURL = document.getElementById('errorMessageURL');
    const errorMessageName = document.getElementById('errorMessageName');

    const resultContainer = document.getElementById('resultContainer');
    const shortUrl = document.getElementById('shortUrl');
    const originalUrl = document.getElementById('originalUrl');
    const copyBtn = document.getElementById('copyBtn');
    const customAlias = document.getElementById('customAlias');
    const expiryDate = document.getElementById('expiryDate');

    const savedUrlsBtn = document.getElementById('savedUrlsBtn');
    const mobileMenuBtn = document.getElementById('mobileMenuBtn');
    const savedUrlsSidebar = document.getElementById('savedUrlsSidebar');
    const closeSidebarBtn = document.getElementById('closeSidebarBtn');

    const modal = document.getElementById('urlModal');
    const modalUrlName = document.getElementById('modalUrlName');
    const modalOrigLink = document.getElementById('modalOriginalUrl');
    const showOrigLink = document.querySelectorAll('.show-original-btn');
    const paginationDiv = document.getElementById('pagination');
    const closeModal = document.getElementsByClassName('closeModal')[0];

    const charcount = document.getElementById('charCount');

    let currentPage = 1;
    

    window.loadSavedUrls = loadSavedUrls;

    charcount.classList.add('hidden');
    document.getElementById('customAlias').addEventListener('input', function() {
        charcount.classList.remove('hidden');
        const maxLength = 6;
        const currentLength = this.value.length;
        charcount.textContent = maxLength - currentLength+"/6";
    });

    urlInput.addEventListener('input', function() {
        if (!urlInput.value) {
            errorMessageURL.classList.add('hidden');
            return;
        }
        
        try {
            new URL(urlInput.value);
            errorMessageURL.classList.add('hidden');
        } catch (e) {
            errorMessageURL.classList.remove('hidden');
        }
    });

    shortenBtn.addEventListener('click', function(e) {
        e.preventDefault();

        savedUrlsSidebar.classList.add('translate-x-full');

        resultContainer.classList.add('hidden');

        const longUrl = urlInput.value.trim();
        const name = urlName.value.trim();
        const alias = customAlias.value.trim();
        const expiry = expiryDate.value.trim();
        const button = this;
        const spinner = document.getElementById('shortenLoading');
        const buttonText = document.getElementById('shortenText');

        errorMessageName.classList.add('hidden');
        
        if (!longUrl) {
            errorMessageURL.textContent = 'Please enter a URL';
            errorMessageURL.classList.remove('hidden');
            urlInput.focus();
            return;
        }

        try {
            new URL(longUrl);
        } catch (e) {
            errorMessageURL.textContent = 'Please enter a valid URL (e.g., https://example.com)';
            errorMessageURL.classList.remove('hidden');
            urlInput.focus();
            return;
        }

        if (button.disabled) return;
        button.disabled = true;
        spinner.classList.remove('hidden');
        buttonText.textContent = 'Shortening...';

        fetch(window.appRoutes.createUrl, {
            method: 'POST',
            headers: {
                'Content-type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({
                lngrl : longUrl,
                nmRl : name,
                cstlias : alias,
                expy : expiry
            })
        }).then(async response => {
            const text = await response.text();
            try {
                const data = JSON.parse(text);
                if (data.success) {
                    shortUrl.value = data.shortUrl;
                    originalUrl.textContent = data.originalUrl;
                    shrturlnm.textContent = data.linkName;
                    resultContainer.classList.remove('hidden');

                    urlInput.value = "";
                    urlName.value = "";
                    customAlias.value = "";

                    console.log(data);
                } else {
                    showNotification('<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>'+data.message);
                    console.error('Server Error:', data.message);
                }
            } catch (e) {
                console.error('Invalid JSON from server:', text);
                showNotification('<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>Server error!');
            }
        }).catch(error => {
            console.error('AJAX Error:', error);
            showNotification('<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>Request failed!');
        }).finally(() => {
            button.disabled = false;
            spinner.classList.add('hidden');
            buttonText.textContent = 'Shorten URL';

            charcount.classList.add('hidden');

            resultContainer.scrollIntoView({ behavior: 'smooth', block: 'center'});
            loadSavedUrls();
        });
    });

    copyBtn.addEventListener('click', function() {
        shortUrl.select();
        document.execCommand('copy');
        
        const originalText = copyBtn.textContent;
        copyBtn.textContent = 'Copied!';
        showNotification('<i class="fa-solid fa-paperclip w-10" style="color: green; "></i>URL copied to clipboard!');
        
        setTimeout(function() {
            copyBtn.textContent = originalText;
        }, 2000);
    });
    
    savedUrlsBtn.addEventListener('click', () => {
        savedUrlsSidebar.classList.remove('translate-x-full');
        closeSidebarBtn.style.display = 'block';
    });

    loadSavedUrls();
    async function loadSavedUrls(page = 1) {
        const tbody = document.querySelector('#savedUrlsTable tbody');
        const thead = document.querySelector('#savedUrlsTable thead'); 
        const paginationBorder = document.getElementById('paginationBorder');
        paginationBorder.classList.remove('hidden');

         thead.innerHTML = `
            <tr>
                <th colspan="3" style="text-align:center; align-items:center;">Loading Data</th>
            </tr>`;

        tbody.innerHTML = `
        <tr>
            <td colspan="3" style="text-align:center; align-items:center;">
                ${document.getElementById('loading-template').innerHTML}
            </td>
        </tr>
            `;

        try {
            // const formData = new FormData();
            // formData.append("page", page);

            const response = await fetch(`${window.appRoutes.savedUrls}?page=${page}`, {
                method: "GET",
                headers: {"Accept" : "Application/json"}
            });
            const result = await response.json();
            if (result.error) {
                throw new Error(result.error);
            }

            if (!result.hasData) {
                paginationBorder.classList.add('hidden');
                thead.innerHTML = '';
                tbody.innerHTML = `
                    <td colspan="3" style="text-align:center; ">
                        ${document.getElementById("zero-dat").innerHTML}
                    </td>`;
                showNotification(`<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>${result.message}`);
                return;
            }

            thead.innerHTML = `
                <tr>
                    <th class="px-4 py-2 text-left text-sm font-medium text-gray-500">Website</th>
                    <th class="px-4 py-2 text-left text-sm font-medium text-gray-500">Shortened URL</th>
                    <th class="px-4 py-2 text-left text-sm font-medium text-gray-500">Full Link</th>
                </tr>
                `;

            tbody.innerHTML = result.data.map(url => `
                <tr class="url-card transition duration-200 ease-in-out hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center">
                            <div class="ml-4 w-40 sm:w-60">
                                <div class="text-xs sm:text-sm font-medium text-gray-900 truncate">${url.urlName}</div>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center">
                            <button type="submit" data-url="${url.shortUrl}" class="copy-url-btn ml-2 p-1 rounded-full text-gray-400 hover:text-indigo-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
                                </svg>
                            </button>
                            <div class="text-xs sm:text-sm font-medium text-indigo-600">${url.shortUrl}</div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-xs sm:text-sm font-medium">
                        <button class="text-indigo-600 hover:text-indigo-900 mr-3 show-original-btn" data-url="${url.longUrl}" data-name="${url.urlName}">Details</button>
                    </td>
                </tr>
            `).join('');

            tbody.querySelectorAll('.show-original-btn').forEach(button => {
                button.addEventListener('click', function () {
                    const originalLink = this.getAttribute('data-url');
                    const urlName = this.getAttribute('data-name');

                    modalUrlName.textContent = urlName;
                    modalOrigLink.textContent = originalLink;
                    modalOrigLink.setAttribute('title', originalLink);
                    modal.style.display = 'block';
                });
            });

            tbody.querySelectorAll('.copy-url-btn').forEach(button => {
                const preventButton = button.cloneNode(true);
                button.parentNode.replaceChild(preventButton, button);

                preventButton.addEventListener('click', function (e) {
                    e.preventDefault();
                    const urlToCopy = this.getAttribute('data-url');

                    navigator.clipboard.writeText(urlToCopy).then(() => {
                        showNotification('<i class="fa-solid fa-paperclip w-10" style="color: green; "></i>URL copied to clipboard!');
                    });
                });
            });

            closeModal.onclick = function() {
                modal.style.display = 'none';
            }
            window.onclick = function(event) {
                if(event.target == modal) {
                    modal.style.display = 'none';
                }
            }

            paginationDiv.classList.remove('hidden');
            paginationDiv.innerHTML = '';
            paginationDiv.innerHTML =  handlePagination(result);

        } catch (error) {
            console.error(error);
            paginationBorder.classList.add('hidden');
            paginationDiv.classList.add('hidden');
            thead.innerHTML = ``;
            tbody.innerHTML = `
                    <td colspan="3" style="text-align:center; ">
                        ${document.getElementById("error-dat").innerHTML}
                    </td>`;

            const retryBtn = document.getElementById("retryBtn");

            if (retryBtn) {
                retryBtn.addEventListener("click", () => {
                loadSavedUrls(page);
                });
            }
            showNotification('<i class="fa-solid fa-circle-exclamation w-10" style="color:red;"></i>Failed to load URLS.');
        }
    }

    // pagination already link from the blade
    
    closeSidebarBtn.addEventListener('click', () => {
        savedUrlsSidebar.classList.add('translate-x-full');
        closeSidebarBtn.style.display = 'none';
    });
});