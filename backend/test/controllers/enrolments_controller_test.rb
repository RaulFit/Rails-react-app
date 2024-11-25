require "test_helper"

class EnrolmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrolment = enrolments(:one)
  end

  test "should get index" do
    get enrolments_url, as: :json
    assert_response :success
  end

  test "should create enrolment" do
    assert_difference("Enrolment.count") do
      post enrolments_url, params: { enrolment: { course_id: @enrolment.course_id, progress: @enrolment.progress, user_id: @enrolment.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show enrolment" do
    get enrolment_url(@enrolment), as: :json
    assert_response :success
  end

  test "should update enrolment" do
    patch enrolment_url(@enrolment), params: { enrolment: { course_id: @enrolment.course_id, progress: @enrolment.progress, user_id: @enrolment.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy enrolment" do
    assert_difference("Enrolment.count", -1) do
      delete enrolment_url(@enrolment), as: :json
    end

    assert_response :no_content
  end
end
