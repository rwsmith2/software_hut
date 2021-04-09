class AssessmentsController < ApplicationController
    def index 
      @assessments = Assessment.all
    end

    def new 
        @assessment = Assessment.new
    end

    def create
      @assessment = Assessment.new(assessment_params)
      # @assessment.assessment_title = task_params[:assessment_title]
      # @assessment.task_description = task_params[:task_description]
      # @assessment.estimation = task_params[:estimation]

      if @assessment.save
        redirect_to admin_home_path, notice: 'Assessment was successfully created'
      else
        render :new
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment
      @assessment = Assessment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def assessment_params
      params.fetch(:assessment, {}).permit(:assessment_title, questions_attributes: [:question_id, :question_text, :_destroy])
    end
  
end
