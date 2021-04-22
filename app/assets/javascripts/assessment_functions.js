$(document).ready(function() {
  $(".add_answer a").
    data("association-insertion-method", 'append').
    data("association-insertion-node", function(link){
      return link.closest('.row').next('.row').find('.answer_form')
    });
});

$(document).ready(function() {
  $('%button#assessment-swag').click(function() {
    $(this).addClass('active').siblings().removeClass('active');
  });
});



// $(document).ready(function() {
//   $("#show_assessment").html("<%= escape_javascript(= render partial: 'show_assessment', locals: { assessment: @selected } ) %>"); 
// });