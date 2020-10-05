// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('admin-lte')

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require html5shiv
//= require jquery.pretyPhoto
//= require jquery.scrollUp
//= require main
//= require price-range
//= require_tree
import 'bootstrap';
import "admin-lte/dist/css/AdminLTE.css";
import "admin-lte/dist/css/skins/_all-skins.css";
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap/dist/css/bootstrap-theme';
import '../stylesheets/application';
import "font-awesome/css/font-awesome.css";

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
});






// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
