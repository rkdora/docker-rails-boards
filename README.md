# Docker-rails
Docker + Ruby on Rails勉強用制作物  
掲示板のようなもの

本制作物を通して、以下を学んだ。
- Railsの復習
- Testの書き方（Rspec）
- Docker上でのRailsの動かし方
- annotate, pryなど、便利なgemの存在

工夫したところ
- rubocopを使用し、綺麗なコードを意識した
- railsのバージョン違いによる挙動の差異を吸収した（redirect_backなど）

# DEMO
掲示板一覧  
![screencapture-localhost-3000-boards-2021-03-18-01_36_11](https://user-images.githubusercontent.com/20394831/111507122-ab5bf100-878d-11eb-83e5-1a6626459f75.png)

掲示板詳細  
![screencapture-localhost-3000-boards-2-2021-03-19-00_05_02](https://user-images.githubusercontent.com/20394831/111648507-c63e6c00-8846-11eb-8fa2-cdad33dc6975.png)

ユーザー登録  
![screencapture-localhost-3000-users-new-2021-03-18-01_58_26](https://user-images.githubusercontent.com/20394831/111507060-9c753e80-878d-11eb-814f-fa4d3600a6c6.png)


# Features

- 掲示板機能
- ユーザー機能

# Requirement

- rbenv 2.5.8
- rubocop 1.11.0
- docker 20.10.5

# Installation
[環境構築メモ](memo.md)

# Usage

```bash
git clone https://github.com/rkdora/docker-rails-boards.git
cd docker-rails-boards
docker-compose build
docker-compose up -d
```

# Reference

[Udemy | フルスタックエンジニアが教える 即戦力Railsエンジニア養成講座](https://www.udemy.com/course/rails-kj/)  
[Qiita | RuboCop is 何？](https://qiita.com/tomohiii/items/1a17018b5a48b8284a8b)
