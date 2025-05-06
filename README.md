# jupyterlab-dockerfile
* jupyterlab環境コンテナを構築する
* vscodeでも利用を想定しているため、extensionはなし
* パッケージマネージャはuvを利用

## how to use

### dockerを起動する
``` bash
ps aux | grep "[d]ocker" | grep -v $0 ; if [ $? -eq 1   ]; then sudo service docker start; fi
```

### ベースイメージをbuildする
イメージを構築して次のリポジトリにpushする: https://hub.docker.com/repositories/cn47  \
ベースイメージは`Dockerfile.cpu|gpu.base`ファイルを参照して構築する
``` bash
# cpu/gpu版指定可能
sh ./build_and_push gpu|cpu
```


#### run.shを実行する
リポジトリにpushしたイメージをベースに、`pyproject.toml`に記述したパッケージを入れながら
最終イメージ構築/コンテナを構築する
最終イメージは`Dockerfile`ファイルと`docker-compose.yml`を参照して構築する
* jupyterlabサーバを起動する
``` bash
# cpu/gpu版指定可能
sh ./run.sh up gpu|cpu
```
* jupyterlabサーバを落とす
``` bash
# cpu/gpu版指定可能
sh ./run.sh down gpu|cpu
```

### 補足
* ホスト側の`${HOME}/projects`をコンテナ側の`${HOME}/projects`にマウントしている
* 導入したpythonパッケージリストは`uv pip compile pyproject.toml > requirements.lock`にて出力できる
* jupyter-settingsは参照不要（jupyter-extensionやipython/ptpython,bashrcを配置している）