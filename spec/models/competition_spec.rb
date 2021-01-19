require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it {should have_many :competitions_teams}
    it {should have_many(:teams).through(:competitions_teams)}
  end
end
