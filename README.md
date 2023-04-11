# jupyterlab-dockerfile

## how to use

#### dockerを起動する
``` bash
ps aux | grep "[d]ocker" | grep -v $0 ; if [ $? -eq 1   ]; then sudo service docker start; fi
```

#### run.shを実行する
* jupyterlabサーバを起動する
``` bahs
sh ./run.sh up
```
* jupyterlabサーバを落とす
``` bahs
sh ./run.sh down
```

なおサーバを落としたあともpipやworkspace情報などは\${HOME}/jupyter<-gpu>ディレクトリ以下に残っているため次回以降のupでも引き継がれる

\${HOME}/jupyter<-gpu>以下を消せば初期化される
