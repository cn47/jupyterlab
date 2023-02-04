## how to use

#### dockerを起動する
``` bash
ps aux | grep "[d]ocker" | grep -v $0 ; if [ $? -eq 1   ]; then sudo service docker start; fi
```

#### ./run.shのjupyterlabのHOMEパスを適宜変更する
特に変更しなければ${HOME}/jupyterディレクトリ以下で次を連携する
* hostのホーム: MOUNT_HOST_HOME
* jupyterのホーム: MOUNT_JUPYTER_HOME
* jupyterlabの設定ファイル: MOUNT_JUPYTER_USER_SETTINGS
* jupyter notebookの設定ファイル: MOUNT_JUPYTER_NOTEBOOK_SETTINGS
* ipythonの設定ファイル: MOUNT_IPYTHON_SETTINGS
* ptpythonの設定ファイル: MOUNT_PTPYTHON_SETTINGS

#### run.shを実行する
* jupyterlabサーバを起動する
``` bahs
sh ./run.sh up
```
* jupyterlabサーバを落とす
``` bahs
sh ./run.sh down
```

なおサーバを落としたあともpipやworkspace情報などは\${HOME}/jupyterディレクトリ以下に残っているため次回以降のupでも引き継がれる

\${HOME}/jupyter以下を消せば初期化される
