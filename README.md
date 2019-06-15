# README

学習した技術を試す為のアプリ。

中身自体はrailsでAPI出力、フロントにVuejsを使ったTODOアプリです。

いまのところ実装済みの技術
- Docker
- CircleCI

## development

### Version

```
Ruby version: 2.6.1
```

### Install

```
$ bundle install --path vendor/bundle
$ yarn install --check-files
```

### test command

```
$ bundle exec rspec
```

## Docker command

### Dockerコンテナ起動
```
$ docker-compose up
```

### コンテナの作業フォルダ
```
$ docker-compose exec app ash
```

###アプリ起動

```
# rails s -b 0.0.0.0
# bin/webpack-dev-server
```
