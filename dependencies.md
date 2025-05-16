# 📦 Docker 環境用のシステム依存パッケージ

このプロジェクトは、Docker 上で Ruby + Sinatra + ActiveRecord + PostgreSQL を使用しています。
ビルドや実行を正常に行うために、以下の **システムレベルのパッケージ** が必要です。

---

## 🧰 `apt-get` でインストールされるパッケージ

| パッケージ名        | 説明                                                              | 使用される場所                           |
| ------------------- | ----------------------------------------------------------------- | ---------------------------------------- |
| `build-essential`   | C 拡張ライブラリをコンパイルするための GCC や Make などのツール群 | `bcrypt`, `pg` などの Gem のビルドに必要 |
| `libpq-dev`         | PostgreSQL クライアントライブラリの開発用ヘッダ                   | `pg` Gem のビルドに必要                  |
| `libssl-dev`        | OpenSSL 暗号ライブラリの開発ファイル                              | `bcrypt` や他の SSL 対応 Gem に必要      |
| `postgresql-client` | PostgreSQL とのやり取りに使うコマンドラインツール（例: `psql`）   | 手動での DB 操作やヘルスチェックに便利   |

---

## 💎 Ruby & Bundler

- **Ruby バージョン**：`3.3.0`
- **Bundler バージョン**：`2.5.22`

これらは Docker イメージ内にセットアップされており、`Gemfile` に記述された Gem の依存関係を管理します。

---

## 🐋 ベースイメージ

- このプロジェクトでは、Debian ベースの [`ruby:3.3.0`](https://hub.docker.com/_/ruby) をベースイメージとして使用しています。

---

## 🚀 最適化メモ

```dockerfile
rm -rf /var/lib/apt/lists/*
```

これは `apt-get` のキャッシュを削除して、Docker イメージのサイズを小さくするための処理です。
