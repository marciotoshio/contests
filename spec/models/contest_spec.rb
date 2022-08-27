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

  describe '.search' do
    before do
      Contest.create(name: 'contest 1', verified: true, created_at: DateTime.now)
      Contest.create(name: 'contest 2', verified: true, created_at: 1.day.ago)
      Contest.create(name: 'contest 3', verified: false, created_at: 1.day.ago)
      Contest.create(name: 'test 2', verified: true, created_at: 2.day.ago)
      Contest.create(name: 'experience 2', verified: true, created_at: 3.day.ago)
    end

    context 'when query is latest' do
      subject(:search_latest) { Contest.search('latest') }

      it { expect(search_latest.count).to eq(1) }
      it { expect(search_latest.first.name).to eq('contest 1') }
    end

    context 'when query for name' do
      subject(:search_name) { Contest.search('contest') }

      it { expect(search_name.count).to eq(2) }
    end

    context 'when no query is specified' do
      subject(:search_no_query) { Contest.search }

      it { expect(search_no_query.count).to eq(4) }
    end
  end
end
