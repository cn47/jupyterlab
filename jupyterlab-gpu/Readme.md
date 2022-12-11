## how to use

#### dockerを起動する
``` bash
ps aux | grep "[d]ocker" | grep -v $0 ; if [ $? -eq 1   ]; then sudo service docker start; fi
```

#### . run.shのjupyterlabのHOMEパスを適宜変更する
特に変更しなければ${HOME}/jupyterディレクトリ以下で次を連携する
* hostのホーム(~:/home/<username>)
* jupyterのホーム(~/jupyter:home)
* jupyterlabの設定ファイル(./jupyter_user_settings:/home/\${USER_NAME}/.jupyter/lab/user-settings)
* jupyter notebookの設定ファイル(./jupyter_notebook_config.py:/home/\${USER_NAME}/.jupyter/jupyter_notebook_config.py)

#### run.shを実行する
* jupyterlabサーバを起動する
``` bahs
. ./run.sh up
```
* jupyterlabサーバを落とす
``` bahs
. ./run.sh down
```

なおサーバを落としたあともpipやworkspace情報などは\${HOME}/jupyterディレクトリ以下に残っているため次回以降のupでも引き継がれる

\${HOME}/jupyter以下を消せば初期化される
