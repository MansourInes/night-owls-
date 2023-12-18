window.addEventListener("load", init);

function init() {
  //handlePaste(); //emepeche le copier coller des inputs

  // username
  document.getElementById("silogin").addEventListener("blur", validateUsername);

  //email
  document.getElementById("siemail").addEventListener("blur", validateEmail);

  //mot de passe
  document
    .getElementById("inputmdp")
    .addEventListener("blur", validatePassword);

  document
    .getElementById("confirmmdp")
    .addEventListener("blur", ValidateSamePassword);

  var eye = document.getElementsByClassName("fa-eye");
  var eyeoff = document.getElementsByClassName("fa-eye-slash");
  for (let i = 0; i < eye.length; i++) {
    eye[i].addEventListener("click", function (e) {
      console.log("event on");
      e.target.style.display = "none";
      e.target.nextElementSibling.style.display = "block";
      e.target.parentElement.parentElement.firstElementChild.type = "text";
    });
  }
  for (let i = 0; i < eyeoff.length; i++) {
    eyeoff[i].addEventListener("click", function (e) {
      console.log("event off");
      e.target.style.display = "none";
      e.target.parentElement.firstElementChild.style.display = "block";
      e.target.parentElement.parentElement.firstElementChild.type = "password";
    });
  }

  document.getElementById("btnInput").addEventListener("click", submitInput);
}

function validateUsername() {
  var username = document.getElementById("silogin");
  username.style.border = "1px solid grey";
  document.getElementById("msgLogin").innerHTML = "";
  if (!checkUsername(username.value.length)) {
    document.getElementById("msgLogin").innerHTML = "Entre 3 et 10 caractères";
    document.getElementById("silogin").style.border = "1px solid red";
  }
}
function checkUsername(username) {
  if (username < 3 || username > 10) {
    return false;
  }
  return true;
}

function validateEmail() {
  const email = document.getElementById("siemail");
  email.style.border = "1px solid grey";
  const msgemail = document.getElementById("emailmsg");
  msgemail.innerHTML = "";
  checkEmail();
  if (!checkEmail()) {
    email.style.border = "1px solid red";
    msgemail.innerHTML = "Email non valide";
  }
}

function checkEmail() {
  var regEx = /^[a-zA-Z0-9._%+-]+@[a-zA-Z_]+?\.[a-zA-Z]{2,}$/;
  const email = document.getElementById("siemail");
  if (email.value.match(regEx)) return true;
  else return false;
}

function handlePaste() {
  var inputs = document.getElementsByTagName("input");
  for (var i = 0; i < inputs.length; i++) {
    inputs[i].addEventListener("paste", function (event) {
      // Empêcher la saisie directe de texte dans l'élément
      event.preventDefault();
    });
  }
}

function checkPassword() {
  var msg = "";
  var passwordInput = document.getElementById("inputmdp").value;
  regEx = /^.{8,}$/;
  if (regEx.test(passwordInput) == false) {
    msg += "Au moins 8 caractères <br>";
  }
  regEx = /(?=.*[a-z])(?=.*[A-Z])/;
  if (regEx.test(passwordInput) == false) {
    msg += "Une minuscule et une majuscule<br>";
  }
  regEx = /[0-9]/;
  if (regEx.test(passwordInput) == false) {
    msg += "Un chiffre<br>";
  }
  regEx = /[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]/;
  if (regEx.test(passwordInput) == false) {
    msg += "Un caractère spécial";
  }
  document.getElementById("msgPass").innerHTML = msg;
  if (msg.length == 0) return true;
  return false;
}

function validatePassword() {
  var passwordInput = document.getElementById("inputmdp");
  var msgPass = document.getElementById("msgPass");
  passwordInput.style.border = "1px solid grey";
  msgPass.innerHTML = "";
  if (!checkPassword()) {
    passwordInput.style.border = "1px solid red";
  }
}

function ValidateSamePassword(e) {
  var msgPass = document.getElementById("msgConfirmPass");
  document.getElementById("confirmmdp").style.border = "1px solid grey";
  msgPass.innerHTML = "";
  if (!checkSamePassword()) {
    document.getElementById("confirmmdp").style.border = "1px solid red";
    msgPass.innerHTML = "Mots de passe différents";
  }
}

function checkSamePassword() {
  const mdp1 = document.getElementById("inputmdp").value;
  const mdp2 = document.getElementById("confirmmdp").value;

  if (mdp1 === mdp2) {
    return true;
  } else {
    return false;
  }
}

function submitInput(event) {
  console.log("event");
  validateEmail();
  validatePassword();
  validateUsername();
  ValidateSamePassword();
  if (
    checkEmail() == false ||
    checkPassword() == false ||
    checkUsername() == false ||
    checkSamePassword() == false
  ) {
    console.log("c'est pas bon");
    event.preventDefault();
  } else {
    console.log("c'est bon");
  }
}
