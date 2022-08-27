require 'rails_helper'

RSpec.describe Contest, type: :model do
  describe '.verified' do
    subject(:verified_contests) { Contest.verified }

    before do
      Contest.create(name: 'contest 1', verified: true)
      Contest.create(name: 'contest 2', verified: false)
    end

    it { expect(verified_contests.count).to eq(1) }
    it { expect(verified_contests.first.name).to eq('contest 1') }
  end
end
