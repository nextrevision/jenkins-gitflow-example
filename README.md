# jenkins-gitflow-example

Reference for a gitflow job workflow

## Usage

Build the container

    docker build -t jenkins-gitflow-example .

Run the container

    docker run -p 8080:8080 -v $(pwd)/jjb:/etc/jenkins_jobs/config jenkins-gitflow-example

Once Jenkins has initialized, update the jobs:

    docker exec <container_id> /usr/local/bin/jjb_update.sh

Anytime you hack on the JJB config, just rerun the command above to apply your changes.
