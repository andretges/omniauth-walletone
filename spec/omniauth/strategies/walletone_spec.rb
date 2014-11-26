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
      expect(subject.options.client_options.authorize_path).to eq('/oauth2/authorize')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('/oauth2/token')
    end
  end

  # describe 'skip_info option' do
  #   context 'when skip info option is enabled' do
  #     it 'should not include raw_info in extras hash' do
  #       @options = { :skip_info => true }
  #       allow(subject).to receive(:raw_info).and_return({:foo => 'bar'})
  #       expect(subject.extra[:raw_info]).to eq(nil)
  #     end
  #   end
  # end

  # describe 'request_phase' do
  #   context 'with no request params set and x_auth_access_type specified' do
  #     before do
  #       allow(subject).to receive(:request).and_return(
  #         double('Request', {:params => {'x_auth_access_type' => 'read'}})
  #       )
  #       allow(subject).to receive(:old_request_phase).and_return(:whatever)
  #     end

  #     it 'should not break' do
  #       expect { subject.request_phase }.not_to raise_error
  #     end
  #   end

  #   context "with no request params set and use_authorize options provided" do
  #     before do
  #       @options = { :use_authorize => true }
  #       subject.stub(:request).and_return(
  #         double('Request', {:params => {}})
  #       )
  #       subject.stub(:old_request_phase).and_return(:whatever)
  #     end

  #     it "should switch authorize_path from authenticate to authorize" do
  #       expect { subject.request_phase }.to change { subject.options.client_options.authorize_path }.from('/oauth/authenticate').to('/oauth/authorize')
  #     end
  #   end
  # end
end
