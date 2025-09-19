<div class="error-container">
    <div class="error-icon">
        <svg viewBox="0 0 24 24">
            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z"/>
        </svg>
    </div>

    <h2 class="error-title">Connection Failed</h2>
    <p class="error-message">We couldn't load the requested URLs. This might be due to network issues or server problems.</p>

    <div class="action-buttons">
        <button class="btnE btnE-outline" id="retryBtn">
            <span id="retryText">Try Again</span>
        </button>
        <!--<button class="btnE btnE-outline" onclick="reportIssue()">
            Report Issue
        </button>-->
    </div>

    <div class="suggestions">
        <h4>Quick Fixes:</h4>
        <ul>
            <li>Check your internet connection</li>
            <li>Refresh the page</li>
            <li>Clear browser cache</li>
            <li>Try again in a few minutes</li>
        </ul>
    </div>
</div>