require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many :stories }
  end
end
