$(function() {
  $('.company-name').textfill({ maxFontPixels: 70 });
  
  
  $('.menu-img').hover(function() {
      $(this).children('.darkener').show(function() {
          
      });
      $('.description').textfill({ maxFontPixels: 22 });
      $(this).children('.company-name').hide();
      $(this).children('.company-name-alt').show();
    },
    function() {
      $(this).children('.darkener').hide();
      $(this).children('.company-name').show();
      $(this).children('.company-name-alt').hide();
    }
  );
});