require "test_helper"

class CourseLessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_lesson = course_lessons(:one)
  end

  test "should get index" do
    get course_lessons_url, as: :json
    assert_response :success
  end

  test "should create course_lesson" do
    assert_difference("CourseLesson.count") do
      post course_lessons_url, params: { course_lesson: { course_id: @course_lesson.course_id, lesson_id: @course_lesson.lesson_id, position: @course_lesson.position } }, as: :json
    end

    assert_response :created
  end

  test "should show course_lesson" do
    get course_lesson_url(@course_lesson), as: :json
    assert_response :success
  end

  test "should update course_lesson" do
    patch course_lesson_url(@course_lesson), params: { course_lesson: { course_id: @course_lesson.course_id, lesson_id: @course_lesson.lesson_id, position: @course_lesson.position } }, as: :json
    assert_response :success
  end

  test "should destroy course_lesson" do
    assert_difference("CourseLesson.count", -1) do
      delete course_lesson_url(@course_lesson), as: :json
    end

    assert_response :no_content
  end
end
