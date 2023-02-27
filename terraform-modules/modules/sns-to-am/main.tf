resource "aws_sqs_queue" "sqs1" {
  name                 = "btc-account"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs2" {
  name                 = "eth-account"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs3" {
  name                 = "bsc-account"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs4" {
  name                 = "gnosis-account"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs5" {
  name                 = "polygon-account"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs6" {
  name                 = "btc-transaction"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs7" {
  name                 = "eth-transaction"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs8" {
  name                 = "bsc-transaction"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs9" {
  name                 = "gnosis-transaction"
  kms_master_key_id    = "alias/aws/sqs"
  
}


resource "aws_sqs_queue" "sqs10" {
  name                 = "polygon-transaction"
  kms_master_key_id    = "alias/aws/sqs"
  
}