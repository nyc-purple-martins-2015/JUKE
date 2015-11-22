$(document).ready(function() {

  $(document).on("submit", ".search_form #new_search_form form", function(event) {
    event.preventDefault();
    debugger
    $.ajax({
      type: "Post",
      url: "/search",
      data: $(this).serialize()
      }).done(function(results) {

        $(".search_form").html(results);
      });


  });

});
