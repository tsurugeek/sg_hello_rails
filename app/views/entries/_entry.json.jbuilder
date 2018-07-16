# index.jsonのリクエストがあった時に使われるもの。１レコードを表す。
# index.json.jbuilderからインクルードされる。
# entryオブジェクトからtitle,bodyなどが抽出されている。
json.extract! entry, :id, :title, :body, :created_at, :updated_at
# このレコードの場所（URL）を生成している。
json.url entry_url(entry, format: :json)
