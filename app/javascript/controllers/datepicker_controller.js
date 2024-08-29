import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()


export default class extends Controller {

  static values = { type: String }

  connect() {

    let options = {}
    // options.locale = "fr"
    options.disableMobile = "true"

    if (this.typeValue === "event") {
      const today = new Date();
      options.minDate = today.setDate(today.getDate() + 0.9)
      options.maxDate = today.setFullYear(today.getFullYear() + 1)
      // maxDate: this.data.get("maxDate")

    }

    flatpickr(this.element, options);

  }
}


// export default class extends Controller {
//   connect() {
//     Flatpickr(this.element, {
//       dateFormat: "Y-m-d",      // Format de la date et de l'heure (Année-Mois-Jour Heure:Minute)
//       minDate: this.data.get("minDate"),
//       maxDate: this.data.get("maxDate")
//     });
//   }
// }
