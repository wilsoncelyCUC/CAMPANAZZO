import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="booker"
export default class extends Controller {
  static targets = ["select", "calendar"];

  connect() {
    console.log(this.selectTarget);
    console.log(this.calendarTarget);
  }

  displayForm() {
    this.selectTarget.classList.toggle("d-none");
    this.calendarTarget.classList.toggle("d-none");

  }

}
