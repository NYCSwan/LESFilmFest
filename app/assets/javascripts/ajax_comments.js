var ready;
ready = function() {

  $('.review-button').on('click', 'a', function(event){

    event.preventDefault();
    $(".review-button").hide();

    var $target = $(event.target);
    var $url    = $target.attr('href');

    var request = $.ajax({
        type: "GET",
        url: $url
    }).done(function(response){
      $('.comment-holder').append(response);
    });
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);
