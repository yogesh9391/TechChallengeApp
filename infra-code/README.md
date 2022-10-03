## pre-requisites
1. install required tools   
   install terraform v1.3.0   
   install helm v3    
   install aws cli    
         
 export Access key id and secret id
    export AWS_ACCESS_KEY_ID=<ACCES-KEY>    
    export AWS_SECRET_ACCESS_KEY=<SECRET-KEY_ID>     
      
OR if create  role and attach to the underlying instance.

2. default vpc cidr is 10.0.0.0/16. If this is not available in your account, please change it and accordingly change subnets cidrs.

## set up infra and deploy application
run setup.sh script to setup infratsructure using terraform and deploying the application using helm charts.
Sequence of the steps would be as-
1. Initialise terraform
```
bash setup.sh terraform_init
```

2. see terraform plan
```
bash setup.sh terraform_plan
```

3. apply terraform changes
```
bash setup.sh terraform_apply
```

4. deploy application with dry run
```
bash setup.sh helm_dry_run
```

5. deploy application
```
bash setup.sh helm
```

**Note:-**
After successful deployment of application, it will create one kuberntes service of type load balancer and would be deployed in public subnet. You can hit the LB endpoint to access the Front end of the application.

## tech stack used
1. AWS EKS
2. RDS aurora
3. terraform
4. Helm



## Architecture
![eks-rds](https://user-images.githubusercontent.com/8499534/193521831-58acb4de-1af1-454b-a12a-4bd6fb8b0a95.jpg)



## future enhancements
1. terraform backend :-
    for simplicity, I used local backend. However, one can use S3 remote backend with dynamoDB table for state locking.
2. terragrunt, terracost can be used for IAC management.
3. route53 alias for ALB. ALB is listening on non https port, We can use ACM and make ALB to listen on 443.
4. At web layer, we can use WAF (WeB Application Firewall).
5. Better auditing and monitoring can be done using cloudwatch, prometheus and EKS auditing feature.
6. docker image has root privilages, we can recreate dockerfile with non-root user.
7. Vertical Pod Autoscaler for resource consumption optimisation.
8. cluster level security   
    -> CIS benchmarks   
    -> hardened worker node images   
    -> pod security policies/ Open Policy Agent   
    -> security context   
    -> network policies    
    -> Service mesh like istio for TLS based traffic within cluster.    
