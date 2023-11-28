<?php
require "include/header.inc.php"

?>
<h1> NightOwls </h1>
    <form class="search-form" action="rechercher.php" method="get">
                <input type="text" name="query" placeholder="Rechercher..." />
                <button type="submit">Rechercher</button>
    </form>
  <p>H</p>
  <p>H</p>  
  <p>H</p>
  <p>H</p>
  <p>H</p>
  <p>H</p>
  <p>H</p>
    <div class="calendar" id="calendar">
    <script>
    function generateCalendar() {
        var calendarElement = document.getElementById('calendar');
        var currentDate = new Date();

        // Obtenir le premier jour du mois
        var firstDay = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
        var startingDay = firstDay.getDay(); // 0 (dimanche) à 6 (samedi)

        // Obtenir le dernier jour du mois
        var lastDay = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
        var totalDays = lastDay.getDate();

        // Générer le contenu du calendrier
        calendarElement.innerHTML = '';

        for (var i = 0; i < startingDay; i++) {
            var emptyDay = document.createElement('div');
            emptyDay.className = 'calendar-day';
            calendarElement.appendChild(emptyDay);
        }

        for (var day = 1; day <= totalDays; day++) {
            var calendarDay = document.createElement('div');
            calendarDay.className = 'calendar-day';
            calendarDay.textContent = day;

            if (currentDate.getDate() === day) {
                calendarDay.classList.add('today');
            }

            calendarElement.appendChild(calendarDay);
        }
    }

    // Appel initial pour générer le calendrier
    generateCalendar();
</script>

    </div>
<?php
require "include/footer.inc.php"
?>