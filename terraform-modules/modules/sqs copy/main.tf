provider "aws" {
  access_key = "ASIA4UHTCK7HUXRUDUU5"
  secret_key = "E/IUMDBG9gritbCAdsgkvjBd86R2VpFfhr0/zxVC"
  token      = "IQoJb3JpZ2luX2VjEMX//////////wEaCXVzLWVhc3QtMSJGMEQCIG6mzLAMiFZqx+MNhaaStee1lCwIKvJi+nB8Xgj65DnSAiBYPhARaNntJ9qZVh210AIy37N+MKTzun3Pli9FCx9FziqeAwje//////////8BEAAaDDg2ODA5MzE1NTI3OSIM+13Xo8KjyE0oKPYxKvICB76I2bkB3Tw+ru4KvWEf8K4T55grQ/1NNraJwDgjhkemoLkCmVPhdE8tLlMMIHlO/wboJT7ddW0gQ2Kg0dxmytqLoGJMsTlghRnal0stbmt+JWD8+d5kIow8UBca1HfuTmqXyXl/b6tF/LZ0cnsF5sum+gOtsLzzBJUC1qJOyeuH0CyDWQ/rXQstfZkcmhtYRjAfXsLFuNYnFBE7ZWS4aJOto52uHGQw6zrbrhWm24OLxDxzFQEjbGDPCgycYcuRKspRPtdSGPYBBU6peUQg/DpXK0MUnBYpDAeGAs+W9V4Gla1moxp40pc6JTYIG0IApR4wTGUZFGW9nYbVCS8DL039KH7DjnKJd2dz3uga/+M/z+aW+tokQ067+ss9/9cS+q1yHr04LWYi2k/xE5wSPJDGFdR7GUoBgzMjBMvquuSnYcetmFtoMcfUNwqMBLRR8iRZCsWzz5ZUp/JyUZ71ZhJI6+/C623paT5k0rtTNBgI8jDUp+iVBjqnAfC3XfEf0Dq0LTxXJiapE5N7hmvesO+PGZKFLB5gZ2tEAMJ76jWimdMgohMTrJegoxdTyIiAhLJoP49I5F8aoMS9uHnwi5NR9qShgd4D9KFMFQ+guo7OdP/Qtxb0IlL9k3MYasVLMdcBE5JuSn5lAQ+/1x9cq9mG53WPHHGYKILM3dTY7X/iDYe7eGf6Qax8jOZZdIhicP6aXNIiMqY/VkHQU9N6r+IR"
  region     = "us-east-1"
}


resource "aws_sqs_queue" "terraform_queue" {
  name                              = "terraform-example-queue.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.deadletter_queue.arn,
    maxReceiveCount     = 3
  })
  tags = {
    Name = "fifo"
  }
}

resource "aws_sqs_queue" "deadletter_queue" {
  name                              = "dlq.fifo"
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  fifo_queue                        = true
  content_based_deduplication       = true
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
  max_message_size                  = 262144
}