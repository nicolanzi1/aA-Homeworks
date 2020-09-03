document.addEventListener("DOMContentLoaded", function(){
    const canvasEl = document.getElementById("mycanvas");
    canvasEl.height = 500;
    canvasEl.width = 500;

    const ctx = canvasEl.getContext('2d');
    ctx.fillStyle = 'green';
    ctx.fillRect(0, 0, 500, 500);

    ctx.beginPath();
    ctx.arc(250, 250, 120, 0, Math.PI * 2, true);
    ctx.strokeStyle = 'black';
    ctx.lineWidth = 3;
    ctx.stroke();
    ctx.moveTo(250, 275);
    ctx.arc(255, 275, 60, 0, Math.PI, false);
    ctx.moveTo(200, 200);
    ctx.arc(200, 70, 40, 0, Math.PI * 2, true);
    ctx.moveTo(250, 250);
    ctx.arc(300, 70, 40, 0, Math.PI * 2, true);
    ctx.fillStyle = 'yellow';
    ctx.fill();
});
