document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const navLinks = document.querySelector('.nav-links');
    const navLinksItems = document.querySelectorAll('.nav-link');
    const currentPath = window.location.pathname.replace(/\/$/, "");
    
    mobileMenuBtn.addEventListener('click', function() {
        navLinks.classList.toggle('show');
    });
    
    navLinksItems.forEach(link => {
        link.addEventListener('click', function() {
            navLinksItems.forEach(item => item.classList.remove('underline', 'decoration-white', 'text-white'));
            this.classList.add('underline', 'decoration-white', 'text-white');
            
            if (navLinks.classList.contains('show')) {
                navLinks.classList.remove('show');
            }
        });
        
        if (currentPath === new URL(link.href, window.location.origin).pathname.replace(/\/$/, "")) {
            link.classList.add('underline', 'decoration-white', 'text-white');
        }
    });
});
