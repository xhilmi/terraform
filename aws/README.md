# Terraform Amazon Web Services on Linux
1. apt install Terraform on master-vm : [github](https://github.com/hilmi-afifi/terraform/blob/master/install_terraform.sh)
2. apt install SDK on master-vm : [github](https://raw.githubusercontent.com/hilmi-afifi/terraform/master/aws/install_sdk.sh) & [reference](https://devopscube.com/install-configure-aws-cli-linux/)
3. create service accounts on AWS : [youtube](https://www.youtube.com/watch?v=HuE-QhrmE1c&ab_channel=AOSNote) & [official](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html)
  - aws configure
  - export AWS_DEFAULT_PROFILE=<PROFILE_NAME>
  - echo $AWS_DEFAULT_PROFILE
  - export AWS_PROFILE=<PROFILE_NAME>
  - echo $AWS_PROFILE
  
4. running usable terraform command :  
