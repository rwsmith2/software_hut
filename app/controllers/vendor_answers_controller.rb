class VendorAnswersController < ApplicationController
  def create 
    @assignment = Assignment.find(session[:assignment_id])
    @assessment = Assessment.find(session[:assessment_id])

    @previous_answers = VendorAnswer.find_by(assignment_id: session[:assignment_id])

    @assignment.update(complete: true)
    puts @assignment.complete

    @vendor_answer = VendorAnswer.find_by(assignment_id: session[:assignment_id])
    @answer = Answer.find_by(answer_id: @vendor_answer.answer_id)
    if (@answer.upload_needed == false)
      redirect_to vendor_home_path 
    else 
      @vendor_answer.update(update_params)
      redirect_to vendor_home_path
    end

  end
  def update_params
    params.require(:vendor_answer).permit(@answerUpdate, @assigUpdate, :image)
  end

end