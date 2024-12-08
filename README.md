# My ROS 2 DevContainer

## Dev container requirements

### Common

- ROS Distribution の切り替えが容易  
  humble, Jazzy, and later
- RMW の切り替えが容易  
  FastDDS, CycloneDDS, Zenoh
- CUDA あり/なし
- デバイスにアクセス可能

### development

- C++と Python のコーディングができる
  コード補完，フォーマッティング

## 手順

1. `./make_env.sh`
2. `docker compose build`
3. `docker compose up -d`
4. `docker exec -it ros2dev /bin/zsh`

コンテナの中で root 操作(sudo apt update)したいときは以下のコマンドで潜る．基本的に sudo が必要なコマンドは使わない方針．
`docker exec --user root -it ros2dev /bin/zsh`
