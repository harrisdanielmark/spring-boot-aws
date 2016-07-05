package com.blog.samples.boot.config;

import org.springframework.cloud.aws.context.config.annotation.EnableContextCredentials;
import org.springframework.cloud.aws.context.config.annotation.EnableContextRegion;
import org.springframework.cloud.aws.context.config.annotation.EnableContextResourceLoader;
import org.springframework.cloud.aws.jdbc.config.annotation.EnableRdsInstance;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableRdsInstance(databaseName = "${rdsDatabaseName}",
        dbInstanceIdentifier = "${rdsDbInstanceIdentifier}",
        username = "${rdsUsername}",
        password = "${rdsPassword:}")
@EnableContextCredentials(accessKey="${awsAccessKey}", secretKey="${awsSecretKey}" )
@EnableContextRegion(region="${awsRegion}")
@EnableContextResourceLoader
public class AwsResourceConfig {

}