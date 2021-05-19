$(document).ready(function(){
  var max_questions = 150;
  var wrapper = $(".input_fields_wrap");
  var add_button = $(".add_field_button");

  var x = 2;
  $(add_button).click(function(e){
    e.preventDefault();
    if(x < max_questions){
      $(wrapper).append('<div class="list-group" ><a href="#" class="list-group-item list-group-item-action"/> Question '+x+' <a href="#" class="remove_field">Remove</a></div>');
      x++;
    }
  });

  $(wrapper).on("click",".remove_field", function(e){ 
		e.preventDefault(); $(this).parent('div').remove(); 
    x--;
	})

});

// $(document).ready(function(){
//   var max_answers = 4;
//   var wrapper = $(".answer_fields_wrap");
//   var add_button = $(".add_field_button");

//   var x = 2;
//   $(add_button).click(function(e){
//     e.preventDefault();
//     if(x < max_questions){
//       $(wrapper).append('<div>f.input :answer_'+x+' %br f.input :answer_'+x+'_response %br <a href="#" class="remove_field">Remove</a></div>');
//       x++;
//     }
//   });

//   $(wrapper).on("click",".remove_field", function(e){ 
// 		e.preventDefault(); $(this).parent('div').remove(); 
//     x--;
// 	})

// });