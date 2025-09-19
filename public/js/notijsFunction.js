function showNotification(message, duration = 4000) {
    const container = document.getElementById('notification-container');
    const notificationId = `notification-${Date.now()}`;

    const notification = document.createElement('div');
    notification.id = notificationId;
    notification.className = `bg-white text-black rounded-lg shadow-lg overflow-hidden animate-slideIn relative transition-all duration-300`;
    notification.setAttribute('role', 'alert');
    notification.setAttribute('aria-live', 'assertive');

    notification.innerHTML = `
        <div class="flex items-start p-4">
            
            <div class="flex-1">
                <p class="text-sm font-medium">${message}</p>
            </div>
            <button onclick="dismissNotification('${notificationId}')" class="ml-4 text-black hover:text-gray-200 focus:outline-none" aria-label="Close notification">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/></svg>
            </button>
        </div>
        <div class="absolute bottom-0 left-0 h-1 bg-black bg-opacity-30">
            <div class="progress-bar-fill h-1 bg-gray" style="width: 100%; animation: shrink ${duration}ms linear forwards;"></div>
        </div>
    `;

    container.prepend(notification);

    const timeout = setTimeout(() => {
        dismissNotification(notificationId);
    }, duration);

    notification.timeout = timeout;
}

function dismissNotification(id) {
    const notification = document.getElementById(id);
    if (notification) {
        clearTimeout(notification.timeout);
        notification.classList.remove('animate-slideIn');
        notification.classList.add('animate-slideOut');

        notification.addEventListener('animationend', () => {
            notification.remove();
        }, { once: true });
    }
}