import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets  = ["tab_left", "tab_right"]


  display_info () {
    if (this.tab_leftTarget.classList.contains('active') && !this.tab_rightTarget.classList.contains('active') )  {
      console.log("left has the class");
      this.tab_rightTarget.classList.remove('active')
      } else if (!this.tab_leftTarget.classList.contains('active') && this.tab_rightTarget.classList.contains('active') )  {
        console.log("the right has the active class");
        this.tab_leftTarget.classList.remove('active')
        this.tab_rightTarget.classList.add('active')
      } else {

        console.log('other case');
      }

  }
}
