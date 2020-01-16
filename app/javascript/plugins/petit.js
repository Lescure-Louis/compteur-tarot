

const petitAuBout = () => {
  const check = document.querySelector(".click-pab");
  const choix = document.querySelector(".pab-choix");
  check.addEventListener('click', (event)=> {
    choix.classList.toggle("d-none");
  });
};

export { petitAuBout };


