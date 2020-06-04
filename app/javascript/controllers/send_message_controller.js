import { Controller } from 'stimulus';
import Rails from '@rails/ujs';

export default class extends Controller {
  static targets = ['input', 'form'];
  
  clear() {
    console.log('hello');
    this.inputTarget.value = '';
  }

  submit(event) {
    event.preventDefault();
    Rails.fire(this.formTarget, 'submit');
  }
}
