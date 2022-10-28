
// app/javascript/controllers/form_submit_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submit() {
    console.log('We can submit');
    this.element.submit();
  }
}
