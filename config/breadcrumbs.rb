crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", users_path(current_user)
  parent :root
end

crumb :cards_index do
  link "支払い方法", user_cards_path(current_user)
  parent :mypage
end

crumb :cards_add do
  link "クレジットカード情報入力", add_user_cards_path(current_user)
  parent :cards_index
end

crumb :logout do
  link "ログアウト", logout_index_path(current_user)
  parent :mypage
end


#### 以下はビュー作成次第対応予定
# カテゴリ一覧
# 親カテゴリ
# 子カテゴリ
# 孫カテゴリ
# ブランド一覧
# 各ブランド
# 本人情報の登録
# プロフィール

