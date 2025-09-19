document.addEventListener('DOMContentLoaded', function () {
    function loadUser() {
        const userMenuButton = document.getElementById('user-menu-button');
        const userDropdown = document.getElementById('user-dropdown');
        const logoutButton = document.getElementById('logout-button');
        const accountEmail = document.getElementById('dropdown-email');
        const accountName = document.getElementById('account_name');

        accountName.textContent = 'Unicorn';

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

        logoutButton.addEventListener('click', function(e) {
            e.preventDefault();
            showConfirmationModal(
                "Confirm Logout",
                "Are you sure you want to log out?",
                () => { 
                    // fetch('../../utils/logout.php',
                    //     { method : 'POST' }
                    // ).then(() => {
                    //     window.location.href ='/i/';
                    // })
                    window.location.href = "https://cdn.dribbble.com/userupload/26618269/file/original-26821f169ce09a6fbcfe5ca5d1e617e2.jpg?resize=752x564&vertical=center"; 
                    // simulate logout
                }
            );
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