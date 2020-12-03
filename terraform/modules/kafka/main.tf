resource "aws_instance" "kafka" {
  
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  ami           = var.region_ami[var.region]

  #user_data     = templatefile("./../../modules/kafka/installk.sh.tpl", {})
  vpc_security_group_ids      = [aws_security_group.kafka.id]
  associate_public_ip_address   = true
  availability_zone           = element(var.availability_zone, count.index)
  iam_instance_profile        = var.instanceprofile
  volume_tags                 = var.tags

  tags = merge(
      var.tags,
      {
        Name        = "${var.component_name}-${var.region}-ec2-${var.environment}-${var.instancename}-${format("%03d", count.index + 1)}"
      },
  ) 

  root_block_device {
    volume_size = var.volume_size
  }
 
  depends_on = [aws_security_group.kafka]
  count      = var.instance_count
}

