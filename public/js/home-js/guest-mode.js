document.addEventListener('DOMContentLoaded', function() {

    const urlInput = document.getElementById('urlInput');
    const urlName = document.getElementById('urlName');
    const shortenBtn = document.getElementById('shortenBtn');

    const errorMessageURL = document.getElementById('errorMessageURL');
    const errorMessageName = document.getElementById('errorMessageName');

    const expiryDate = document.getElementById('expiryDate');

    const savedUrlsBtn = document.getElementById('savedUrlsBtn');
    const mobileMenuBtn = document.getElementById('mobileMenuBtn');
    const savedUrlsSidebar = document.getElementById('savedUrlsSidebar');
    const closeSidebarBtn = document.getElementById('closeSidebarBtn');

    const charcount = document.getElementById('charCount');

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

        shortenBtn.textContent = 'Login to use this feature';
    });

    shortenBtn.addEventListener('click', function(e) {
        e.preventDefault();

        savedUrlsSidebar.classList.add('translate-x-full');

        resultContainer.classList.add('hidden');

        const longUrl = urlInput.value.trim();

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

        window.location.href = "/login";
    });
    
    savedUrlsBtn.addEventListener('click', () => {
        savedUrlsSidebar.classList.remove('translate-x-full');
        closeSidebarBtn.style.display = 'block';
    });
    
    closeSidebarBtn.addEventListener('click', () => {
        savedUrlsSidebar.classList.add('translate-x-full');
        closeSidebarBtn.style.display = 'none';
    });
});