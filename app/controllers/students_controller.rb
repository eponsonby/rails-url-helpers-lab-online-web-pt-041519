class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit 
    @student = Student.find(params[:id])
    if @student.active == true
        @student.active = false
        @student.save
    elsif @student.active == false
        @student.active = true
        @student.save
    end
    redirect_to action: :show
  end



  private

    def set_student
      @student = Student.find(params[:id])
    end
end