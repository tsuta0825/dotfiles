#!/bin/sh

# エラー時速終了する、未定義の変数の使用時に実行を終了する
set -eu

files=$(echo ${dir_name}/centos/*.sh)
for t in $files
do
    bash "$t"
done