const chelem = () => {
  const check = document.querySelector(".click-chelem");
  const choix = document.querySelector(".chelem-choix");
  check.addEventListener('click', (event)=> {
    choix.classList.toggle("d-none");
  });
};

export { chelem };

