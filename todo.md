## BlogPost
- [x] created_at を date という名前に変える
- [ ] slug フィールドを追加する

## upload.rb
- [ ] blog_post を作ったあとに publish にする. uploader.upload!(post).and_publish とかかっこよさそう(?)だけど、いまだとたぶん作った Contentful の post のクラスが渡ってくるから、考えないといけない。そもそも upload したときに publish にしちゃだめなケースがあるんだっけ？ないなら別メソッドにしてチェーンする必要ある？というのも

## BlogPostBuilder
- [ ] date は `"2015-11-06T09:45:27"` という形式に変える（ISO8601 で定義されているらしい http://calendars.wikia.com/wiki/ISO_8601）
