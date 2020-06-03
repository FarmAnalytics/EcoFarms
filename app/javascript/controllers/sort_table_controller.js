import { Controller } from 'stimulus';


export default class extends Controller {
  static targets = ['body'];
  
  sort(event) {
    const target = event.currentTarget;
    const id = parseInt(target.dataset.id);
    const table = this.bodyTarget;
    const rows = Array.from(table.rows);
    //Object.entries(table.rows).forEach(row => console.log(row[1].cells[1]));
    // rows.forEach(row => console.log(parseInt(row.cells[1].innerText)));
    let sorted = [...rows].sort((a, b) => {
        return (parseInt(b.cells[id].innerText)) - (parseInt(a.cells[id].innerText));
    });
    const arrows = document.querySelectorAll('.arrow');
    arrows.forEach((arrow) => {
      arrow.classList.remove('d-none');
      arrow.classList.add('d-none');
    });
    
    console.log(arrows)
    if (table.dataset.ordering === 'ascending') {
       sorted.reverse();
       table.dataset.ordering = 'descending';
       target.children[1].classList.add('d-none')
       target.children[2].classList.remove('d-none')
      } else {
       table.dataset.ordering = 'ascending';
       target.children[1].classList.remove('d-none')
       target.children[2].classList.add('d-none')
    }
    sorted.forEach((row) => {
      table.appendChild(row)
    })
  }  
}
