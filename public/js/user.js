document.addEventListener('DOMContentLoaded', function () {
    function loadUser() {
        const userMenuButton = document.getElementById('user-menu-button');
        const userDropdown = document.getElementById('user-dropdown');
        const accountEmail = document.getElementById('dropdown-email');

        userMenuButton.addEventListener('click', function(e) {
            e.stopPropagation();
            toggleDropdown();
        });
        
        document.addEventListener('click', function() {
            if (!userDropdown.classList.contains('hidden')) {
                hideDropdown();
            }
        });
        
        userDropdown.addEventListener('click', function(e) {
            e.stopPropagation();
        });
        
        function toggleDropdown() {
            if (userDropdown.classList.contains('hidden')) {
                showDropdown();
            } else {
                hideDropdown();
            }
        }
        
        function showDropdown() {
            userDropdown.classList.remove('dropdown-exit', 'dropdown-exit-active');
            userDropdown.classList.add('dropdown-enter');
            userDropdown.classList.remove('hidden');
            void userDropdown.offsetWidth;
            userDropdown.classList.add('dropdown-enter-active');
            accountEmail.textContent = 'user@example.com';
            
            setTimeout(() => {
                userDropdown.classList.remove('dropdown-enter', 'dropdown-enter-active');
            }, 200);
        }
        
        function hideDropdown() {
            userDropdown.classList.add('dropdown-exit');
            void userDropdown.offsetWidth;
            userDropdown.classList.add('dropdown-exit-active');
            
            setTimeout(() => {
                userDropdown.classList.remove('dropdown-exit', 'dropdown-exit-active');
                userDropdown.classList.add('hidden');
            }, 200);
        }
    }

    loadUser();
    
});