# Docker-rails
Docker + Ruby on Rails勉強用制作物  
掲示板のようなもの

本制作物を通して、以下を学んだ。
- Railsの復習
- Testの書き方（Rspec）
- Docker上でのRailsの動かし方
- annotate, pryなど、便利なgemの存在

# DEMO

スクショ

# Features

- 掲示板機能
- ユーザー機能

# Requirement

- rbenv 2.5.8
- rubocop 1.11.0
- docker 20.10.5

# Installation
以下参照
[環境構築](memo.md)

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