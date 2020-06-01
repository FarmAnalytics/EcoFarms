const onClapButtonClick = (event) => {
  event.preventDefault();
  const form = document.querySelector('.formclapbutton')
  Rails.fire(form, 'submit');
  fetch(window.location.href + '/count_clap', { headers: { accept: 'application/json' } } )
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      const counter = document.querySelector('.rating-num');
      counter.innerHTML = data.clapsCount;
    })
}

const countClaps = () => {
  const clapButton = document.querySelector('.clapbutton');
  clapButton.addEventListener('click', onClapButtonClick);
}

const initClapsCounter = () => {
  const counter = document.querySelector('.rating-num');
  if (counter) {
    countClaps();
  }
}

export { initClapsCounter };
