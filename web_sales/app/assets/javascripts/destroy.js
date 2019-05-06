$(document).on('turbolinks:load', function() {
  $('.delete_order').bind('ajax:success', function() {
    $(this).closest('tr').fadeOut();
  });
})
