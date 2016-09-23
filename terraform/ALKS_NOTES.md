#AWS access with ALKS

Access AWS through [ALKS](https://fuel.coxautoinc.com/docs/DOC-73653)

How about using the [ALKS CLI](https://fuel.coxautoinc.com/docs/DOC-97406) for easily generating ALKS sessions as well as viewing existing sessions.


## installing

we can install node and all that to run this locally, but hey, why not use docker?

```
/ $ docker run -it -v ~:/root coxauto/alks-cli help developer
ALKS v1.5.1

  Usage: alks-developer [options] [command]


  Commands:

    configure   configures developer
    switch      switches alks account
    info        shows current developer configuration
    login       stores password
    logout      removes password
    help [cmd]  display help for [cmd]

  Options:

    -h, --help     output usage information
    -V, --version  output the version number


```

## I made an alias to docker so I don't need to type docker stuff every time:

```
/ $ cat ~/.profile | grep alks
alias alks='docker run -it -v ~:/root coxauto/alks-cli $@'
/ $ 

```


### Configure developer info

```
/ $ alks developer configure
ALKS v1.5.1
ALKS server:  https://alks.coxautoinc.com/rest
Network Username:  ddcdharris
Network Password:  ***********

? Save password Yes
? Please select an ALKS account/role 386693222418/ALKS_Admin - awscoxautolabs17 :: IAM-1-AdministratorAccessRole-6BLLNST0HT8I
Account saved!

/ $ alks developer info
ALKS v1.5.1

Developer Configuration
┌─────────────────────────┬──────────────────────────────────────────────────┐
│ Key                     │ Value                                            │
├─────────────────────────┼──────────────────────────────────────────────────┤
│ server                  │ https://alks.coxautoinc.com/rest                 │
├─────────────────────────┼──────────────────────────────────────────────────┤
│ userid                  │ ddcdharris                                       │
├─────────────────────────┼──────────────────────────────────────────────────┤
│ alksAccount             │ 386693222418/ALKS_Admin - awscoxautolabs17       │
├─────────────────────────┼──────────────────────────────────────────────────┤
│ alksRole                │ IAM-1-AdministratorAccessRole-6BLLNST0HT8I       │
├─────────────────────────┼──────────────────────────────────────────────────┤
│ Password                │ **********                                       │
└─────────────────────────┴──────────────────────────────────────────────────┘
/ $ 


```


### Create credentials 


Basic way to create credentials

```
/ $ alks keys create
ALKS v1.5.1
Your AWS session data has been generated and expires Today at 6:02 PM
{
    "accessKey": "*****",
    "secretKey": "*****",
    "sessionToken": "*******"
}

```

By listing out credentials, we can define the output with -o.
In this example I'm forcing overwriting the ~/.aws/credentials file with profile "cox-aws-alks"

```
/ $ alks keys list -o creds -n cox-aws-alks -f
ALKS v1.5.1

Available Keys
┌─────┬─────────────────────────┬─────────────────────────┬─────────────────────────┬─────────────────────────┐
│ #   │ Access Key              │ Secret Key              │ Expires                 │ Created                 │
├─────┴─────────────────────────┴─────────────────────────┴─────────────────────────┴─────────────────────────┤
│ ALKS Account: 386693222418/ALKS_Admin - awscoxautolabs17                                                    │
├─────┬─────────────────────────┬─────────────────────────┬─────────────────────────┬─────────────────────────┤
│ 1   │ ASIAIU**************    │ foqSDhswJuib**********… │ Today at 6:02 PM        │ 6 minutes ago           │
└─────┴─────────────────────────┴─────────────────────────┴─────────────────────────┴─────────────────────────┘
Use (1-1)? 1
Your AWS credentials file has been updated with the named profile: cox-aws-alks
/ $ cat ~/.aws/credentials 

[dharris-admin]

[cox-aws-alks]
aws_access_key_id=*****
aws_secret_access_key=****
aws_session_token=****



```