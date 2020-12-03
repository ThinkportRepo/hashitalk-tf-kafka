###########################################
################ Key Pair #################
###########################################

resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "YourKey"
  public_key = tls_private_key.key_pair.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.key_pair.private_key_pem
  filename = "./../../secret/YourKey.pem"
}

resource "null_resource" "private_key_permissions" {
  depends_on = [local_file.private_key]

  provisioner "local-exec" {
    command     = "chmod 600 ./../../secret/YourKey.pem"
    interpreter = ["bash", "-c"]
    on_failure  = continue
  }
}