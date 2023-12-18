window.addEventListener("load", init);

function init() {
  const eye = document.getElementById("eye");
  const eyeoff = document.getElementById("eyeoff");
  const input = document.getElementById("inputmdp");
  eye.addEventListener("click", () => {
    eye.style.display = "none";
    eyeoff.style.display = "block";
    input.type = "text";
  });
  eyeoff.addEventListener("click", () => {
    eyeoff.style.display = "none";
    eye.style.display = "block";
    input.type = "password";
  });
}
