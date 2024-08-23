import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["modal"];

  display() {
    this.contentTarget.classList.toggle("hidden");
  }
}
