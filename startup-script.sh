 #!/bin/bash
   export REGION="us-central1" CLUSTER_NAME="node-app-cluster" CLUSTER_REGION="europe-west6" PROJECT_NAME="fady-401509" REPO_NAME="my-repository"
   # Install Docker
   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh get-docker.sh
   
   # Log in to Docker Hub
   gcloud auth print-access-token | sudo docker login -u oauth2accesstoken --password-stdin $REGION-docker.pkg.dev

   # Pull and push the images
   sudo docker pull fadyelyas/hello-app:latest
   sudo docker tag docker.io/fadyelyas/hello-app:latest $REGION-docker.pkg.dev/$PROJECT_NAME/$REPO_NAME/fadyelyas/hello-app:latest
   sudo docker push $REGION-docker.pkg.dev/$PROJECT_NAME/$REPO_NAME/fadyelyas/hello-app:latest
   
   
   ############
