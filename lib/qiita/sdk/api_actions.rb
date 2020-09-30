module Qiita
  module Sdk
    module ApiActions
      # 記事につけられた「LGTM！」一覧
      def fetch_item_likes(item_id:)
        path = "/api/v2/items/#{item_id}/likes"

        get(path)
      end

      # コメントを削除
      def delete_comment(comment_id:)
        path = "/api/v2/comments/#{comment_id}"

        delete(path)
      end

      # コメントを取得
      def fetch_comment(comment_id:)
        path = "/api/v2/comments/#{comment_id}"

        get(path)
      end

      # コメントを更新
      def update_comment(comment_id:, body:)
        path = "/api/v2/comments/#{comment_id}"

        params = {
          body: body
        }

        patch(path, params)
      end

      # 投稿に付けられたコメント一覧
      def fetch_item_comments(item_id:)
        path = "/api/v2/items/#{item_id}/comments"

        get(path)
      end

      # 記事に対してコメントを投稿
      def post_comment(item_id:, body:)
        path = "/api/v2/items/#{item_id}/comments"

        params = {
          body: body
        }

        post(path, params)
      end

      # タグを取得
      def fetch_tag(tag_id:)
        path = "/api/v2/tags/#{tag_id}"

        get(path)
      end

      # ユーザがフォローしているタグ一覧
      def fetch_following_tags(user_id:)
        path = "/api/v2/users/#{user_id}/following_tags"

        get(path)
      end

      # タグのフォローを外す
      def delete_tag_following(tag_id:)
        path = "/api/v2/tags/#{tag_id}/following"

        delete(path)
      end

      # タグをフォローしているかどうかを調る
      def check_tag_following(tag_id:)
        path = "/api/v2/tags/#{tag_id}/following"

        get(path)
      end

      # タグをフォロー
      def follow_tag(tag_id:)
        path = "/api/v2/tags/#{tag_id}/following"

        put(path, {})
      end

      # 記事をストックしているユーザ一覧を、ストックした日時の降順で返す
      def fetch_item_stockers(item_id:)
        path = "/api/v2/items/#{item_id}/stockers"

        get(path)
      end

      # 全てのユーザの一覧を作成日時の降順で取得
      def fetch_users
        path = '/api/v2/users'

        get(path)
      end

      # ユーザを取得
      def fetch_user(user_id:)
        path = "/api/v2/users/#{user_id}"

        get(path)
      end

      # ユーザがフォローしているユーザ一覧を取得
      def fetch_followees(user_id:)
        path = "/api/v2/users/#{user_id}/followees"

        get(path)
      end

      # ユーザをフォローしているユーザ一覧を取得
      def fetch_followers(user_id:)
        path = "/api/v2/users/#{user_id}/followers"

        get(path)
      end

      # ユーザへのフォローを外します。
      def delete_following(user_id:)
        path = "/api/v2/users/#{user_id}/following"

        delete(path)
      end

      # ユーザをフォローしている場合に204を返す
      def check_following(user_id:)
        path = "/api/v2/users/#{user_id}/following"

        get(path)
      end

      # ユーザをフォロー
      def follow_user(user_id:)
        path = "/api/v2/users/#{user_id}/following"

        put(path, {})
      end

      # 認証中のユーザの記事の一覧を作成日時の降順で返す
      def fetch_my_items(per_page: 100, page: 1)
        path = '/api/v2/authenticated_user/items'

        params = {
          per_page: per_page,
          page: page
        }

        get(path, params)
      end

      # 記事の一覧を作成日時の降順で返す
      def fetch_items(per_page: 100, page: 1)
        path = '/api/v2/items'

        params = {
          per_page: per_page,
          page: page
        }

        get(path, params)
      end

      # 新たに記事を作成
      def post_item(title:, body:, tags: [], tweet: false, restricted: false)
        path = '/api/v2/items'

        params = {
          title: title,
          body: body,
          tweet: tweet,
          private: restricted,
        }

        tag_params = tags.map { |tag| { name: tag } }

        params.merge!({tags: tag_params}) if tags.present?

        post(path, params)
      end

      # 記事を削除
      def delete_item(item_id:)
        path = "/api/v2/items/#{item_id}"

        delete(path)
      end

      # 記事を取得
      def fetch_item(item_id:)
        path = "/api/v2/items/#{item_id}"

        get(path)
      end

      # 記事を更新
      def update_item(item_id:, title: nil, body: nil, restricted: false, tags: [])
        path = "/api/v2/items/#{item_id}"
        params = {
          title: title,
          body: body,
          private: restricted,
        }

        tag_params = tags.map { |tag| { name: tag } }

        params.merge!({tags: tag_params}) if tags.present?

        patch(path, params)
      end

      # 記事をストック
      def stock_item(item_id:)
        path = "/api/v2/items/#{item_id}/stock"

        put(path, {})
      end

      # 記事をストックから取り除く
      def delete_stock(item_id:)
        path = "/api/v2/items/#{item_id}/stock"

        delete(path)
      end

      # 記事をストックしているかどうか調べる
      def check_item_stock(item_id:)
        path = "/api/v2/items/#{item_id}/stock"

        get(path)
      end

      # タグの記事一覧
      def fetch_tag_items(tag_id:)
        path = "/api/v2/tags/#{tag_id}/items"

        get(path)
      end

      # 指定されたユーザの記事一覧
      def fetch_user_items(user_id:, per_page: 100, page: 1)
        path = "/api/v2/users/#{user_id}/items"

        params = {
          per_page: per_page,
          page: page
        }

        get(path, params)
      end

      # 指定されたユーザがストックした記事一覧
      def fetch_user_stocks(user_id:, per_page: 100, per: 1)
        path = "/api/v2/users/#{user_id}/stocks"

        params = {
          per_page: per_page,
          page: page
        }

        get(path, params)
      end

      # コメントに絵文字リアクションを付ける
      def attach_reaction_to_comment(comment_id:, name:)
        path = "/api/v2/comments/#{comment_id}/reactions"
        params = {
          name: name
        }

        post(path, params)
      end

      # 記事に絵文字リアクションを付ける
      def attach_reaction_to_item(item_id:, name:)
        path = "/api/v2/items/#{item_id}/reactions"
        params = {
          name: name
        }

        post(path, params)
      end

      # コメントから絵文字リアクションを削除
      def delete_comment_reaction(comment_id:, reaction_name:)
        path = "/api/v2/comments/#{comment_id}/reactions/#{reaction_name}"

        delete(path)
      end

      # 記事から絵文字リアクションを削除
      def delete_item_reaction(item_id:, reaction_name:)
        path = "/api/v2/items/#{item_id}/reactions/#{reaction_name}"

        delete(path)
      end

      # コメントに付けられた絵文字リアクション一覧
      def fetch_comment_reactions(comment_id:)
        path = "/api/v2/comments/#{comment_id}/reactions"

        get(path)
      end

      # 記事に付けられた絵文字リアクション一覧
      def fetch_item_reactions(item_id:)
        path = "/api/v2/items/#{item_id}/reactions"

        get(path)
      end

      # アクセストークンに紐付いたユーザを返す
      def fetch_authenticated_user
        path = '/api/v2/authenticated_user'

        get(path)
      end
    end
  end
end
