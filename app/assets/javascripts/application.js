// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

function blocmetrics(name) {
  
  var _bm_event = {
    event: {
      name: name  
    }
  }

  var _bm_request = new XMLHttpRequest();
  _bm_request.open("POST", "http://localhost:3000/api/events", true);
  _bm_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  // #5
  _bm_request.onreadystatechange = function() {

  };
  
  _bm_request.send(jQuery.param(_bm_event));
}

$('#new_comment').submit(function(ev) {
    blocmetrics("comment");
});

  blocmetrics("page view");

