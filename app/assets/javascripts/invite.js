$(document).ready(function(){
  $(".invite_button").on("submit", ".button_to", function(event){
    event.preventDefault();

    if($(".invite_form").is(":visible")){
      $(".invite_form").remove();
    }
    else {
      var request = $.ajax({
        type: "get",
        url: "invite",
      });
      request.done(function(response){
        $(".invite_button").append(response);
      })
    }
  });
});
