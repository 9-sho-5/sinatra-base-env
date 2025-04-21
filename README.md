# sinatra 基礎環境

## 環境構築

### Dockr の起動

```
docker-compose up -d
```

### コマンドの実行
```
docker-compose exec app ここにコマンドを書く！
```

### Docker の停止

```
docker-compose down --volumes --rmi all --remove-orphans
```

### コマンドの実行

```
docker-compose exec app 〇〇
```
