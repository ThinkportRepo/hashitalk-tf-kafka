resource "aws_iam_role" "iam-ssm-kafka-host-role" {

  name              = "iam-ssm-kafka-host-role"
  description       = "Host Role to enable Systems Manager"
  assume_role_policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2-iam-ssm-kafka-host-role-attach" {
  role       = aws_iam_role.iam-ssm-kafka-host-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ec2-iam-ssm-kafka-host-role-attach_1" {
  role       = aws_iam_role.iam-ssm-kafka-host-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonSSMAutomationRole"
}

resource "aws_iam_role_policy_attachment" "ec2-iam-ssm-kafka-host-role-attach_2" {
  role       = aws_iam_role.iam-ssm-kafka-host-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

// Role for Cloudwatch
resource "aws_iam_role_policy_attachment" "ec2-iam-ssm-kafka-host-role-attach_3" {
  role       = aws_iam_role.iam-ssm-kafka-host-role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}


resource "aws_iam_instance_profile" "ec2-iam-kafka-ssm-profile" {
  name = "ec2-iam-kafka-ssm-profile"
  role = aws_iam_role.iam-ssm-kafka-host-role.name
}


