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
    
    if (table.dataset.ordering === 'ascending') {
       sorted.reverse();
       table.dataset.ordering = 'descending';
    } else {
      table.dataset.ordering = 'ascending';
    }
    sorted.forEach((row) => {
      table.appendChild(row)
    })
  }  
}
