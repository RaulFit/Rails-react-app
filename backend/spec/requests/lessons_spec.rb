require 'rails_helper'

RSpec.describe 'Lessons', type: :request do
  let(:user) { create(:user) }
  let(:course) { create(:course, user:) }
  let(:lesson) { create(:lesson, course:) }
  let(:course_lesson) { create(:course_lesson, course:, lesson:) }

  describe 'GET /show' do
    it 'returns status code 200' do
      get course_lesson_path(course, lesson)
      expect(response).to have_http_status(:success)
    end

    it 'returns the course' do
      get course_lesson_path(course, lesson)
      expect(json).to eq(lesson.attributes.as_json)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:lesson_params) { attributes_for(:lesson, course_id: course.id) }

      before do
        post course_lessons_path(course), params: { lesson: lesson_params }
      end
      
      it 'returns the title' do
        expect(json['title']).to eq(lesson_params[:title])
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post course_lessons_path(course), params: { lesson: attributes_for(:lesson, title: nil) }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end