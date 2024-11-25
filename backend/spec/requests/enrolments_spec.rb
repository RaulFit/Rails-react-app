require 'rails_helper'

RSpec.describe 'Lessons', type: :request do
  let(:user) { create(:user) }
  let(:course) { create(:course, user:) }
  let(:enrolment) { create(:enrolment, user:, course:) }

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:enrolment_params) { attributes_for(:enrolment, user_id: user.id, course_id: course.id) }

      before do
        post course_enrolments_path(course), params: { enrolment: enrolment_params }
      end
      
      it 'returns the progress' do
        expect(json['progress']).to eq(enrolment_params[:progress])
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post course_enrolments_path(course), params: { enrolment: attributes_for(:enrolment) }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    describe "DELETE /destroy" do
      before do
        delete course_enrolment_path(course, enrolment)
      end
  
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end