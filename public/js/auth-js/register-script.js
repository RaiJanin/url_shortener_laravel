document.addEventListener('DOMContentLoaded', function() {
    const showPassBtn = document.getElementById('show-password');
    const confirmShowPass = document.getElementById('show-password-c');
    const eyeIcon = document.getElementById('eye-icon');
    const eyeIconC = document.getElementById('eye-icon-con');
    const passwordVal = document.getElementById('password');
    const confirmPassVal = document.getElementById('confirm-password');

    let passShow = false;
    let conPassShow = false;

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

    confirmShowPass.addEventListener('click', function () {
        conPassShow = !conPassShow;
        console.log(conPassShow);

        if(conPassShow) {
            eyeIconC.classList.remove('fa-eye-slash');
            eyeIconC.classList.add('fa-eye');
            confirmPassVal.setAttribute('type', 'text');
        } else {
            eyeIconC.classList.remove('fa-eye');
            eyeIconC.classList.add('fa-eye-slash');
            confirmPassVal.setAttribute('type', 'password');
        }
    });
})
