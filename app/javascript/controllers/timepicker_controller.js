import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";


export default class extends Controller {

  connect() {
    flatpickr(this.element, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      time_24hr: true, // Affiche une horloge 24 heures
      minuteIncrement: 5, // Incrément des minutes
      defaultHour: 12, // Heure par défaut
    });
  }
}
