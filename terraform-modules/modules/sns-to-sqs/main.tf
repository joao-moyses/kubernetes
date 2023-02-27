resource "aws_sqs_queue" "sqs" {
  name = "taas-networks"
  
}

resource "aws_sqs_queue_policy" "test" {
  queue_url = aws_sqs_queue.sqs.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.sqs.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.example.arn}"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_sns_topic" "example" {
  name = "networks-monitor"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.example.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs.arn
  raw_message_delivery = true
}


resource "aws_sqs_queue" "sqs1" {
  name                 = "ethereum-monitoring"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs2" {
  name                 = "bitcoin-monitoring"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs3" {
  name                 = "gnosis-monitoring"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs4" {
  name                 = "binance-monitoring"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs5" {
  name                 = "polygon-monitoring"
  kms_master_key_id    = "alias/aws/sqs"
  
}