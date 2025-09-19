const confirmmodal = document.getElementById("confirmationModal");
const head = document.getElementById("confirm-head");
const msg = document.getElementById("confirm-message");
const confirmBtn = document.getElementById("confirmBtn");
const cancelBtn = document.getElementById("cancelBtn");

function showConfirmationModal(title, message, onConfirm, onCancel = null) {
    
    head.textContent = title;
    msg.textContent = message;

    confirmmodal.classList.remove("hidden");

    confirmBtn.replaceWith(confirmBtn.cloneNode(true));
    cancelBtn.replaceWith(cancelBtn.cloneNode(true));

    const newConfirmBtn = document.getElementById("confirmBtn");
    const newCancelBtn = document.getElementById("cancelBtn");

    newConfirmBtn.addEventListener("click", () => {
        confirmmodal.classList.add("hidden");
        if (typeof onConfirm === "function") onConfirm();
    });

    newCancelBtn.addEventListener("click", () => {
        confirmmodal.classList.add("hidden");
        if (typeof onCancel === "function") onCancel();
    });
}

window.onclick = function(event) {
    if(event.target == confirmmodal) {
        confirmmodal.classList.add('hidden');
    }
}