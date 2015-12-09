$(document).ready(function() {

  $(".link_to_delete_page").on("click",function(event) {
    event.preventDefault();
    $.ajax({
      method: "GET",
      url: "/users/id/edit",
      data: $(this).serialize()
      }).done(function(results) {

        $(".showpage_users_container").html(results);
      });
  });
});