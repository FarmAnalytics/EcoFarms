import Rails from "@rails/ujs";

const onClapButtonClick = event => {
  event.preventDefault();
  const form = document.querySelector(".formclapbutton");
  console.log(form);
  form.addEventListener('ajax:success', (event) => {
    updateCount(event.detail[0].clap_count);
  })
  Rails.fire(form, "submit");
};

const updateCount = (count) => {
  const counter = document.querySelector(".rating-num");
  counter.innerHTML = count;
};

const countClaps = () => {
  const clapButton = document.querySelector(".clapbutton");
  clapButton.addEventListener("click", onClapButtonClick);
};

const initClapsCounter = () => {
  const counter = document.querySelector(".rating-num");
  if (counter) {
    countClaps();
  }
};

export { initClapsCounter };
