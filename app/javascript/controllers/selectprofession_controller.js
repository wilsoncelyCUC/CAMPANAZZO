import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="selectprofession"
export default class extends Controller {
  static targets = ["choice" , "price", "form"] ;

  connect() {
    console.log(this.formTarget.baseURI);
  }

  displayfield = () => {
    const selection = this.choiceTarget.value;

    const url = "/professions"
    console.log(url);

  fetch(url, {
    method: "GET",
    headers: { "Accept": "application/json" },
  })
    .then(response => response.json())
    .then((data) => {
      data.professions.forEach((profession) => {
        var strpro = profession.id.toString();
        if (strpro === selection){
          this.priceTarget.innerText = profession.unit ;
        }
      });
    });


}


}
