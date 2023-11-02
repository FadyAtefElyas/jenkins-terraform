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
   sudo docker pull cvallance/mongo-k8s-sidecar
   sudo docker tag docker.io/cvallance/mongo-k8s-sidecar:latest $REGION-docker.pkg.dev/$PROJECT_NAME/$REPO_NAME/cvallance/mongo-k8s-sidecar:v1
   sudo docker push $REGION-docker.pkg.dev/$PROJECT_NAME/$REPO_NAME/cvallance/mongo-k8s-sidecar:v1

   sudo docker pull fadyelyas/mongo:v2
   sudo docker tag docker.io/fadyelyas/mongo:v2 $REGION-docker.pkg.dev/$PROJECT_NAME/$REPO_NAME/fadyelyas/mongo:v2
   sudo docker push $REGION-docker.pkg.dev/$PROJECT_NAME/$REPO_NAME/fadyelyas/mongo:v2
   
   sudo docker pull fadyelyas/node-app:v1
   sudo docker tag docker.io/fadyelyas/node-app:v1 $REGION-docker.pkg.dev/$PROJECT_NAME/$REPO_NAME/fadyelyas/node-app:v1
   sudo docker push $REGION-docker.pkg.dev/$PROJECT_NAME/$REPO_NAME/fadyelyas/node-app:v1
   
   # install git
   sudo apt update
   sudo apt install git -y
   
      # clone yaml-files-repo
   git clone https://github.com/FadyAtefElyas/yaml-files.git
   
   cd yaml-files/
   kubectl apply -f .
   cd ../
   
   sudo google_metadata_script_runner startup
   
   ############
