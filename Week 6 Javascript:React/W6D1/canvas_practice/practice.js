document.addEventListener("DOMContentLoaded", function(){
    // Phase 1 Setup
    const canvas = document.getElementById('mycanvas');
    canvas.width = 500;
    canvas.height = 500;

    const ctx = canvas.getContext('2d');

    // // Phase 2 Draw Rectangle
    // ctx.fillStyle = 'red';
    // ctx.fillRect(100, 100, 100, 100);

    // // Phase 3 Draw Circle
    // ctx.beginPath();
    // ctx.arc(250, 250, 100, 0, 360, false);
    // ctx.strokeStyle = 'red';
    // ctx.lineWidth = 10;
    // ctx.stroke();

    // Phase 4 Draw Shape
    // Pacman
    ctx.beginPath();
    ctx.arc(100, 100, 50, 0.25 * Math.PI, 1.25 * Math.PI, false);
    ctx.fillStyle = "rgb(255, 255, 0)";
    ctx.fill();
    ctx.beginPath();
    ctx.arc(100, 100, 50, 0.75 * Math.PI, 1.75 * Math.PI, false);
    ctx.fill();
    ctx.beginPath();
    ctx.arc(100, 75, 10, 0, 2 * Math.PI, false);
    ctx.fillStyle = "rgb(0, 0, 0)";
    ctx.fill();
});


// House
// // Set line width
// ctx.lineWidth = 10;

// // Wall
// ctx.strokeRect(75, 140, 150, 110);

// // Door
// ctx.fillRect(130, 190, 40, 60);

// // Roof
// ctx.moveTo(50, 140);
// ctx.lineTo(150, 60);
// ctx.lineTo(250, 140);
// ctx.closePath();
// ctx.stroke();