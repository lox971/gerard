// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$( document ).ready(function() {
  $('.choice').each (function () {
    $(this).click(function () {
      $(this).addClass("hidden");
      $(this).next().css( "visibility", "visible" );
    });
  });
});
