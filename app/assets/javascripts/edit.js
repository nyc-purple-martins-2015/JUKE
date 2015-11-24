$(document).ready(function() {

  $("#current_list_link").click(function() {
     event.preventDefault();
     $(".current_list_container").toggle();
     $("#suggested_list_link").toggle();
     $("#current_list_link").toggle();
     $("#hide_button").toggle();
     $(".invite_button").toggle();
  });

  $("#suggested_list_link").click(function() {
     event.preventDefault();
     $(".suggested_songs_container").toggle();
     $("#suggested_list_link").toggle();
     $("#current_list_link").toggle();
     $("#hide_button").toggle();
     $(".invite_button").toggle();
  });

    $("#hide_button").click(function() {
     event.preventDefault();
     $(".suggested_songs_container").css("display", "none");
     $(".current_list_container").css("display", "none");
     $("#suggested_list_link").toggle();
     $("#current_list_link").toggle();
     $("#hide_button").toggle();
     $(".invite_button").toggle();
  });

});
