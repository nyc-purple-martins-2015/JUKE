$(document).ready(function() {

  $(document).on("submit", ".search_form form", function(event) {
    $.ajax({
      type: "Post",
      url: "/search",
      data: $(this).serialize()
      }).done(function(results) {

        $(".search_form").html(results);
      });


  });

});
