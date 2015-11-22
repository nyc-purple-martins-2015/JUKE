$(document).ready(function() {

  $(".search_form form").submit(function(event) {
    event.preventDefault();
    $.ajax({
      type: "Post",
      url: "/search",
      data: $(this).serialize()
      }).done(function(results) {

        $(".search_form").html(results);
      });


  });

});
