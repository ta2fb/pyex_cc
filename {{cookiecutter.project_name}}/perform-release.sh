#! /bin/bash

{% raw %}
function echodt {
  echo "`date`: $1"
}

# https://stackoverflow.com/questions/4023830/how-to-compare-two-strings-in-dot-separated-version-format-in-bash
function vercomp {
    if [[ $1 == $2 ]]; then
      return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++)); do
      ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++)); do
      if [[ -z ${ver2[i]} ]]; then
        # fill empty fields in ver2 with zeros
        ver2[i]=0
      fi
      if ((10#${ver1[i]} > 10#${ver2[i]})); then
        return 1
      fi
      if ((10#${ver1[i]} < 10#${ver2[i]})); then
        return 2
      fi
    done
    return 0
}

function check_release_command {
  if [ $1 -eq 0 ]; then
    echodt "Release command successful, proceeding"
  else
    echodt "Release command failed, exiting"
    exit 1
  fi
}

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 x.y.z"
  exit 1
else
  RELEASE_VERSION=$1
  REGEXP="^[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}$"
  if [[ "$RELEASE_VERSION" =~ $REGEXP ]]; then
    echo "The candidate release version $RELEASE_VERSION format is correct, proceeding"
    # get latest tag
    LATEST_TAG=`git tag -l | sort -n | tail -1`
    # if there are no tags, set latest to 0.0.0
    if [ -z "$LATEST_TAG" ]; then
      LATEST_TAG="0.0.0"
    fi
    vercomp $LATEST_TAG $RELEASE_VERSION
    RETVAL=$?
    if [ $RETVAL -eq 2 ]; then
      echo "The candidate release version $RELEASE_VERSION is higher than $LATEST_TAG, proceeding"
    else
      echo "The candidate release version $RELEASE_VERSION is equal to or lower than $LATEST_TAG, exiting"
      exit 1
    fi
  else
    echo "The candidate release version $RELEASE_VERSION format is invalid, exiting"
    exit 1
  fi
fi

if [ "`git diff-index HEAD --`" == '' ]; then
  echodt "There are no uncommitted changes, proceeding"
else
  echodt "There are uncommitted changes, exiting"
  exit 1
fi

echodt "Running the tox release command"
tox -e release
RETVAL=$?
check_release_command $RETVAL

echodt "Tagging commit as $RELEASE_VERSION"
git tag $RELEASE_VERSION

echodt "Running the tox release command to build $RELEASE_VERSION"
tox -e release
RETVAL=$?
check_release_command $RETVAL
{% endraw %}
echodt "Pushing the $RELEASE_VERSION artifacts to the s3pypi bucket"
s3pypi --bucket {{cookiecutter.s3pypi_bucket}}

echodt "Pushing the $RELEASE_VERSION documentation to the s3pypi bucket"
aws s3 sync --acl public-read build/sphinx/html/ s3://{{cookiecutter.s3pypi_bucket}}/docs/{{cookiecutter.package_name}}/${RELEASE_VERSION}/

echo
echodt "The release has been successfully completed - Be sure to push master and tags to origin"
echo
