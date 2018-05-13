#! /bin/bash

repos=(
  "https://github.com/chc-comp/hcai-bench"
  "https://github.com/chc-comp/sally-chc-benchmarks"
  "https://github.com/chc-comp/vmt-chc-benchmarks"
  "https://github.com/chc-comp/kind2-chc-benchmarks"
  "https://github.com/chc-comp/vmt-benchmarks"
  "https://github.com/chc-comp/eldarica-misc"
  "https://github.com/chc-comp/hopv"
  "https://github.com/chc-comp/ldv-ant-med"
)

target_dir="test/repos"
mkdir -p "$target_dir"

err_dir="$target_dir/errors"
rm -rf $err_dir

out_dir="test/all_benchs"
mkdir -p $out_dir

tmp_file="/tmp/tmp_file.smt2"

function get_err_file {
  if [ ! -d $err_dir ] ; then
    mkdir -p $err_dir
  fi
  err_file="$err_dir/$1"
  if [ ! -f $err_file ] ; then
    touch $err_file
  fi
  echo "$err_file"
}

for repo in "${repos[@]}" ; do
  echo "Working on $repo"
  repo_name=`echo "$repo" | sed -e 's:.*/::'`
  mkdir -p "$out_dir/$repo_name"
  repo_target="$target_dir/$repo_name"
  echo "> cloning to $repo_target"
  if [ ! -d $repo_target ] ; then
    git clone $repo $target_dir/$repo_name > /dev/null
    if [ "$?" -ne "0" ] ; then
      echo "Error while cloning $repo"
      exit 2
    fi
  fi
  echo "  translating files..."
  for file in `find $repo_target -iname "*.smt2.gz"` ; do
    gzcat $file > $file.smt2
  done
  for file in `find $repo_target -iname "*.smt2"` ; do
    printf "  $file ... "
    grep -v -e "(get-model)" $file > $tmp_file
    python src/format.py --out_dir $out_dir/$repo_name $tmp_file &> /dev/null
    exit_code="$?"
    if [ "$exit_code" -ne "0" ] ; then
      echo -e "\033[31merror\033[0m"
      err_file=`get_err_file $repo_name`
      echo "    -> see $err_file for a list of errors on this repo"
      echo "$file" >> $err_file
      # python src/format.py $tmp_file
    else
      echo "success"
    fi
  done
done


exit 0