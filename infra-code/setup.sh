#!/bin/bash
if [ $# -eq 0 ]
  then
    echo '''
    No arguments supplied
    Usage : script-name <Action>
    Available actions : 1) terraform_init 2) terraform_plan  3) terraform_apply  4) helm_dry_run 5) helm
    '''
fi
action=$1

case $action in
  terraform_init)
     echo "execuing terraform init"
     cd terraform/
     terraform init
     cd -
     ;;

  terraform_plan)
     echo "execuing terraform plan"
     cd terraform/
     terraform plan -target module.go_app_vpc
     terraform plan -target module.go_app_eks
     terraform plan -target module.aurora_cluster
     cd -
     ;;

 terraform_apply)
     echo "execuing terraform apply"
     cd terraform/
     terraform apply -auto-approve -target module.go_app_vpc
     terraform apply -auto-approve -target module.go_app_eks
     terraform apply -auto-approve -target module.aurora_cluster
     cd -
     ;;

  helm_dry_run)
     echo "Enter db password: "
     read PSWD
     echo "deploying app using helm"
     aws eks update-kubeconfig --name go_app --region us-east-2
     cd helm
     helm upgrade --install  go-app go-app  --set db.password=$PSWD --dry-run
     cd -
     ;;

  helm)
     echo "Enter db password: "
     read PSWD
     echo "deploying app using helm"
     aws eks update-kubeconfig --name go_app --region us-east-2
     cd helm
     helm upgrade --install  go-app go-app  --set db.password=$PSWD
     cd -
     ;;

  *)
    echo  "Please provide valid option"
    echo -n "Options: 1) terraform_plan  2) terraform_apply  3) helm"
esac
