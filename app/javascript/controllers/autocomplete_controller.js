import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  static targets = ["input", "results", "selectedBoardgames", "boardgamesIds", "close"];

  connect() {
    this.ids = [];
    // console.log(this.selectedBoardgamesTarget.value);
    // console.log(this.boardgamesIdsTarget.value);


  }

  search() {
    if (this.inputTarget.value.length < 1) {
      this.resultsTarget.innerHTML = '';
    }
    else {
      const query = this.inputTarget.value

      fetch(`/boardgames/search?query=${query}`)
        .then(response => response.json())
        .then(data => {
          this.resultsTarget.innerHTML = data.map(name => `<li style="cursor: pointer;" data-action="click->autocomplete#select">${name}</li>`).join('');
        })
    }
  }

  select(event) {
    const selected = encodeURIComponent(event.target.innerText);
    fetch(`/boardgames/select?query=${selected}`)
      .then(response => response.json())
      .then(boardgame => {
        this.inputTarget.value = '';
        this.resultsTarget.innerHTML = '';
        this.selectedBoardgamesTarget.insertAdjacentHTML('beforeend', boardgame.render);
        this.ids.push(boardgame.id);
        this.boardgamesIdsTarget.value = this.ids.join(',');
        // console.log(this.boardgamesIdsTarget.value);
      })

  }

  remove(event) {
    this.ids = this.ids.filter(id => id !== parseInt(event.target.parentElement.getAttribute('data-boardgame-id')));
    this.boardgamesIdsTarget.value = this.ids.join(',');
    // event.target.parentElement.remove();
    // event.closeTarget.parentElement.remove();
    console.log(event.currentTarget.parentElement.remove());


  }

}
// `<li>${boardgame.name} </li>`
