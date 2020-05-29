// const modify_profile = () => {
//   const inputs = document.getElementById('edit_user_21').querySelectorAll('input');
//   const modify = document.getElementById('modify-profile');
//   console.log(modify)
//   modify.addEventListener('click', () => {
//     inputs.forEach((input) => {
//       input.removeAttribute('disabled');
//     })
//   })
// }

const enable_inputs = () => {
  const inputs = document.getElementById('edit_user_21').querySelectorAll('input');
  inputs.forEach((input) => {
    input.removeAttribute('disabled');
    })
}

const init_profile_form = () => {
  const modify = document.getElementById('modify-profile');
  const save = document.getElementById('save-profile');
  modify.addEventListener('click', () => {
    save.classList.remove('d-none');
    modify.classList.add('d-none');
    enable_inputs();
  });
  save.addEventListener('click', () => {
    document.querySelector('.edit_user').submit()
  })
}



export { init_profile_form };