$(document).on('turbolinks:load', function() {
  $('.create_order_detail').bind('ajax:success', function() {
    debugger
    alert("Add to cart success")
  });
})