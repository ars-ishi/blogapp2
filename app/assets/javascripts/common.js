$(document).on('turbolinks:load', function(){
  $(function() {
    $(".flash-message").css('transform', 'translateY(54px)');
    $(".flash-message").delay(1000).queue(function() {
      $(this).css('transform', 'translateY(0px)');
    });
  });
});
