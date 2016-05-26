var ready;
ready = function() {
// get reviews form
  $('.reviews').on('click', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $target.parent().hide();

    var $url          = $target.attr('href');
    var $targetId     = $target.attr('id')
    var $targetAppend = $target.parents('.reviews-container')

    var request = $.ajax({
        type: "GET",
        url: $url
    }).done(function(response){
      $targetAppend.prepend(response);
    });
  });


};

$(document).ready(ready);
$(document).on('page:load', ready);


