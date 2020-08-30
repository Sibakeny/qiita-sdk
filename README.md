# Qiita::Sdk

[Qiita Api](https://qiita.com/api/v2/docs) の Api クライアント

## Installation

```ruby
gem 'qiita-sdk'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install qiita-sdk

## Usage

### インスタンスの作成

```ruby
  client = Qiita::Sdk::Client.new
```
<br />
<br />

認証が必要なアクションを行う場合

```ruby
  client = Qiita::Sdk::Client.new do |config|
    config.access_token = 'XXXX'
  end
```
<br />
<br />

### メソッド一覧

- 記事につけられた「LGTM！」一覧を取得

```ruby
  item_id = 'XXXX'
  res = client.fetch_item_likes(item_id: item_id)
```
<br />
<br />


- コメントを削除

```ruby
  comment_id = 'XXXX'
  res = client.delete_comment(comment_id: comment_id)
```
<br />
<br />



- コメントを取得

```ruby
  comment_id = 'XXXX'
  res = client.fetch_comment(comment_id: comment_id)
```
<br />
<br />


- コメントを更新

```ruby
  comment_id = 'XXXX'
  body = 'update body'
  client.update_comment(comment_id: comment_id, body: body)
```
<br />
<br />



- 投稿に紐づけられた投稿一覧

```ruby
  item_id = 'XXXX'
  client.fetch_item_comments(item_id: item_id)
```
<br />
<br />



- 記事に対してコメントを投稿

```ruby
  item_id = 'XXXX'
  body = 'comment body'
  client.post_comment(item_id: item_id, body: body)
```
<br />
<br />



- タグを取得

```ruby
  tag_id = 'XXXX'
  client.fetch_tag(tag_id: tag_id)
```
<br />
<br />



- ユーザがフォローしているタグ一覧

```ruby
  user_id = 'XXXX'
  client.fetch_following_tags(user_id: user_id)
```
<br />
<br />



- タグのフォローを外す

```ruby
  tag_id = 'XXXX'
  cient.delete_tag_following(tag_id: tag_id)
```
<br />
<br />



- タグをフォローしているかどうかを調る

```ruby
  tag_id = 'XXXX'
  client.check_tag_following(tag_id: tag_id)
```
<br />
<br />



- タグをフォロー

```ruby
  tag_id = 'XXXX'
  client.follow_tag(tag_id: tag_id)
```
<br />
<br />



- 記事をストックしているユーザ一覧を、ストックした日時の降順で返す

```ruby
  item_id = 'XXXX'
  client.fetch_item_stockers(item_id: item_id)
```
<br />
<br />



- 全てのユーザの一覧を作成日時の降順で取得

```ruby
  res = client.fetch_users
```
<br />
<br />



- ユーザを取得

```ruby
  user_id = 'XXXX'
  res = client.fetch_user(user_id: user_id)
```
<br />
<br />



- ユーザがフォローしているユーザ一覧を取得

```ruby
  user_id = 'XXXX'
  res = client.fetch_followees(user_id: user_id)
```
<br />
<br />



- ユーザをフォローしているユーザ一覧を取得

```ruby
  user_id = 'XXXX'
  res = client.fetch_followers(user_id: user_id)
```
<br />
<br />



- ユーザへのフォローを外します。

```ruby
  user_id = 'XXXX'
  client.delete_following(user_id: user_id)
```
<br />
<br />



- ユーザをフォローしている場合に204を返す

```ruby
  user_id = 'XXXX'
  client.check_following(user_id: user_id)
```
<br />
<br />



- ユーザをフォロー

```ruby
  user_id = 'XXXX'
  client.follow_user(user_id: user_id)
```
<br />
<br />



- 認証中のユーザの記事の一覧を作成日時の降順で返す

```ruby
  res = client.fetch_my_items
```
<br />
<br />



- 記事の一覧を作成日時の降順で返す

```ruby
  res = client.fetch_items
```
<br />
<br />



- 新たに記事を作成

title, bodyは必須

デフォルト値
tweet = false
tags = []
restricted = false

```ruby
  title = 'title'
  body = 'body'
  tweet = true
  tags = ['ruby', 'rails']
  restricted = false

  client.post_item(title: title, body: body, tweet: tweet, tags: tags, restricted: restricted)
```
<br />
<br />


- 記事を削除

```ruby
  item_id = 'XXXX'
  client.delete_item(item_id: item_id)
```
<br />
<br />


- 記事を取得

```ruby
  item_id = 'XXXX'
  res = client.fetch_item(item_id: item_id)
```
<br />
<br />


- 記事を更新

```ruby
  item_id = 'XXXX'
  title = 'update title'
  body = 'update body'
  restricted = false
  tags = ['rails']

  client.update_item(item_id: item_id, title: title, body: body, restricted: restricted, tags: tags)
```
<br />
<br />


- 記事をストック

```ruby
  item_id = 'XXXX'
  client.stock_item(item_id: item_id)
```
<br />
<br />


- 記事をストックから取り除く

```ruby
  item_id = 'XXXX'
  client.delete_stock(item_id: item_id)
```
<br />
<br />


- 記事をストックしているかどうか調べる

```ruby
  item_id = 'XXXX'
  client.check_item_stock(item_id: item_id)
```
<br />
<br />


- タグの記事一覧

```ruby
  tag_id = 'XXXX'
  res = client.fetch_tag_items(teg_id: tag_id)
```
<br />
<br />


- 指定されたユーザの記事一覧

```ruby
  user_id = 'XXXX'
  res = client.fetch_user_items(user_id: user_id)
```
<br />
<br />


- 指定されたユーザがストックした記事一覧

```ruby
  user_id = 'XXXX'
  res = client.fetch_user_stocks(user_id: user_id)
```
<br />
<br />


- コメントに絵文字リアクションを付ける

```ruby
  comment_id = 'XXXX'
  name = 'XXXX'

  client.attach_reaction_to_comment(comment_id: comment_id, name: name)
```
<br />
<br />


- 記事に絵文字リアクションを付ける

```ruby
  item_id = 'XXXX'
  name = 'XXXX'

  client.attach_reaction_to_item(item_id: item_id, name: name)
```
<br />
<br />


- コメントから絵文字リアクションを削除

```ruby
  comment_id = 'XXXX'
  reaction_name = 'XXXX'

  client.delete_comment_reaction(comment_id: comment_id, reaction_name: reaction_name)
```
<br />
<br />


- 記事から絵文字リアクションを削除

```ruby
  item_id = 'XXXX'
  reaction_name = 'XXXX'

  client.delete_item_reaction(item_id: item_id, reaction_name: reaction_name)
```
<br />
<br />


- コメントに付けられた絵文字リアクション一覧

```ruby
  comment_id = 'XXXX'

  client.fetch_comment_reactions(comment_id: comment_id)
```
<br />
<br />


- 記事に付けられた絵文字リアクション一覧

```ruby
  item_id = 'XXXX'

  client.fetch_item_reactions(item_id: item_id)
```
<br />
<br />


- アクセストークンに紐付いたユーザを返す

```ruby
  client.fetch_authenticated_user
```
<br />
<br />

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Qiita::Sdk project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/qiita-sdk/blob/master/CODE_OF_CONDUCT.md).
