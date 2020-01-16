const inputAtc = "<%= f.input :help, as: :boolean, label: 'attaque',input_html: {class: 'click-levee}  %>";

const levée = () => {
  const check = document.querySelector(".click-levee");
  const choix = document.querySelector(".levee-choix");
  check.addEventListener('click', (event)=> {
    choix.classList.toggle("d-none");
  });

  const checkAtc = document.querySelector(".attaque");
  const choixAtc = document.querySelector(".atc-choix");
  const checkD = document.querySelector(".defense");
  const choixD = document.querySelector(".d-choix");

  const test = document.querySelector(".test");

  checkAtc.addEventListener('click', (event)=> {
    choixAtc.classList.toggle("d-none");
    if (test.innerHTML === ""){
      test.innerHTML = "inputAtc";
    } else {
      test.innerHTML = "";
    }
    checkD.classList.toggle("d-none");

  });
  checkD.addEventListener('click', (event)=> {
    choixD.classList.toggle("d-none");
    checkAtc.classList.toggle("d-none");

  });
};

export { levée };


