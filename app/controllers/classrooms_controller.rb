class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  # GET /classrooms
  # GET /classrooms.json
  def index
    @classrooms = Classroom.all
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
    @courses = Course.all
    @students = Student.all
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)
    @courses = Course.all
    @students = Student.all
    respond_to do |format|
      if @classroom.save
        format.html { redirect_to @classroom, notice: t('classrooms.create.notice') }
        format.json { render action: 'show', status: :created, location: @classroom }
      else
        format.html { render action: 'new' }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to @classroom, notice: t('classrooms.update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom.destroy
    respond_to do |format|
      if not @classroom.errors.any?
        format.html { redirect_to classrooms_url, notice: t('classrooms.destroy.notice') }
        format.json { head :no_content }
      else
        format.html { redirect_to classrooms_url, alert: @classroom.errors.full_messages.join('<br>') }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
      @courses = Course.all
      @students = Student.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:entry_at, :student_id, :course_id)
    end
end
