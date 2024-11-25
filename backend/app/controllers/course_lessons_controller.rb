class CourseLessonsController < ApplicationController
  before_action :set_course_lesson, only: %i[ show update destroy ]

  # GET /course_lessons
  def index
    @course_lessons = CourseLesson.all

    render json: @course_lessons
  end

  # GET /course_lessons/1
  def show
    render json: @course_lesson
  end

  # POST /course_lessons
  def create
    @course_lesson = CourseLesson.new(course_lesson_params)

    if @course_lesson.save
      render json: @course_lesson, status: :created, location: @course_lesson
    else
      render json: @course_lesson.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /course_lessons/1
  def update
    if @course_lesson.update(course_lesson_params)
      render json: @course_lesson
    else
      render json: @course_lesson.errors, status: :unprocessable_entity
    end
  end

  # DELETE /course_lessons/1
  def destroy
    @course_lesson.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_lesson
      @course_lesson = CourseLesson.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def course_lesson_params
      params.expect(course_lesson: [ :course_id, :lesson_id, :position ])
    end
end
