function toggleOn(item) {
  $(item).children('.darkener').show(function() {
      
  });
  $('.description').textfill({ maxFontPixels: 22 });
  $(item).children('.company-name').hide();
  $(item).children('.company-name-alt').show();
}
function toggleOff(item) {
  $(item).children('.darkener').hide();
  $(item).children('.company-name').show();
  $(item).children('.company-name-alt').hide();
}

$(function() {
  $('.company-name').textfill({ maxFontPixels: 12 });
  
  
  $('.menu-img').hover(function() { toggleOn(this) }, function() { toggleOff(this) });
  $('.menu-img').click(function() {
	  if($(this).children('.company-name-alt:visible').length == 1) {
		  toggleOff(this);
		  return true;
	  }
	  toggleOn(this);
	  return true;
  });
});
