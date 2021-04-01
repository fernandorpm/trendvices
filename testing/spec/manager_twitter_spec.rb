require_relative '../../lib/manager_twitter'

module Trendvices
  describe ManagerTwitter do
    let(:manager_twitter) { ManagerTwitter.new }

    describe '#shorten_url' do
      it 'Should return a string containing the what was tweeted' do
        expect(manager_twitter.tweet('Test message', '@rpm_fernando',
                                     'no_url')).to eql('Read: Test message - by @rpm_fernando. #trendvices no_url')
      end

      it 'Should NOT return a string if any of the parameters are missing or nil' do
        expect(manager_twitter.tweet('param1', 'param2').class).to_not eql(String)
      end

      it 'Should return nil if any of the parameters are missing or nil' do
        expect(manager_twitter.tweet('param1', 'param2', nil).nil?).to eql(true)
      end
    end
  end
end
