import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      dateFormat: "Y-m-d",      // Format de la date et de l'heure (Année-Mois-Jour Heure:Minute)            // Affiche une horloge 24 heures
    });
  }
}
