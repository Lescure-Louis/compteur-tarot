const bouts =  () =>{

const petit = document.querySelector(".petit");
const vingthEtUn = document.querySelector(".vingthEtUn");
const excuse = document.querySelector(".excuse");
const submit = document.querySelector(".new-round");
const bouts = 0

submit.addEventListener('mouseover', (event)=>{
  if (petit.attributes["aria-pressed"].value === "true") {
  bouts++;
 };
  if (vingthEtUn.attributes["aria-pressed"].value === "true") {
  bouts++;
 };
  if (excuse.attributes["aria-pressed"].value === "true") {
  bouts++;
 };

 console.log(bouts);
});
};

export { bouts };
