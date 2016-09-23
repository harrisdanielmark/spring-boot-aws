# running with profile

Unable to use the profile command in the aws provider configuration so I had to use the environment veariable AWS_PROFILE=cox-aws-alk which is configured localy in ~/.aws/credentials


```
AWS_PROFILE=cox-aws-alk terraform plan -var 'aws_db_username=rdssampleuser' -var 'aws_db_password=rdssamplepassword'

```


# connect to db

```mysql -u rdssampleuser -h exampleawshostat.us-west-1.rds.amazonaws.com -p```




