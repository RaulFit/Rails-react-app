require 'rails_helper'

RSpec.describe Course, type: :model do
  subject { create(:course) }

  describe 'columns' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:difficulty).of_type(:string) }
    it { is_expected.to have_db_column(:public).of_type(:boolean) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:course_lessons).dependent(:destroy) }
    it { is_expected.to have_many(:lessons).through(:course_lessons) }
    it { is_expected.to have_many(:enrolments).dependent(:destroy) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_length_of(:title).is_at_least(3) }
  end
end