import Swal from 'sweetalert2';
import Rails from '@rails/ujs';

window.Swal = Swal;

// Behavior after click to confirm button
const confirmed = (element, result) => {
};

// Display the confirmation dialog
const showConfirmationDialog = (element) => {
    console.log('Hello world!');
};

const allowAction = (element) => {
    if (element.getAttribute('data-confirm-swal') === null) {
        return true;
    }

    showConfirmationDialog(element);
    return false;
};

function handleConfirm(element) {
    if (!allowAction(this)) {
        Rails.stopEverything(element);
    }
}

Rails.delegate(document, 'a[data-confirm-swal]', 'click', handleConfirm);
