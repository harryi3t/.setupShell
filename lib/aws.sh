#!/bin/bash
#
# Sample for getting temp session token from AWS STS
#
# aws --profile youriamuser sts get-session-token --duration 3600 \
# --serial-number arn:aws:iam::012345678901:mfa/user --token-code 012345
#
# Once the temp token is obtained, you'll need to feed the following environment
# variables to the aws-cli:
#
# export AWS_ACCESS_KEY_ID='KEY'
# export AWS_SECRET_ACCESS_KEY='SECRET'
# export AWS_SESSION_TOKEN='TOKEN'

get_temp_creds_and_save_them () {
  AWS_CLI=`which aws`

  if [ $? -ne 0 ]; then
    echo "AWS CLI is not installed; exiting"
    return
  else
    echo "Using AWS CLI found at $AWS_CLI"
  fi

  # 1 or 2 args ok
  if [[ $# -ne 1 && $# -ne 2 ]]; then
    echo "Usage: mfa <MFA_TOKEN_CODE> <AWS_CLI_PROFILE>"
    echo "Where:"
    echo "   <MFA_TOKEN_CODE> = Code from virtual MFA device"
    echo "   <AWS_CLI_PROFILE> = aws-cli profile usually in $HOME/.aws/config"
    return
  fi

  echo "Reading config..."
  if [ -r ~/mfa.cfg ]; then
    . ~/mfa.cfg
  else
    echo "No config found in the home directory. Please create your mfa.cfg."
    echo "Put the following line in the mfa.cfg:"
    echo "default=\"arn:aws:iam::12345:mfa/user\""
    return
  fi

  MFA_TOKEN_CODE=$1
  AWS_CLI_PROFILE=${2:-default}
  ARN_OF_MFA=${default}


  echo ""
  echo "AWS-CLI Profile: $AWS_CLI_PROFILE"
  echo "MFA ARN: $ARN_OF_MFA"
  echo "MFA Token Code: $MFA_TOKEN_CODE"
  echo ""

  echo "Your Temporary Creds:"
  $AWS_CLI --profile $AWS_CLI_PROFILE sts get-session-token --duration 129600 \
    --serial-number $ARN_OF_MFA --token-code $MFA_TOKEN_CODE --output text \
     | awk '{printf("export AWS_ACCESS_KEY_ID=\"%s\"\nexport AWS_SECRET_ACCESS_KEY=\"%s\"\nexport AWS_SESSION_TOKEN=\"%s\"\nexport AWS_SECURITY_TOKEN=\"%s\"\n",$2,$4,$5,$5)}' | tee ~/.token_file
}

setToken () {
    get_temp_creds_and_save_them $1 $2
    source ~/.token_file
    echo "Your creds have been set in your env."
}

alias mfa=setToken

list_linux_agents () {
  aws ec2 describe-instances --filter Name=tag:resource-name,Values=ec2-linux  --query 'Reservations[*].Instances[*].[InstanceId,PrivateIpAddress,PublicIpAddress]' --output text
}
