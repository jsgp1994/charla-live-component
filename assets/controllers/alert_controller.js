import { Controller } from '@hotwired/stimulus';
import toastr from 'toastr';

export default class extends Controller {

    connect() {
        window.addEventListener('notification:show', this.showNotificationFromEvent.bind(this));
    }

    showNotificationFromEvent(event) {
        const { message, type } = event.detail;

        toastr[type](message);
    }

    showNotification(event) {
        const message = event.currentTarget.dataset.alertMessage;
        toastr.success(message);
    }
}
