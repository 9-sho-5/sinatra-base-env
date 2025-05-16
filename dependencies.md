# 📦 System Dependencies for Docker Environment

This project uses a Ruby + Sinatra + ActiveRecord + PostgreSQL stack within Docker.
To ensure successful build and runtime, the following **system-level packages** are required.

---

## 🧰 Installed via `apt-get`

| Package             | Description                                                                          | Used by                                           |
| ------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------- |
| `build-essential`   | Meta-package that includes GCC, Make, and other tools to compile native C extensions | Required by gems like `bcrypt`, `pg`              |
| `libpq-dev`         | Development headers for PostgreSQL client libraries                                  | Required to build the `pg` gem                    |
| `libssl-dev`        | Development files for OpenSSL cryptographic libraries                                | Required by `bcrypt` and other SSL-related gems   |
| `postgresql-client` | Command-line tools for interacting with PostgreSQL databases (`psql`)                | Useful for manual DB operations and health checks |

---

## 💎 Ruby & Bundler

- **Ruby version**: `3.3.0`
- **Bundler version**: `2.5.22`

These are set up in the Docker image and used to manage gem dependencies listed in `Gemfile`.

---

## 🐋 Base Image

- The project uses [`ruby:3.3.0`](https://hub.docker.com/_/ruby) as its base Docker image, which is based on Debian.

---

## 🚀 Optimization Note

```dockerfile
rm -rf /var/lib/apt/lists/*
```
