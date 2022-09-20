import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets  = ["tab", "card"]

// displays arrays of cards based on type of tab
  display_info () {
    this.request = new Request(event.target.dataset.toggleUrl);
    this.fetchContent(this.request);

  }

  fetchContent(request) {
    fetch(request)
      .then((response) => {
        if (response.status == 200) {
          response.text().then((text) => this.cardsTarget.innerHTML = text);
        } else {
          console.log("Couldn't load data");
        }
      })
  }
}
