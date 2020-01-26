const points = () =>{
  const attaque = document.querySelector(".attackPts");
  const defense = document.querySelector(".defensePts");

  attaque.addEventListener('keyup', (event)=>{
    defense.value = 91 - attaque.value
  });

  defense.addEventListener('keyup', (event)=>{
    attaque.value = 91 - defense.value
  });
}

export { points };
