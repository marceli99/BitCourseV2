// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("chartkick");
require("chart.js");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.addEventListener('load', function () {
    let handler = document.getElementById('sec');
    let i = 0;
    setInterval(function () {
        if (i === 60) {
            i = 0;
            const xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    const response = JSON.parse(this.response);
                    document.getElementById('usd').innerHTML = response.today + '$';
                }
            };
            xhttp.open("GET", "api", true);
            xhttp.send();
        }
        i++;
        handler.innerHTML = i;
    }, 1000);
});