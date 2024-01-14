document.addEventListener('DOMContentLoaded', function () {
    window.toggleAnswer = function (element) {
        var answer = element.nextElementSibling;
        answer.style.display = answer.style.display === "none" ? "block" : "none";
    };

  document.getElementById('faq-search-input').addEventListener('keypress', function(event) {
      if (event.key === 'Enter') {
          rechercheFAQ();
      }
  });

  document.getElementById('faq-search-button').addEventListener('click', function() {
      rechercheFAQ();
  });

  document.getElementById('faq-search-button').addEventListener('click', function() {
    rechercheFAQ();
});
  function rechercheFAQ() {
      var input = document.getElementById('faq-search-input');
      var filter = input.value.toUpperCase();
      var faqItems = document.getElementsByClassName('faq');
      var found = false;

      for (var i = 0; i < faqItems.length; i++) {
          var question = faqItems[i].getElementsByClassName("question")[0];
          var txtValue = question.textContent || question.innerText;
          if (txtValue.toUpperCase().indexOf(filter) > -1) {
              faqItems[i].style.display = "";
              found = true;
          } else {
              faqItems[i].style.display = "none";
          }
      }

      var noResultsDiv = document.getElementById('no-results-message');
      noResultsDiv.style.display = found ? "none" : "";
  }
});
