require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class WalletOne < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "walletone"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site: 'https://api.w1.ru',
        authorize_url: 'https://api.w1.ru/oauth2/authorize',
        token_url: 'https://api.w1.ru/oauth2/token'
      }
      option :provider_ignores_state, true

      def setup_phase
        super
        options[:format].try(:to_sym) == :xml ? set_xml_format : set_json_format
      end

      def set_json_format
        options[:headers] = {
          'Accept' => 'application/vnd.wallet.openapi.v1+json',
          'Content-Type' => 'application/vnd.wallet.openapi.v1+json'
        }
        options[:format] = :json
      end

      def set_xml_format
        options[:headers] = {
          'Accept' => 'application/vnd.wallet.openapi.v1+xml',
          'Content-Type' => 'application/vnd.wallet.openapi.v1+xml'
        }
        options[:format] = :xml
      end

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['UserId'] }

      info do
        {
          :user_id => raw_info['UserId']
        }
      end

      def credentials
        creds = super
        creds['expires'] = raw_info['ExpireDate']
        creds
      end

      def raw_info
        @raw_info ||= access_token.get('/OpenApi/sessions/current', headers: options[:headers], parse: options[:format]).parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'walletone', 'WalletOne'
