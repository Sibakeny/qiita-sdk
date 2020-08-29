require 'webmock/rspec'
RSpec.describe Qiita::Sdk::Client do
  before do
    WebMock.enable!
  end

  it 'credentialがセットされること' do
    client = Qiita::Sdk::Client.new do |config|
      config.access_token = 'access_token'
    end
    expect(client.credential).to eq 'Bearer access_token'
  end

  it 'headersがセットされていること' do
    client = Qiita::Sdk::Client.new
    default_headers = {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
    expect(client.headers).to eq default_headers
  end

  it 'access_tokenをセットするとそれがheadersに追加されていること' do
    client = Qiita::Sdk::Client.new(access_token: 'access_token')
    headers_include_credential = {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json',
      'Authorization' => 'Bearer access_token'
    }
    expect(client.headers).to eq headers_include_credential
  end

  it 'デフォルトのendpoint' do
    client = Qiita::Sdk::Client.new
    expect(client.endpoint).to eq Qiita::Sdk::Client::API_BASE_URL
  end
end
