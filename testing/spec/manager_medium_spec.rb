require_relative '../../lib/manager_medium'

module Trendvices
  describe ManagerMedium do
    let(:manager_medium) { ManagerMedium.new }

    describe '#scrape' do

      it 'Should return a decently sized Title' do
        manager_medium.scrape
        expect(manager_medium.title.length).to be > 8
      end

      it 'Should NOT return an empty Title' do
        manager_medium.scrape
        expect(manager_medium.title).to_not eq('')
      end

      it 'Should return a decently sized Author name' do
        manager_medium.scrape
        expect(manager_medium.author.length).to be > 5
      end

      it 'Should NOT return an empty Author name' do
        manager_medium.scrape
        expect(manager_medium.author).to_not eq('')
      end

      it 'Should NOT return the second anchor from the Author (in <!-- --> [Group name])' do
        manager_medium.scrape
        expect(manager_medium.author).to_not include('<!--')
      end

      it 'Should return a URL from the Medium Website' do
        manager_medium.scrape
        expect(manager_medium.url).to include('medium.com')
      end

      it 'Should NOT return an empty URL' do
        manager_medium.scrape
        expect(manager_medium.url).to_not eq('')
      end
    end
  end
end
