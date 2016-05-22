window.onload = function () {

// Get the modal
    var logmodal = document.getElementById('loginModal');
    var regmodal = document.getElementById('registerModal');

// Get the button that opens the modal
    var logbtn = document.getElementById("loginBtn");
    var regbtn = document.getElementById("registerBtn");

// When the user clicks on the button, open the modal
    logbtn.onclick = function () {
        logmodal.style.display = "block";
    }
    regbtn.onclick = function () {
        regmodal.style.display = "block";
    }

// When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == logmodal) {
            logmodal.style.display = "none";
        }
        if (event.target == regmodal) {
            regmodal.style.display = "none";
        }
    }
}