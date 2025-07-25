#Docker

#[Doker Hup]([https://hub.docker.com/_/node]()) "wep Page"

#Creat Node App Use Express
`npm init`code

#Install express
`npm i express`
to reinstall
`npm i`

#install nodemen
to keep server work live
`npm i nodemon --save-dev`

### run app

`node index.js`

### add to Script header in  package.jsonhttps://hub.docker.com/_/node

`    "start": "node index.js",     "Start-dev":"nodemon index.js`

- to run  App
  `npm run start-dev`

# Creat doker file

- run doker to build `docker build -t node-app .`
- to view img
  `docker image ls`
- to run app from doker
  `docker run node-app`
  *or
  `docker run --name first   node-app`

  * to run app in defreant terminal
    `docker run --name first -d  node-app`
  * TO run and forwoerd port : we can seleact any port
    `docker run --name first -d -p 4000:4000   node-app`
- to view run comtiner
  `docker ps`
- docker stop
  `docker stop first`
- to romve doker continer
  `docker rm first -f` f : to stop run first
  -to start terminal for
  `docker exec -it node-app bash`
- to exit tarminal
  `exit`
- dokckerignore

* to romve file from continear
  -- creat file `.dockerignore`\

*** imortant Hot reload
to make doker leson to our change on the code

- change doker file to
  `CMD [ "npm","run" ,"start-dev"]\`
  -`docker run --name first -v 'bath':/app -d -p 4000:4000   node-app`
- to read &Edit  the main direction
  -`docker run --name first -v D:\drive\programing\doker\node-app:/app -d -p 4000:4000   node-app`
- to read onle :  the main direction :ro
  -`docker run --name first -v D:\drive\programing\doker\node-app:/app:ro -d -p 4000:4000 node-app`
- to read onle :  the main direction :ro
  `docker run --name first -v  D:\drive\programing\doker\node-app\src:/app:ro  -d -p 4000:4000 node-app`
- to print director
  -apple
  `docker run --name first -v $(pwd)/app:ro -d -p 4000:4000 node-app`
  -windows
  `docker run --name first -v "%cd%" /app:ro -d -p 4000:4000 node-app`
- to keep file in continer n ot lesson to change in locale  direct
  `docker run --name first -v  D:\drive\programing\doker\node-app:/app:ro -v /app/node_modules -d -p 4000:4000 node-app`
- Docker log

# Docker volume

-v "%cd%" : directorey
-v /app/node_modules
-d :run app in difreant terminal
-p :
-ro

- to open  file `cat index.js`

# docker-compose

-[docker-compose](https://docs.docker.com/compose/)

- creat yml file : code `docker-compose.yml`
- :to get help :`docker-compose --help `
- to start app from compose: `docker-compose up`
- to start app from compose: `docker-compose up -d`
- to stop `docker-compose down`

# doker inviermeant

- to add env to commeand
  `docker run --name first -v D:\drive\programing\doker\node-app:/app --env PORT=4000 --env NODE_ENV=development  -d -p 4000:4000   node-app`
- to check env from bash
  `printenv`
- 
- can use env file for all env command
  `code .env`
- print this in .env file

`PORT=4000 NODE_ENV=development`
run
` docker run --name first -v D:\drive\programing\doker\node-app:/app --env-file ./.env  -d -p 4000:4000   node-app`
`

- add it in compose file like env command
- ou
  -or add .env file to compse file
- to creat many compse file for difreant env creat yml file
to run by yml file name

  ` docker-compose -f docker-compose.dev.yml  up -d
  `
-combose file: the best creat nain file wuthe statuc strucuer then creat defreant yml file changes 
* creat spret file the to run many compose file


`
 docker-compose -f docker-compose.dev.yml -f docker-compose.yml  up -d
`
To re Build
`
docker-compose -f docker-compose.dev.yml -f docker-compose.yml 
 up -d --build
`
