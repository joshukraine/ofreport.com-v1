var $ = require('jquery');

$(document).ready(function() {
  if ($('body').hasClass('ofreport-home')) {
    $('header.navbar').addClass('transition');
  }
});

$(window).scroll(function(){

  var scroll = $(window).scrollTop();

  if ($('body').hasClass('ofreport-home')) {
    if (scroll > 300 ) {
      $('header.navbar').addClass('is-visible');
    }

    if (scroll <= 300 ) {
      $('header.navbar').removeClass('is-visible');
    }
  }
});
