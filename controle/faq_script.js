
function toggleAnswer(element) {
    var answer = element.nextElementSibling;
    if (answer.style.display === "none") {
        answer.style.display = "block";
    } else {
        answer.style.display = "none";
    }
}
