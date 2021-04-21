class TaskMailer < ApplicationMailer
    default from: 'no-reply@example.com'

    def task_assigned_email
        @email = params[:email]
        @name = params[:name]
        mail(to: @email, subject: 'You have been assigned a new task')
    end

end
