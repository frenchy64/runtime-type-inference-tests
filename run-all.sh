#!/bin/bash

BRANCH_NAME=infer-types

# ensure we eventually checkout a branch called $BRANCH_NAME
# will eventually track origin/$BRANCH_NAME
function git_branch {
  git branch -D $BRANCH_NAME
  #git fetch origin $BRANCH_NAME
  #git checkout -b $BRANCH_NAME origin/$BRANCH_NAME
  git checkout -B $BRANCH_NAME
}

function git_push {
  git add src
  git commit -m "infer types"
  git push origin $BRANCH_NAME:$BRANCH_NAME -f
}

function run_tests {
  cd $1
  git_branch
  ./run.sh
  git_push
  cd ..
}

run_tests startrek-clojure
run_tests data.xml
run_tests data.json
run_tests fs
run_tests math.combinatorics
run_tests java.jdbc
# requires a lot of memory
#cd ../data.int-map
#./run.sh

# FIXME very expensive (or runs forever
#cd ../tools.analyzer.jvm
#./run.sh
