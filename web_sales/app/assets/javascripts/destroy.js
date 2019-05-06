// $(document).on('turbolinks:load', function() {
//   $('.delete_order').bind('ajax:success', function() {
//     // debugger
//     $(this).closest('tr').fadeOut();
//     console.log(this)
//   });
// })


$(document).ready(function() {
  $('.delete_order').bind('ajax:success', function() {
    debugger
    // var xhr = new XMLHttpRequest(),
    // method = "GET",
    // url = "http://localhost:3000/orders";

    // xhr.open(method, url, true);
    // xhr.onreadystatechange = function () {
    //   if(xhr.readyState === 4 && xhr.status === 200) {
    //     console.log(xhr.responseText);
    //   }
    // };

    // $(this).closest('tr').fadeOut();
    // var priority = $(this).find('.delete_order').val()
    console.log(priority)
    console.log(this)
  });
})