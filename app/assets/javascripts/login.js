$(document).ready(function() {

  $("#login_button").click(function() {
     event.preventDefault();
     $(".guest_login").toggle();
     $(".guest_register").css("display", "none");
  });

  $("#register_button").click(function() {
     event.preventDefault();
     $(".guest_register").toggle();
     $(".guest_login").css("display", "none");
  });
});
