require_relative '../../lib/manager_bitly'

module Trendvices
  describe ManagerBitly do
    let(:manager_bitly) { ManagerBitly.new }

    describe '#shorten_url' do
      it 'Should return a shortened URL with a length of 22 characters' do
        expect(manager_bitly.shorten_url('https://github.com/fernandorpm/trendvices').length).to eql(22)
      end

      it 'Should NOT return the given URL' do
        expect(manager_bitly.shorten_url('https://github.com/fernandorpm').length).to_not eql('https://github.com/fernandorpm')
      end

      it 'Should ALWAYS return a shortened URL with a length of 22 characters, independant of the URL' do
        expect(manager_bitly.shorten_url('https://github.com/fernandorpm').length).to eql(manager_bitly.shorten_url('https://github.com/microverseinc').length)
      end
    end
  end
end
