$(document).ready(function() {
    var target = $('#len')[0];
    target.addEventListener('change', function() {
        var color = target.value > 20 ? 'red' : 'blue';
        var divvy = document.getElementById('divvy');
        divvy.style.color = color;
        divvy.innerHTML = divvy.innerHTML.replace(/red|blue/g, color);
    });
})
