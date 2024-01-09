
function toggleAnswer(element) {
    var answer = element.nextElementSibling;
    if (answer.style.display === "none") {
        answer.style.display = "block";
    } else {
        answer.style.display = "none";
    }
}

document.getElementById('faq-search-input').addEventListener('keypress', function(event) {
    if (event.key === 'Enter') {
      rechercheFAQ();
    }
  });

function rechercheFAQ() {
    var input = document.getElementById('faq-search-input');
    var filter = input.value.toUpperCase();
    var faqItems = document.getElementsByClassName('faq-container');
    var found = false;

    for (var i = 0; i < faqItems.length; i++) {
      var a = faqItems[i].getElementsByTagName("a")[0];
      var txtValue = a.textContent || a.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        faqItems[i].style.display = "";
        found = true;
      } else {
        faqItems[i].style.display = "none";
      }
    }

    var noResultsDiv = document.getElementById('no-results-message');
    if (!found) {
      if (!noResultsDiv) {
        noResultsDiv = document.createElement('div');
        noResultsDiv.id = 'no-results-message';
        noResultsDiv.textContent = "Désolé, je ne trouve rien qui correspond à votre recherche.";
        document.querySelector('.faq-container').appendChild(noResultsDiv);
      } else {
        noResultsDiv.style.display = "";
      }
    } else {
      if (noResultsDiv) {
        noResultsDiv.style.display = "none";
      }
    }
  }
  