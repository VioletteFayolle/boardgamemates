import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="input"
export default class extends Controller {

  static targets = ["date", "btnCalendar"]

  connect() {
  }

  selectDate() {
    this.dateTarget.classList.remove('flatpickr-mobile')
    this.dateTarget.click()
    console.log(this.dateTarget);

  }

}
