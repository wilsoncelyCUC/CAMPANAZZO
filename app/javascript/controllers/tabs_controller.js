import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  connect() {
    console.log('hello from stimulus');
  }
}
