# Terransible

These scripts are used for the "Deploy to AWS with Ansible and Terraform" course on Linux Academy.

## Setup

### Install Python

```bash
$ apt update
$ apt install python2.7
$ python --version
```

### Install Python Pip

```bash
$ apt install python-pip
$ pip install --upgrade pip
```

### Install Terraform

```bash
$ curl -O https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
$ apt-get install unzip
$ mkdir /bin/terraform 
$ unzip terraform_0.11.8_linux_amd64.zip -d /usr/local/bin/
$ terraform --version
```

### Install AWS Cli

```bash
$ python -m pip install awscli --upgrade
$ aws --version
$ apt-get update
```

### Install Ansible

```bash
$ apt-get install software-properties-common
$ apt-add-repository ppa:ansible/ansible
$ apt-get update
$ apt-get install ansible
$ ansible --version
```

### Configure Ansible

```bash
$ vi /etc/ansible/ansible.cfg
Uncomment "host_key_checking = False"
```

### Configure SSH Key

```bash
$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): /root/.ssh/kryptonite
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/kryptonite.
Your public key has been saved in /root/.ssh/kryptonite.pub.
The key fingerprint is:
SHA256:D6zbO5EZcw9p1uf64OyR/Ulg4La/Cw4oiVNtsZMRHLo root@fsantosccs3.mylabserver.com
The key's randomart image is:
+---[RSA 2048]----+
|                 |
|                 |
|                 |
|                 |
|                 |
|                 |
|                 |
+----[SHA256]-----+

$ ssh-agent bash
$ ssh-add /root/.ssh/kryptonite
Identity added: /root/.ssh/kryptonite (/root/.ssh/kryptonite)
$ ssh-add -l
2048 SHA256:******************************* /root/.ssh/kryptonite (RSA)
```

### Configure Aws Iam

1. Login to Aws Console
2. Got To IAM Service
3. Add user (Access Type = Programmatic access)
4. Click on Attach existing policies directly and Administrator Access
5. Download .csv file with Access Key Id and Secret Access Key


### Configure Aws Cli

**Use the credentials in .csv file**
**Should configure default region**

```bash
$ aws configure --profile superhero
# To Test
$ aws ec2 describe-instances --profile superhero --region us-east-1
```

### Create Delegation-Set

**Execute the command and store ID Value**

```bash
$ aws route53 create-reusable-delegation-set --caller-reference 1224 --profile superhero
{
    "Location": "https://route53.amazonaws.com/2013-04-01/delegationset/*********", 
    "DelegationSet": {
        "NameServers": [
            "*************", 
            "*************", 
            "*************", 
            "*************", 
        ], 
        "CallerReference": "1224", 
        "Id": "/delegationset/<ID>"
    }
}
```

## Deploy

1. Clone project
2. Edit terraform.tfvars and change the vars. (It's mandatory change local ip and delegation_set. Should use delegation obtained in prior step)
3. Execute terraform int
4. Execute terraform apply
5. Execute terraform destroy

# Documentation

[Original Repo](https://github.com/linuxacademy/terransible)

[Infrastructure flowchart](https://www.lucidchart.com/documents/view/cde66bf1-8505-49b9-bcda-b1100a0f10b3/0)

