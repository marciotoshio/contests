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
      Contest.create(name: 'Experience 2', verified: true, created_at: 3.day.ago)
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

    context 'when case does not matter' do
      subject(:search_case_insensitive) { Contest.search('experience') }

      it { expect(search_case_insensitive.count).to eq(1) }
    end
  end

  describe '.most_popular' do
    subject(:most_popular) { Contest.most_popular }

    before do
      Contest.create(name: 'contest 1', verified: true, count: 5)
      Contest.create(name: 'contest 2', verified: true, count: 15)
      Contest.create(name: 'contest 3', verified: true, count: 10)
    end

    it { expect(most_popular.name).to eq('contest 2') }
  end

  describe '#do_registration' do
    let(:contest) { Contest.create(name: 'contest 1', verified: true) }

    before { contest.do_registration }

    it { expect(contest.count).to eq(1) }
  end
end
