require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  let(:user) { create(:user) }
  let(:course) { create(:course, user:) }

  describe 'GET /show' do
    it 'returns status code 200' do
      get course_path(course)
      expect(response).to have_http_status(:success)
    end

    it 'returns the course' do
      get course_path(course)
      expect(json).to eq(course.attributes.as_json)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:course_params) { attributes_for(:course, user_id: user.id) }

      before do
        post courses_path, params: { course: course_params }
      end
      
      it 'returns the title' do
        expect(json['title']).to eq(course_params[:title])
      end

      it 'returns the difficulty' do
        expect(json['difficulty']).to eq(course_params[:difficulty])
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post courses_path, params: { course: attributes_for(:course, title: nil) }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    before do
      delete course_path(course)
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end