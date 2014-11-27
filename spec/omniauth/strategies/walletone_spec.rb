require 'spec_helper'

describe OmniAuth::Strategies::WalletOne do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }

  subject do
    args = ['appid', 'secret', @options || {}].compact
    OmniAuth::Strategies::WalletOne.new(*args).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  end

  describe 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('walletone')
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://api.w1.ru')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://api.w1.ru/oauth2/authorize')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('https://api.w1.ru/oauth2/token')
    end
  end

  describe 'expires field is not set by default, then it' do
    it 'should be taken from session raw_info' do
      allow(OmniAuth::Strategies::OAuth2).to receive(:credentials_stack).and_return([{'token' => 'token', 'expires' => nil}])
      allow(subject).to receive(:raw_info).and_return({'ExpireDate' => 'date'})
      expect(subject.credentials['expires']).to eq('date')
    end
  end
end
