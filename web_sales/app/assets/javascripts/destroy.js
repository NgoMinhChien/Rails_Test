$(document).on('turbolinks:load', function() {
  $('.delete_order').bind('ajax:success', function() {
    debugger
    $(this).closest('tr').fadeOut();
    console.log(this)
  });
})