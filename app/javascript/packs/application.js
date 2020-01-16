import "bootstrap";

import { petitAuBout } from "../plugins/petit";
if (document.querySelector(".click-pab")) {
  petitAuBout();
};

import { levée } from "../plugins/levee";
if (document.querySelector(".levee-choix")) {
  levée();
};

import { chelem } from "../plugins/chelem";
if (document.querySelector(".click-chelem")) {
  chelem();
};
