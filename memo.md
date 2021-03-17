# Memo

## 環境構築

Mac

https://github.com/rbenv/rbenv  
Install rbenv.  
brewある前提  
`$ brew install rbenv`

`rbenv init`

~/.zshに以下を追記  
`eval "$(rbenv init -)"`

ターミナル再起動  
反映されたかを確認する  
`curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash`

OKってでたらOK

インストール可能なrubyのバージョンを調べる  
`rbenv install -l`

バージョンを指定してインストールする  
`rbenv install 2.5.8`

インストールしたばかりのrubyを指定するときはrehashを使う  
`rbenv rehash`

インストールされているrubyのバージョンを調べるときはversions  
`rbenv versions`

切替  
`rbenv global 2.5.8`

バージョン確認  
`ruby -v`

完了

対話的に動作確認  
`irb`

irb, prvの日本語対応  
`rbenv unisnatll 2.5.8`

`brew install readline`

`RUBY_CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline)"`

`rbenv install 2.5.8`

`rbenv global 2.5.8`

`irb`

pry  
`gem install pry`

docker  
https://www.docker.com/

Desktop for Macからダウンロード

`docker version`

`docker run hello-world`  
-> Hello from Docker!が表示されればOK

---

docker-filesをダウンロード  
https://github.com/kkoji/rails-lecture/tree/docker-files

docker-filesを展開し、その場所で  
`docker-compose run web rails new . --force --database=mysql`

`docker-compose build`

config/database.ymlを編集し、データベースに接続するための設定を書く
passwordはMYSQL_ROOT_PASSWORD
host はMYSQLサーバのコンテナのサービス名db

```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: root
  password: password
  host: db

```

`docker-compose up -d`

`docker-compose ps`

railsで使用するデータベースをMYSQL上に作成
`docker-compose run web bundle exec rake db:create`

ブラウザで確認
http://localhost:3000/

---
起動  
`docker-compose up -d`

停止  
`docker-compose stop`

コンテナの削除  
`docker-compose down`  

その後、
`docker-compose build`  
`docker-compose up -d`  
※Gemfile編集した際も同様

---

モデル作成  
`docker-compose run web bundle exec rails g model board name:string title:string body:text`

テーブル作成  
`docker-compose run web bundle exec rake db:migrate`

---
pry-byebugの導入  
Gemfile  
```
group :development do
  gem 'pry-byebug'
end
```
`docker-compose build`  
`docker-compose up -d`  
コントローラーの任意の箇所に以下を差し込む  
`binding.pry`

`docker attach アプリ名_web_1`

`binding.pry`を差し込んだ箇所で一時停止する。  
`continue`で進められる。

`Ctrl + p + q`で脱出

---

config/initializers配下に"time_formats.rb"を作成し以下を記載
```ruby
Time::DATE_FORMATS[:datetime_jp] = '%Y年 %m月 %d日 %H時 %M分'
```

このように使える
```ruby
board.created_at.to_s(:datetime_jp)
```

---
routesの確認

http://localhost:3000/rails/info/routes

---
rubocop
https://qiita.com/tomohiii/items/1a17018b5a48b8284a8b

---
gem annotate  
モデルにテーブル構造を自動で出力するように  

Gemfile
```
gem 'annotate'
```

`docker-compose exec web bundle exec rails g annotate:install`

`docker-compose exec web bundle exec annotate`

---

gem rails-flog
ログを見やすくしてくれる

