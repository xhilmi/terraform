# Terraform Amazon Web Services on Linux
1. apt install Terraform on master-vm : [github](https://github.com/hilmi-afifi/terraform/blob/master/install_terraform.sh)
2. apt install SDK on master-vm : [github](https://raw.githubusercontent.com/hilmi-afifi/terraform/master/aws/install_sdk.sh) & [reference](https://devopscube.com/install-configure-aws-cli-linux/)
3. create service accounts on AWS : [youtube](https://www.youtube.com/watch?v=HuE-QhrmE1c&ab_channel=AOSNote) & [official](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html)
  - Open thegit IAM console at https://console.aws.amazon.com/iam/
  - On the navigation menu, choose menu Users.
  - Add users Terraform
  - Add permissions AdministratorAccess
  - Create and save access key
  4. running usable terraform command

# Usefull command
  - git filter-branch -f --index-filter 'git rm --cached -r --ignore-unmatch .terraform/'
  - export AWS_DEFAULT_PROFILE=<PROFILE_NAME>
  - echo $AWS_DEFAULT_PROFILE
  - export AWS_PROFILE=<PROFILE_NAME>
  - echo $AWS_PROFILE
  - aws configure
  - aws sts get-caller-identity
  - aws ec2 describe-instance-types [https://aws.amazon.com/ec2/instance-types]
  - aws ec2 describe-instance-types --filters "Name=instance-type,Values=t2"
  - aws ec2 describe-instance-types --filters "Name=instance-type,Values=t*" --query 'InstanceTypes[*].[InstanceType,VCpuInfo.DefaultVCpus,MemoryInfo.SizeInMiB]' --output table
  - aws ec2 describe-instance-types --filters "Name=instance-type,Values=t*" --query 'sort_by(InstanceTypes, &MemoryInfo.SizeInMiB)[*].[InstanceType,VCpuInfo.DefaultVCpus,MemoryInfo.SizeInMiB]' --output table | sed '1s/^/-------------------------------\n| InstanceType | CPU | Memory |\n/'
  - aws ec2 describe-instance-types --filters "Name=current-generation,Values=true" "Name=memory-info.size-in-mib,Values=65536" --query "InstanceTypes[*].cll
  [InstanceType]" --output text | sort
  - aws ec2 describe-subnets
  - aws ec2 describe-vpcs