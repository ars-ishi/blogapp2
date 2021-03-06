$(document).on('turbolinks:load', function(){
  $(function() {
    $(".flash-message").css('transform', 'translateY(54px)');
    $(".flash-message").delay(1000).queue(function() {
      $(this).css('transform', 'translateY(0px)');
    });
  });
  M.AutoInit();
  $('.dropdown-trigger').dropdown({
    alignment: 'right',
    constrainWidth: 'false',
    coverTrigger: 'false'
  });
  if ($('.wide-view').is(':visible')) {
    $('.facorite-btn-wrap > a').addClass('tooltipped');
    $('.tooltipped').tooltip();
  }
  if (window.location.href.match(/^.*\//)) {
    $('.slider').slider({
      indicators: false,
      interval: 4000
    });
  }
});
