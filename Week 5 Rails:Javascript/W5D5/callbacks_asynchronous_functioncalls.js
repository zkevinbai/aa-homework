// Simple Timeout
window.setTimeout(function() {
    console.log(`${alert('HAMMERTIME')}`);
}, 5000);

// Timeout Plus Closure

function hammerTime(time) {
    window.setTimeout( 
        function() {console.log(`${alert('HAMMERTIME')}`);},
        time
    );
    console.log(alert(`${time} is hammertime!`));
}
