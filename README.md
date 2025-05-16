# 🚀 Sinatra 基礎環境（Docker 版）

このプロジェクトは、**Ruby + Sinatra + PostgreSQL** を使った Web アプリの基本環境です。
Docker を使うことで、誰でもすぐに同じ開発環境を作ることができます！

---

## 📦 使っている主な技術

- Ruby 3.3.0
- Sinatra（Web アプリ用の軽量フレームワーク）
- ActiveRecord（データベースとやりとりするためのライブラリ）
- PostgreSQL（データベース）
- Docker / Docker Compose

---

## 🛠 セットアップ方法（初めての人向け）

### ① Docker を使って環境を起動する

まずは次のコマンドをターミナルで実行します。

```bash
docker-compose up -d
```

- `up`：コンテナ（仮想のサーバー）を起動します。
- `-d`：バックグラウンド（画面に表示しない）で動かします。

> 🌟 このコマンドを実行するだけで、Web アプリとデータベースが一緒に起動します！

---

## ⚙️ サーバーの使い方（コマンド）

### ② アプリ用のコマンドを実行する

コンテナの中でコマンドを実行したいときは、次のように入力します。

```bash
docker-compose exec app コマンドを書く
```

#### たとえば：

- データベースの状態を確認したいとき：

  ```bash
  docker-compose exec app rake db:migrate:status
  ```

- Ruby を直接動かしてみたいとき（インタラクティブシェル）：

  ```bash
  docker-compose exec app irb
  ```

- pry を開いて調べ物したいとき：

  ```bash
  docker-compose exec app pry
  ```

---

## 🛑 Docker の止め方（後片付け）

### ③ サーバーとデータベースを完全に止める

```bash
docker-compose down --volumes --rmi all --remove-orphans
```

このコマンドは、以下のことをまとめてやってくれます：

| オプション         | 内容                                       |
| ------------------ | ------------------------------------------ |
| `--volumes`        | データベースの中身（保存された情報）も消す |
| `--rmi all`        | 作られた Docker イメージも削除する         |
| `--remove-orphans` | 使われていない余分なコンテナも削除する     |

> ⚠️ **完全に初期化**されるので、もう一度作り直す必要があります（初期化したいときだけ使いましょう）。

---

## 🔍 アクセス方法

サーバーが正しく起動していれば、以下の URL でアプリにアクセスできます：

👉 [http://localhost:4567](http://localhost:4567)

---

## 📁 フォルダ構成（かんたん紹介）

```txt
.
├── app.rb              # Sinatraアプリ本体
├── config/
│   ├── config.ru       # rackup用の起動ファイル
│   └── database.yml    # DB接続設定
├── db/
│   └── schema.rb       # DB構造が記録されるファイル
├── public/             # 静的ファイル（画像・CSS・JS）
├── views/              # HTMLテンプレート
├── Dockerfile          # Dockerの設定ファイル
├── docker-compose.yml  # Docker Compose設定
├── Gemfile             # 使用しているgemの一覧
├── Rakefile            # DB管理用コマンド定義
└── README.md           # このファイル！
```

---

## 🙋‍♀️ よくある質問

### Q. Docker が動かないんだけど…？

- Docker Desktop をインストールしているか確認してください。
- `docker --version` と打ってバージョンが表示されれば OK です。

### Q. コードを変えたのに反映されない！

- コンテナの中を再起動すれば大丈夫です：

  ```bash
  docker-compose restart
  ```

---

## 📝 ライセンス

MIT License（自由に使って OK！）

---

この環境で Sinatra の学習や開発がもっと楽しくなりますように ✨
