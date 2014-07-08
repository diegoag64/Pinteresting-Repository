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
//= require_tree .

$(document)
    .on('ajax:send', '.vote', function () { $(this).addClass('loading'); })
    .on('ajax:complete', '.vote', function () { $(this).removeClass('loading'); })
    .on('ajax:error', '.vote', function(e, xhr, status, error) { console.log(status); console.log(error); })
    .on('ajax:success', '.vote', function (e, data, status, xhr) { $(this).html(data.count); });

