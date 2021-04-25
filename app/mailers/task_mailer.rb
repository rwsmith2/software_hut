class TaskMailer < ApplicationMailer
    default from: 'demo.team09@epi-stu-hut-demo2.shef.ac.uk'

    def task_assigned_email
        @email = params[:email]
        @name = params[:name]
        mail(to: @email, subject: 'You have been assigned a new task')
    end

end
