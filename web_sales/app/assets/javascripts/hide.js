// $(document).ready(function(){
//   $('.delete_post').click(function(){
//     $(this).closest('#_tr_product').hide();
//     console.log(this)
//   });
// });


$(document).on('turbolinks:load', function() {
  $('.delete_post').click(function(){
    $(this).closest('#_tr_product').hide();
    console.log(this)
  });
})