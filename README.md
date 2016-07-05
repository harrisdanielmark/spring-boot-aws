# spring-boot-aws
Demo app is built with Spring Boot and Angular and uses AWS EC2, MySQL RDS and S3 Storage. Some screenshots below.


![access_app_on_ec2](https://cloud.githubusercontent.com/assets/2404172/14990684/9dee567e-1155-11e6-8b98-46bc3760edfc.png)


![image](https://cloud.githubusercontent.com/assets/2404172/14990798/31f875c0-1156-11e6-8ad6-ab94c5d166b3.png)


![image](https://cloud.githubusercontent.com/assets/2404172/14990816/490e52c0-1156-11e6-9bd8-641877f2b3a1.png)


![image](https://cloud.githubusercontent.com/assets/2404172/14990857/93040d02-1156-11e6-83ba-afeb42b8f74f.png)


## local development

To start the application Localy, set the environment variable `spring.application.json` with a value:
```
{
 "rdsDatabaseName": "<SET PROPER VALUE>",
 "rdsDbInstanceIdentifier": "<SET PROPER VALUE>",
 "rdsPassword": "<SET PROPER VALUE>",
 "rdsUsername": "<SET PROPER VALUE>",
 "awsAccessKey": "<SET PROPER VALUE>",
 "awsSecretKey": "<SET PROPER VALUE>",
 "awsRegion": "<SET PROPER VALUE>",
 "s3BucketName": "<SET PROPER VALUE>"
}
```