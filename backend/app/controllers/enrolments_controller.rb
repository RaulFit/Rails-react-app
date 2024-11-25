class EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: %i[ show update destroy ]

  # GET /enrolments
  def index
    @enrolments = Enrolment.all

    render json: @enrolments
  end

  # GET /enrolments/1
  def show
    render json: @enrolment
  end

  # POST /enrolments
  def create
    @enrolment = Enrolment.new(enrolment_params)

    if @enrolment.save
      render json: @enrolment, status: :created, location: course_enrolment_path(@enrolment.user, @enrolment.course, @enrolment)
    else
      render json: @enrolment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enrolments/1
  def update
    if @enrolment.update(enrolment_params)
      render json: @enrolment
    else
      render json: @enrolment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /enrolments/1
  def destroy
    @enrolment.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrolment
      @enrolment = Enrolment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def enrolment_params
      params.expect(enrolment: [ :user_id, :course_id, :progress ])
    end
end
