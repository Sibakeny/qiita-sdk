require 'webmock/rspec'
RSpec.describe Qiita::Sdk::Client do
  before do
    WebMock.enable!
  end

  it '#fetch_users' do
    url = Qiita::Sdk::Client::API_BASE_URL + '/api/v2/users'
    stub_request(:get, url).to_return { |request| { body: 'mock', status: 200 } }

    client = Qiita::Sdk::Client.new
    response = client.fetch_users
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_item_likes' do
    item_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}/likes"
    stub_request(:get, url).to_return { |request| {status: 200} }

    client = Qiita::Sdk::Client.new
    response = client.fetch_item_likes(item_id: item_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#delete_comment' do
    comment_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/comments/#{comment_id}"
    stub_request(:delete, url).to_return { |request| {status: 200} }

    client = Qiita::Sdk::Client.new
    response = client.delete_comment(comment_id: comment_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_comment' do
    comment_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/comments/#{comment_id}"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_comment(comment_id: comment_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#update_comment' do
    comment_id = '1234'
    body = 'this is comment'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/comments/#{comment_id}"
    stub_request(:patch, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.update_comment(comment_id: comment_id, body: body)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_item_comments' do
    item_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}/comments"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_item_comments(item_id: item_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#post_comment' do
    item_id = '1234'
    body = 'this is comment'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}/comments"
    stub_request(:post, url).to_return { |request| {status: 200, body: body }}

    client = Qiita::Sdk::Client.new
    response = client.post_comment(item_id: item_id, body: body)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_tag' do
    tag_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/tags/#{tag_id}"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_tag(tag_id: tag_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_following_tags' do
    user_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/users/#{user_id}/following_tags"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_following_tags(user_id: user_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#delete_tag_following' do
    tag_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/tags/#{tag_id}/following"
    stub_request(:delete, url).to_return { |request| {status: 200} }

    client = Qiita::Sdk::Client.new
    response = client.delete_tag_following(tag_id: tag_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#check_tag_following' do
    tag_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/tags/#{tag_id}/following"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new(tag_id: tag_id)
    response = client.check_tag_following(tag_id: tag_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#follow_tag' do
    tag_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/tags/#{tag_id}/following"
    stub_request(:put, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.follow_tag(tag_id: tag_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_item_stockers' do
    item_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}/stockers"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_item_stockers(item_id: item_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_users' do
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/users"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_users
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_user' do
    user_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/users/#{user_id}"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_user(user_id: user_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_followees' do
    user_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/users/#{user_id}/followees"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_followees(user_id: user_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_followers' do
    user_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/users/#{user_id}/followers"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_followers(user_id: user_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#delete_following' do
    user_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/users/#{user_id}/following"
    stub_request(:delete, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.delete_following(user_id: user_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#check_following' do
    user_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/users/#{user_id}/following"
    stub_request(:get, url).to_return { |request| {status: 200 }}

    client = Qiita::Sdk::Client.new
    response = client.check_following(user_id: user_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#follow_user' do
    user_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/users/#{user_id}/following"
    stub_request(:put, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.follow_user(user_id: user_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_my_items' do
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/authenticated_user/items"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_my_items
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_items' do
    url = Qiita::Sdk::Client::API_BASE_URL + '/api/v2/items'
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_items
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#post_item' do
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items"
    stub_request(:post, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.post_item(title: 'title', body: 'body')
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#delete_item' do
    item_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}"
    stub_request(:delete, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.delete_item(item_id: item_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_item' do
    item_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_item(item_id: item_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#update_item' do
    item_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}"
    stub_request(:patch, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.update_item(item_id: item_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#stock_item' do
    item_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}/stock"
    stub_request(:put, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.stock_item(item_id: item_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#delete_stock' do
    item_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}/stock"
    stub_request(:delete, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.delete_stock(item_id: item_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#check_item_stock' do
    item_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}/stock"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.check_item_stock(item_id: item_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_user_items' do
    user_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/tags/#{user_id}/items"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_user_items(user_id: user_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_user_stocks' do
    user_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/users/#{user_id}/stocks"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_user_stocks(user_id: user_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#attach_reaction_to_comment' do
    comment_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/comments/#{comment_id}/reactions"
    stub_request(:post, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.attach_reaction_to_comment(comment_id: comment_id, name: 'dummy')
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#attach_reaction_to_item' do
    item_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}/reactions"
    stub_request(:post, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.attach_reaction_to_item(item_id: item_id, name: 'dummy')
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#delete_comment_reaction' do
    comment_id = '1234'
    reaction_name = 'dummy'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/comments/#{comment_id}/reactions/#{reaction_name}"
    stub_request(:delete, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.delete_comment_reaction(comment_id: comment_id, reaction_name: reaction_name)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#delete_item_reaction' do
    item_id = '1234'
    reaction_name = 'dummy'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}/reactions/#{reaction_name}"
    stub_request(:delete, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.delete_item_reaction(item_id: item_id, reaction_name: reaction_name)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_comment_reactions' do
    comment_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/comments/#{comment_id}/reactions"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_comment_reactions(comment_id: comment_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_item_reactions' do
    item_id = '1234'
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/items/#{item_id}/reactions"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_item_reactions(item_id: item_id)
    expect(response).to be_a(Net::HTTPOK)
  end

  it '#fetch_authenticated_user' do
    url = Qiita::Sdk::Client::API_BASE_URL + "/api/v2/authenticated_user"
    stub_request(:get, url).to_return { |request| {status: 200}}

    client = Qiita::Sdk::Client.new
    response = client.fetch_authenticated_user
    expect(response).to be_a(Net::HTTPOK)
  end
end