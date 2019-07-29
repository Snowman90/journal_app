// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

$(function(){
  $('.js-delete-link').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();

    if(confirm('Are you sure?')) {
      var url = $(event.target).attr('href')
      $.ajax({
        method: "DELETE",
        dataType: 'json',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: url
      })
      .done(function(  ) {
        $(event.target).closest('tbody').remove();
      })
    }
    return false;
  })

  $('.truncate').on('click', function(event) {
    if($(event.target).closest('a').hasClass("text-truncate")) {
      $(event.target).closest('a').removeClass("text-truncate");
    }
    else {
      $(event.target).closest('a').addClass("text-truncate");
    }
  })
})
