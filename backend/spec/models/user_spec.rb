require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe 'columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:courses).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:enrolments).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_length_of(:name).is_at_least(1) }
    it { is_expected.to validate_length_of(:email).is_at_least(3) }
  end
end