class QuestionsController < ApplicationController
  def index 
    @questions = Question.all
  end

  def new 
      render layout: false
      @form_builder = nil
      @question = Question.new
  end

  def create
    @question = Question.new(assessment_params)
    # @assessment.assessment_title = task_params[:assessment_title]
    # @assessment.task_description = task_params[:task_description]
    # @assessment.estimation = task_params[:estimation]

    if @question.save
      redirect_to admin_home_path, notice: 'Assessment was successfully created'
    else
      render :new
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def question_params
    params.fetch(:question, {}).permit(:question_text, answers_attributes: [:answer_id, :answer_text ,additional_response , :_destroy])
  end

end
