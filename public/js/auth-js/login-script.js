document.addEventListener('DOMContentLoaded', function() {
    const showPassBtn = document.getElementById('show-password');
    const eyeIcon = document.getElementById('eye-icon');
    const passwordVal = document.getElementById('password');

    let passShow = false;

    showPassBtn.addEventListener('click', function () {
        passShow = !passShow;

        if(passShow) {
            eyeIcon.classList.remove('fa-eye-slash');
            eyeIcon.classList.add('fa-eye');
            passwordVal.setAttribute('type', 'text');
        } else {
            eyeIcon.classList.remove('fa-eye');
            eyeIcon.classList.add('fa-eye-slash');
            passwordVal.setAttribute('type', 'password');
        }
    });
})