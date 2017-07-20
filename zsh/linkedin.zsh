reviewboardid () {
  BRANCH=`git rev-parse --abbrev-ref head`
  git config --local --get branch.$BRANCH.reviewid
}
