class AssessmentsController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_assessment, only: [:_edit_question, :select_assessment]
  before_action :set_assessment_destroy_edit, only: [:destroy, :edit ,:update]

  def index 
    @assessments = Assessment.all
  end

  def new 
    @assessment = Assessment.new
    @assessment.questions.build.answers.build
  end

  def admin_index
    @assessments = Assessment.all
    @assessment = Assessment.first
    @selected= Assessment.first
  end

  def edit
    @assessment = Assessment.find(params[:id])

  end

  def search
    @assessments = Assessment.where("assessment_title LIKE ?","%#{params[:search][:assessment_title]}%")
    render 'search_refresh'
  end

  def select_assessment
    @selected = Assessment.find(params[:assessment_id])
    respond_to do |format|
      format.js
    end
  end

  def create
    @assessment = Assessment.new(assessment_params)
    # @assessment.assessment_title = task_params[:assessment_title]
    # @assessment.task_description = task_params[:task_description]
    # @assessment.estimation = task_params[:estimation]

    if @assessment.save
      redirect_to admin_assessments_path, notice: 'Assessment was successfully created'
    else
      render :new
    end
  end


  def update
    @assessment = Assessment.find(params[:id])
    if @assessment.update(assessment_update_params)
      @assessment = Assessment.all
      redirect_to admin_assessments_path, notice: 'Assessment was successfully updated.'
    else
      puts(@assessment.errors.full_messages)
      render :edit
    end
  end

  def destroy
    @assessment_destroy_edit = Assessment.find(params[:id])
    @assessment_destroy_edit.destroy
    redirect_to admin_assessments_path, notice: 'Assessment was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_assessment
    @assessment = Assessment.find(params[:assessment_id])
  end

  def set_assessment_destroy_edit
    puts("test")
    @assessment_destroy_edit = Assessment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def assessment_params
    params.fetch(:assessment, {}).permit(:assessment_title, questions_attributes: [:question_id, :question_text, :_destroy, answers_attributes: [:answer_id, :answer_text, :additional_response, :_destroy]])
  end

  def assessment_update_params
    params.fetch(:assessment, {}).permit(:id, :assessment_title, questions_attributes: [:id, :question_text, :_destroy, answers_attributes: [:id, :answer_text, :additional_response, :_destroy]])
  end
  
end
