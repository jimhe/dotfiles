reviewboardid () {
  if [ -n "$1" ]
  then
    git config --local --get branch."$1".reviewid
  else
    BRANCH=`git rev-parse --abbrev-ref head`
    git config --local --get branch.$BRANCH.reviewid
  fi
}
