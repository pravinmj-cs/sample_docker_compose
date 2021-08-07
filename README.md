# Sample Docker compose for python projects

Sample docker compose stack for python/Django local and development environments.

- Dockerfile can be tweaked for any python projects
- change sample_project, sample_user, sample_pwd to your respective project names and DB credentials
- .env.db holds the environment variables.

After changes Bring the docker stack with. Include -d for detached mode.

> docker-compose up --build

To bring down the stack, 
> docker-compose down 
