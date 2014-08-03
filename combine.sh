#!/bin/bash

# r: 对应  global attendance protal quit
# r_p: 对应 protal
# r_a: 对应 attendance
# r_q: 对应 quit
# r_g:对应 global

# eg:combine.sh r_g

# Install  colors  modules 
jsDir="colors"

cd ./node_modules
if [ -d "$jsDir" ]
    then
    echo "$jsDir installed  successfully"
    cd ../
else
    cd ../
    npm install  colors --save-dev
fi


# if [ $? -eq 0 ]
#     then
#     rm -rf $ablejsDir
# fi


#输入的参数为空
[ -z $1 ] && {
   echo -e "\033[31;49;1m输入要压缩的工程对应的命令\033[39;49;0m(r || r_g || r_a || r_p)eg:combine.sh r_a"
   exit 1
}

#执行静态资源压缩合并 和 图片添加时间戳
if [ "$1" = "r_a" ]; then 
   cd source/attendance/build
    node r.js -o config.js
elif [ "$1" = "r_g" ]; then
   cd source/global/build
   node r.js -o config.js 
elif [ "$1" = "r_p" ]; then
   cd source/portal/build
   node r.js -o config.js
elif [ "$1" = "r_q" ]; then
   cd source/quit/build
   node r.js -o config.js
elif [ "$1" = "r" ]; then  
   cd source/global/build 
   node r.js -o config.js
   cd ../../attendance/build
   node r.js -o config.js
   cd ../../portal/build 
   node r.js -o config.js
   cd ../../quit/build 
   node r.js -o config.js
fi


if [ "$1" = "r_a" ]; then 
   cd ../../../
   grunt r_a
elif [ "$1" = "r_g" ]; then
   cd ../../../
   grunt r_g
elif [ "$1" = "r_p" ]; then
   cd ../../../
   grunt r_p
elif [ "$1" = "r_q" ]; then
   cd ../../../
   grunt r_q
elif [ "$1" = "r" ]; then 
   cd ../../../
   grunt r
fi

