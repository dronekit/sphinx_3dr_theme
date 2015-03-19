$( document ).ready(function() {
  $( "#language-select" ).click(function() {
    $( "#language-list" ).slideToggle();
    $("#arrow").toggleClass("rotate-arrow");
  });
});
