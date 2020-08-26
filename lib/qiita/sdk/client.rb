module Qiita
  module Sdk
    class Client
      require 'net/https'
      require 'uri'
      require 'json'

      API_BASE_URL = 'https://qiita.com'

      DEFAULT_HEADERS = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      def initialize(access_token: nil)
        @access_token = access_token
      end

      def default_headers
        headers = DEFAULT_HEADERS.clone
        headers["Authorization"] = "Bearer #{@access_token}" if @access_token
        headers
      end

      def get(url)
        httpclient = HTTPClient.new
        httpclient.get(url, default_headers)
      end

      def patch(url, params)
        httpclient = HTTPClient.new
        httpclient.patch(url, params.to_json, default_headers)
      end

      def put(url)
        httpclient = HTTPClient.new
        httpclient.put(url)
      end

      def post(url, params)
        httpclient = HTTPClient.new
        httpclient.post(url, params.to_json, default_headers)
      end

      def delete(url)
        httpclient = HTTPClient.new
        httpclient.delete(url)
      end

      # 全てのユーザの一覧
      def fetch_users
        path = '/api/v2/users'
        url = API_BASE_URL + path

        get(url)
      end

      # 記事につけられた「LGTM！」一覧
      def fetch_item_likes(item_id:)
        path = "/api/v2/items/#{item_id}/likes"
        url = API_BASE_URL + path

        get(url)
      end

      # コメントを削除
      def delete_comment(comment_id:)
        path = "/api/v2/comments/#{comment_id}"
        url = API_BASE_URL + path

        delete(url)
      end

      # コメントを取得
      def fetch_comment(comment_id:)
        path = "/api/v2/comments/#{comment_id}"
        url = API_BASE_URL + path

        get(url)
      end

      # コメントを更新
      def update_comment(comment_id:, body:)
        path = "/api/v2/comments/#{comment_id}"
        url = API_BASE_URL + path

        params = {
          body: body
        }

        patch(url, params)
      end

      # 投稿に付けられたコメント一覧
      def fetch_item_comments(item_id:)
        path = "/api/v2/items/#{item_id}/comments"
        url = API_BASE_URL + path

        get(url)
      end

      # 記事に対してコメントを投稿
      def post_comment(item_id:, body:)
        path = "/api/v2/items/#{item_id}/comments"
        url = API_BASE_URL + path

        params = {
          body: body
        }

        post(url, params)
      end

      # タグを取得
      def fetch_tag(tag_id:)
        path = "/api/v2/tags/#{tag_id}"
        url = API_BASE_URL + path

        get(url)
      end

      # ユーザがフォローしているタグ一覧
      def fetch_following_tags(user_id:)
        path = "/api/v2/users/#{user_id}/following_tags"
        url = API_BASE_URL + path

        get(url)
      end

      # タグのフォローを外す
      def delete_following(tag_id:)
        path = "/api/v2/tags/#{tag_id}/following"
        url = API_BASE_URL + path

        delete(url)
      end

      # タグをフォローしているかどうかを調る
      def check_tag_following(tag_id:)
        path = "/api/v2/tags/#{tag_id}/following"
        url = API_BASE_URL + path

        get(url)
      end

      # タグをフォロー
      def follow_tag(tag_id:)
        path = "/api/v2/tags/#{tag_id}/following"
        url = API_BASE_URL + path

        put(url)
      end

      # 記事をストックしているユーザ一覧を、ストックした日時の降順で返す
      def fetch_item_stockers(item_id:)
        path = "/api/v2/items/#{item_id}/stockers"
        url = API_BASE_URL + path

        get(url)
      end

      # 全てのユーザの一覧を作成日時の降順で取得
      def fetch_users
        path = "/api/v2/users"
        url = API_BASE_URL + path

        get(url)
      end

      # ユーザを取得
      def fetch_user(user_id:)
        path = "/api/v2/users/#{user_id}"
        url = API_BASE_URL + path

        get(url)
      end

      # ユーザがフォローしているユーザ一覧を取得
      def fetch_followees(user_id:)
        path = "/api/v2/users/#{user_id}/followees"
        url = API_BASE_URL + path

        get(url)
      end

      # ユーザをフォローしているユーザ一覧を取得
      def fetch_followers(user_id:)
        path = "/api/v2/users/#{user_id}/followers"
        url = API_BASE_URL + path

        get(url)
      end

      # ユーザへのフォローを外します。
      def delete_following(user_id:)
        path = "/api/v2/users/#{user_id}/following"
        url = API_BASE_URL + path

        delete(url)
      end

      # ユーザをフォローしている場合に204を返す
      def check_following(user_id:)
        path = "/api/v2/users/#{user_id}/following"
        url = API_BASE_URL + path

        get(url)
      end

      # ユーザをフォロー
      def follow_user(user_id:)
        path = "/api/v2/users/#{user_id}/following"
        url = API_BASE_URL + path

        put(url)
      end

      # 認証中のユーザの記事の一覧を作成日時の降順で返す
      def fetch_my_items
        path = "/api/v2/authenticated_user/items"
        url = API_BASE_URL + path

        get(url)
      end

      # 記事の一覧を作成日時の降順で返す
      def fetch_items
        path = '/api/v2/items'
        url = API_BASE_URL + path

        get(url)
      end

      # 新たに記事を作成
      def post_item(params:)
        path = "/api/v2/items"
        url = API_BASE_URL + path

        post(url, params)
      end

      # 記事を削除
      def delete_item(item_id:)
        path = "/api/v2/items/#{item_id}"
        url = API_BASE_URL + path

        delete(url)
      end

      # 記事を取得
      def fetch_item(item_id:)
        path = "/api/v2/items/#{item_id}"
        url = API_BASE_URL + path

        get(url)
      end

      # 記事を更新
      def update_item(item_id:, params:)
        path = "/api/v2/items/#{item_id}"
        url = API_BASE_URL + path

        patch(url, params)
      end

      # 記事をストック
      def stock_item(item_id:)
        path = "/api/v2/items/#{item_id}"
        url = API_BASE_URL + path

        put(url)
      end

      # 記事をストックから取り除く
      def delete_stock(item_id:)
        path = "/api/v2/items/#{item_id}"
        url = API_BASE_URL + path

        delete(url)
      end

      # 記事をストックしているかどうか調べる
      def check_item_stock(item_id:)
        path = "/api/v2/items/#{item_id}/stock"
        url = API_BASE_URL + path

        get(url)
      end

      # タグの記事一覧
      def fetch_tag_items(tag_id:)
        path = "/api/v2/tags/#{tag_id}/items"
        url = API_BASE_URL + path

        get(url)
      end

      # 指定されたユーザの記事一覧
      def fetch_user_items(user_id:)
        path = "/api/v2/tags/#{user_id}/items"
        url = API_BASE_URL + path

        get(url)
      end

      # 指定されたユーザがストックした記事一覧
      def fetch_user_stocks(user_id:)
        path = "/api/v2/users/#{user_id}/stocks"
        url = API_BASE_URL + path

        get(url)
      end

      # コメントに絵文字リアクションを付ける
      def attach_reaction_to_comment(comment_id:, params)
        path = "/api/v2/comments/#{comment_id}/reactions"
        url = API_BASE_URL + path

        post(url, params)
      end

      # 記事に絵文字リアクションを付ける
      def attach_reaction_to_item(item_id: params)
        path = "/api/v2/items/#{item_id}/reactions"
        url = API_BASE_URL + path

        post(url, params)
      end

      # コメントから絵文字リアクションを削除
      def delete_comment_reaction(comment_id:, reaction_name:)
        path = "/api/v2/comments/#{comment_id}/reactions/#{reaction_name}"
        url = API_BASE_URL + path

        delete(url)
      end

      # 記事から絵文字リアクションを削除
      def delete_item_reaction(item_id:, reaction_name:)
        path = "/api/v2/items/#{item_id}/reactions/#{reaction_name}"
        url = API_BASE_URL + path

        delete(url)
      end

      # コメントに付けられた絵文字リアクション一覧
      def fetch_comment_reactions(comment_id:)
        path = "/api/v2/comments/#{comment_id}/reactions"
        url = API_BASE_URL + path

        get(url)
      end

      # 記事に付けられた絵文字リアクション一覧
      def fetch_item_reactions(item_id:)
        path = "/api/v2/items/#{item_id}/reactions"
        url = API_BASE_URL + path

        get(url)
      end

      # アクセストークンに紐付いたユーザを返す
      def fetch_authenticated_user
        path = "/api/v2/authenticated_user"
        url = API_BASE_URL + path

        get(url)
      end
    end
  end
end
