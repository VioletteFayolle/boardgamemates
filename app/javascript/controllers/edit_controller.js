import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit"
export default class extends Controller {

  static targets = ["btn", "input", "form"]

  connect() {

  }

  selectImg() {
    this.inputTarget.click()
  }

  upload() {
    this.formTarget.submit()
  }
}
