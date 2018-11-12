$(document).on('turbolinks:load', function(){
  if (window.location.href.match(/^.*\//)) {
    jQuery('#article_box').masonry({
      itemSelector: '.article-wrapper',
      gutter: 15,
      fitWidth: true
    });
    M.AutoInit();
    $('.slider').slider({
      indicators: false,
      interval: 4000
    });
  }
});
