# Controller used to handle Assessments 
class AssessmentsController < ApplicationController
  include Pagy::Backend

  #Before actions
  before_action :authenticate_user!
  before_action :set_assessment, only: [:_edit_question, :select_assessment]
  before_action :set_assessment_destroy_edit, only: [:destroy, :edit ,:update]

  #authorize_resource

  #GET /admin/home
  def index 
    #Gets the list of all assessments, and also creates a pagy object
    @pagy, @assessments = pagy(Assessment.all, items: 10)
    #fetch the assessment for a specific vendor
    @user = current_user
    @vendor = Vendor.find_by(user_id: @user.user_id)
    @joined = Assignment.joins(:given_task).select(:task_id).where("complete=false")
    @tasks = @joined.where(vendor_id: @vendor.vendor_id)
  end

  def questions
    # 1 is triage assessment
    @assessment = Assessment.find(params[:assessment_id])
    @page, @questions = pagy(Question.where("assessment_id=?", @assessment.assessment_id), items: 3)
    @question = Question.where("assessment_id=?", @assessment.assessment_id).count
    @questionsCoun = @question/3.0
  end
  
  #GET /admin/assessments/new
  def new 
    #Initialize a new assessment object and build the questions and answers
    @assessment = Assessment.new
    @assessment.questions.build.answers.build
  end
  
  #GET /admin/assessments
  def admin_index
    #Gets the list of all assessments, with pagy. Also selects the first assessment
    @pagy, @assessments = pagy(Assessment.all, items: 10)
    @selected= Assessment.first
  end

  #GET /assessments/:id/edit
  def edit
    #Find the selected assessment
    @assessment = Assessment.find(params[:id])
  end

  def answer_questions
    @assessment = Assessment.find(params[:assessment_id])
    @questions = Questions.find(params[:assessment_id])
  end

  #POST /assessments/search
  def search
    #Create a list of assessments matching the search query
    @pagy, @assessments = pagy(Assessment.where("assessment_title LIKE ?","%#{params[:search][:assessment_title]}%"), items:10)
    render 'search_refresh'
  end

  #GET /fetch_assessment
  def select_assessment
    #Get the selected assessment and format the javascript
    @selected = Assessment.find(params[:assessment_id])
    respond_to do |format|
      format.js
    end
  end

  #POST /assessments
  def create
    #Create an assessment object with the assessment_params
    @assessment = Assessment.new(assessment_params)
    if @assessment.save
      redirect_to admin_assessments_path, notice: 'Assessment was successfully created'
    else
      render :new
    end
  end

  #PATCH /assessments/:id
  def update
    #Find the selected assessment object and update it through the assessment_update_params
    @assessment = Assessment.find(params[:id])
    if @assessment.update(assessment_update_params)
      redirect_to admin_assessments_path, notice: 'Assessment was successfully updated.'
    else
      render :edit
    end
  end

  #DELETE /assessments/:id
  def destroy
    #Find the assessment you want to delete and destroy it
    @assessment_destroy_edit = Assessment.find(params[:id])
    @assessment_destroy_edit.destroy
    redirect_to admin_assessments_path, notice: 'Assessment was successfully destroyed.'
  end

  def upload
    @vendor_answers = VendorAnswer.new(vendor_answers)
  end


  private
  #Setter methods to set the assessment object
  def set_assessment
    @assessment = Assessment.find(params[:assessment_id])
  end

  def set_assessment_destroy_edit
    @assessment_destroy_edit = Assessment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def assessment_params
    #Fetch params for assessment, including nested attributes for questions and answers
    params.fetch(:assessment, {}).permit(:assessment_title,
     questions_attributes: [:question_id, :question_text, :_destroy,
      answers_attributes: [:answer_id, :answer_text, :additional_response, :upload_needed, :_destroy]])
  end

  def assessment_update_params
    #Fetch params for assessment, including nested attributes for questions and answers
    params.fetch(:assessment, {}).permit(:id, :assessment_title,
     questions_attributes: [:id, :question_text, :_destroy,
      answers_attributes: [:id, :answer_text, :additional_response, :upload_needed ,:_destroy]])
  end

  

end
