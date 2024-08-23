import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  display() {
    event.preventDefault();
    this.modalTarget.classList.remove("hidden");
  }

  close() {
    this.modalTarget.classList.add("hidden");
  }
}
