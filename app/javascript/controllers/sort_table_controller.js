import { Controller } from 'stimulus';


export default class extends Controller {
  static targets = ['general', 'propriete', 'environnemental', 'social', 'eco', 'body'];
  
  sort(event) {
    const target = event.target;
    const table = this.bodyTarget;
    console.log(table.columns);
  }  
}
