import Rails from "@rails/ujs";

const onClapButtonClick = event => {
  event.preventDefault();
  const form = document.querySelector(".formclapbutton");
  Rails.fire(form, "submit");
};

const updateCount = () => {
  fetch(window.location.href + "/count_clap", {
    headers: { accept: "application/json" }
  })
    .then(response => response.json())
    .then(data => {
      const counter = document.querySelector(".rating-num");
      counter.innerHTML = data.clapsCount;
    });
};

const countClaps = () => {
  const clapButton = document.querySelector(".clapbutton");
  clapButton.addEventListener("click", onClapButtonClick);

  setInterval(updateCount, 1500);
};

const initClapsCounter = () => {
  const counter = document.querySelector(".rating-num");
  if (counter) {
    countClaps();
  }
};

export { initClapsCounter };
