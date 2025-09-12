
// var CurrentProgress = 0;
function setProgress(progress){

//   if (CurrentProgress == 0) {
//     CurrentProgress = 1;
    var elem = document.getElementById("myBar");
    // var width = 10;
    // var id = setInterval(frame, 10);
    // function frame() {
    //   if (width >= progress) {
    //     clearInterval(id);
    //     CurrentProgress = 0;
    //   } else {
        // width++;
        elem.style.width = progress + "%";
        elem.innerHTML = progress + "%";
    //   }
//     }
//   }
}