#!/bin/bash

echo "<h1>Astminer build info by commit</h1>" >> /reports/index.html
mkdir /reports/astminer

cd /astminer

commits=$(git log --pretty=format:'%H' -n $COMMITS_NUMBER)

for commit in $commits
do
    rm -rf ./build/astminer/reports

    git checkout $commit -f
    ./gradlew build

    mkdir /reports/astminer/$commit

    cp -r ./build/astminer/reports/tests/test /reports/astminer/$commit

    echo "<a href=\"astminer/$commit/test/index.html\">$commit</a><br>" >> /reports/index.html
done
