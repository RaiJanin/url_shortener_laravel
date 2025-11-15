document.addEventListener('DOMContentLoaded', function () {
    let showPass = false;
    const showPassBtn = document.getElementById('show-password');
    const checkShowPass = document.getElementById('check-show-pass');

    const currentPassIn = document.getElementById('currentPassword');
    const newPassIn = document.getElementById('newPassword');
    const confirmPassIn = document.getElementById('confirmPassword');

    const terminateBtn = document.getElementById('terminateBtn');
    const cancelTerminateBtn = document.getElementById('cancelTerminateBtn');
    const confirmTerminateModal = document.getElementById('confirm-terminate');
    const confirmationInput = document.getElementById('confirmationInput');
    const finalConfirmation = document.getElementById('confirm-term-btn');

    showPassBtn.addEventListener('click', () => {
        showPass =!showPass;

        if(showPass) {
            checkShowPass.classList.remove('fa-square-xmark', 'text-red-500');
            checkShowPass.classList.add('fa-square-check', 'text-green-500');
            currentPassIn.setAttribute('type', 'text');
            newPassIn.setAttribute('type', 'text');
            confirmPassIn.setAttribute('type', 'text');
        } else {
            checkShowPass.classList.remove('fa-square-check', 'text-green-500');
            checkShowPass.classList.add('fa-square-xmark', 'text-red-500');
            currentPassIn.setAttribute('type', 'password');
            newPassIn.setAttribute('type', 'password');
            confirmPassIn.setAttribute('type', 'password');
        }
    });

    terminateBtn.addEventListener('click', () => {
        showConfirmationModal("Confirm Termination?", "All of your data will be deleted, proceed?", () => {
            confirmTerminateModal.classList.remove('hidden');
        });
    });

    cancelTerminateBtn.addEventListener('click', () => {
        confirmTerminateModal.classList.add('hidden');
    });

    confirmationInput.addEventListener('input', () => {
        finalConfirmation.disabled = confirmationInput.value !== 'Terminate';
    });

    window.addEventListener('click', (e) => {
        if (e.target === modal) {
            confirmTerminateModal.classList.add('hidden');
        }
    });
})