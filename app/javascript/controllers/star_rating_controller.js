import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating"
//const StarRating = require('star-rating.js')

export default class extends Controller {
  connect() {
    console.log('we are connected');
    new StarRating(this.element)
  }
}
