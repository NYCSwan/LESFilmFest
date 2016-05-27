var ready;
ready = function() {

// get comment form
  $('.comments').on('click', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $target.parent().hide();

    var $url          = $target.attr('href');
    var $targetId     = $target.attr('id')
    var $targetappend = $target.parents('.comment-holder')
    var request       = $.ajax({
        type: "GET",
        url: $url
    }).done(function(response){
      $targetappend.append(response);
    });
  });

// post comments
  $(".submit-comment").children().on("submit", function(event){

    event.preventDefault();
    $(".review-button").show();


  })
};

$(document).ready(ready);
$(document).on('page:load', ready);


