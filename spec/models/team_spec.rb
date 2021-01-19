require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it {should have_many :competitions_teams}
    it {should have_many(:competitions).through(:competitions_teams)}
    it {should have_many :players}
  end
end
