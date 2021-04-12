$(document).ready(function() {
  $(".add_answer a").
    data("association-insertion-method", 'append').
    data("association-insertion-node", function(link){
      return link.closest('.row').next('.row').find('.answer_form')
    });
});
