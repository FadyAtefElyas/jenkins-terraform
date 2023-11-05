 #!/bin/bash
   export REGION="us-central1" CLUSTER_NAME="node-app-cluster" CLUSTER_REGION="europe-west6" PROJECT_NAME="fady-401509" REPO_NAME="my-repository"
   # Install Docker
   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh get-docker.sh
   
   # install kubectl 
   sudo apt-get install kubectl 
   
   # install gcloud auth plugin using this command
   sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
   
   # log in to your cluster
   gcloud container clusters get-credentials "$CLUSTER_NAME" --region "$CLUSTER_REGION" --project "$PREJECT_NAME"
   
   # Log in to Docker Hub
   gcloud auth print-access-token | sudo docker login -u oauth2accesstoken --password-stdin $REGION-docker.pkg.dev

   # Pull and push the images
   sudo docker pull petro8/node-app
   sudo docker tag docker.io/petro8/node-app:latest $REGION-docker.pkg.dev/$PROJECT_NAME/$REPO_NAME/petro8/node-app:v1
   sudo docker push $REGION-docker.pkg.dev/$PROJECT_NAME/$REPO_NAME/petro8/node-app:v1
   
   
   ############
