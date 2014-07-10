// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require gritter
//= require bootstrap
//= require turbolinks
//= require masonry/jquery.masonry
//= require fancybox
//= require_tree .

$(".upvote")
  .on('ajax:send', function () { $(this).addClass('loading'); })
  .on('ajax:complete', function () { $(this).removeClass('loading'); })
  .on('ajax:error', function () { $(this).after('<div class="error">There was an issue.</div>'); })
  .on('ajax:success', function (data) { $(this).html(data.count); });

  $('.modal').on('show', function(e) {
    var modal = $(this);
    modal.css('margin-top', (modal.outerHeight() / 2) * -1)
         .css('margin-left', (modal.outerWidth() / 2) * -1);
    return this;
});

$(document).ready(function() {
  $("a.fancybox").fancybox();
});

