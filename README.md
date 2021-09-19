# ci-project
I noticed that each project's build system provides build reports which can be viewed in web browser. So I decided to use this information to create a report for each commit.

To run my script you have to build the docker container and run it in a special way. So you should have docker installed. 

1. Clone this repo and cd into it
2. Build docker containter with ```docker build -t ci-project .```
3. Run it with ```docker run -e COMMITS_NUMBER=2 -p 8888:8888 ci-project```. You have to specify the port option to view build results in your browser. By default variable COMMITS_NUMBER, that is responsible for how many commits in each project will be build, is set to 2 since building many commits takes a lot of time. You can specify another value if you need to.
4. Wait until the execution is competed. You will see "Starting server with reports" message.
5. After that, there is a web-server launched in the docker container. Visit http://localhost:8888 to view build results.
