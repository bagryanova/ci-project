#!/bin/bash

echo "<h1>Morphia build info by commit</h1>" >> /reports/index.html
mkdir /reports/morphia

cd /morphia

commits=$(git log --pretty=format:'%H' -n $COMMITS_NUMBER)

for commit in $commits
do
    git checkout $commit -f
    mvn install -DskipTests

    export MONGODB=4.4.6
    mvn surefire:test -Ddriver.version=4.2.3

    mkdir /reports/morphia/$commit

    cp -r ./core/target/surefire-reports /reports/morphia/$commit

    echo "<a href=\"morphia/$commit/surefire-reports/index.html\">$commit</a><br>" >> /reports/index.html
done
