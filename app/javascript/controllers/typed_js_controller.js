import { Controller } from "@hotwired/stimulus"
import Typed  from "typed.js";

export default class extends Controller {
  connect() {
    console.log('hello');
    new Typed(this.element, {
      strings: ["1) Elige El Trabajo", "2) Anuncia El Trabajo", "3) Contrata El Trabajador", "¡ Y Listo !"],
      typeSpeed: 50,
      loop: true
    });
  }
}
