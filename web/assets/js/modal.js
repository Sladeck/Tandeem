window.onload = function () {

// Get the modal
    var premodal = document.getElementById('premiumModal');

// Get the button that opens the modal
    var prebtn = document.getElementById("premiumBtn");

// When the user clicks on the button, open the modal
    prebtn.onclick = function () {
        premodal.style.display = "block";
    }


// When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == premodal) {
            premodal.style.display = "none";
        }
    }
}