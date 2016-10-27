#!/bin/bash

INFER_TYPE=./run.sh
INFER_SPEC=./run-spec.sh
TYPE_BRANCH_NAME=infer-types
SPEC_BRANCH_NAME=infer-specs

# ensure we eventually checkout a branch called $BRANCH_NAME
# will eventually track origin/$BRANCH_NAME
function git_branch {
  git checkout master
  git branch -D $1
  #git fetch origin $1
  #git checkout -b $1 origin/$1
  git checkout -B $1
}

function git_push {
  git add src
  git commit -m "infer"
  git push origin $1:$1 -f
}

function infer_types {
  cd $1
  git_branch $TYPE_BRANCH_NAME
  $INFER_TYPE
  git_push $TYPE_BRANCH_NAME
  cd ..
}

function infer_specs {
  cd $1
  git_branch $SPEC_BRANCH_NAME
  $INFER_SPEC
  git_push $SPEC_BRANCH_NAME
  cd ..
}

function infer_all {
  infer_types $1
  infer_specs $1
}

infer_all startrek-clojure
infer_all data.xml
infer_all data.json
infer_all fs
infer_all math.combinatorics
infer_all java.jdbc

# requires a lot of memory
#infer_types data.int-map

# FIXME very expensive (or runs forever)
#infer_types tools.analyzer.jvm
