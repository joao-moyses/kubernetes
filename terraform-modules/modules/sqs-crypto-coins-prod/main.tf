resource "aws_sqs_queue" "link" {
  name                              = "exchange-linkbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 130
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "link" {
  value = aws_sqs_queue.link.url
}


resource "aws_sqs_queue" "mkr" {
  name                              = "exchange-mkrbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 130
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "mkr" {
  value = aws_sqs_queue.mkr.url
}


resource "aws_sqs_queue" "ape" {
  name                              = "exchange-apebrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 130
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "ape" {
  value = aws_sqs_queue.ape.url
}



resource "aws_sqs_queue" "inch" {
  name                              = "exchange-1inchbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "inch" {
  value = aws_sqs_queue.inch.url
}


resource "aws_sqs_queue" "aave" {
  name                              = "exchange-aavebrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 130
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "aave" {
  value = aws_sqs_queue.aave.url
}



resource "aws_sqs_queue" "comp" {
  name                              = "exchange-compbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 130
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "comp" {
  value = aws_sqs_queue.comp.url
}



resource "aws_sqs_queue" "uni" {
  name                              = "exchange-unibrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "uni" {
  value = aws_sqs_queue.uni.url
}



resource "aws_sqs_queue" "mana" {
  name                              = "exchange-manabrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 130
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "mana" {
  value = aws_sqs_queue.mana.url
}


resource "aws_sqs_queue" "bat" {
  name                              = "exchange-batbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "bat" {
  value = aws_sqs_queue.bat.url
}


resource "aws_sqs_queue" "gala" {
  name                              = "exchange-galabrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "gala" {
  value = aws_sqs_queue.gala.url
}



resource "aws_sqs_queue" "luna" {
  name                              = "exchange-lunabrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "luna" {
  value = aws_sqs_queue.luna.url
}



resource "aws_sqs_queue" "cro" {
  name                              = "exchange-crobrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "cro" {
  value = aws_sqs_queue.cro.url
}



resource "aws_sqs_queue" "dai" {
  name                              = "exchange-daibrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "dai" {
  value = aws_sqs_queue.dai.url
}


resource "aws_sqs_queue" "trx" {
  name                              = "exchange-trxbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "trx" {
  value = aws_sqs_queue.trx.url
}


resource "aws_sqs_queue" "bnb" {
  name                              = "exchange-bnbbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "bnb" {
  value = aws_sqs_queue.bnb.url
}



resource "aws_sqs_queue" "theta" {
  name                              = "exchange-thetabrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "theta" {
  value = aws_sqs_queue.theta.url
}



resource "aws_sqs_queue" "vet" {
  name                              = "exchange-vetbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "vet" {
  value = aws_sqs_queue.vet.url
}



resource "aws_sqs_queue" "ftm" {
  name                              = "exchange-ftmbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "ftm" {
  value = aws_sqs_queue.ftm.url
}



resource "aws_sqs_queue" "enj" {
  name                              = "exchange-enjbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "enj" {
  value = aws_sqs_queue.enj.url
}



resource "aws_sqs_queue" "chz" {
  name                              = "exchange-chzbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "chz" {
  value = aws_sqs_queue.chz.url
}



resource "aws_sqs_queue" "yfi" {
  name                              = "exchange-yfibrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "yfi" {
  value = aws_sqs_queue.yfi.url
}



resource "aws_sqs_queue" "grt" {
  name                              = "exchange-grtbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "grt" {
  value = aws_sqs_queue.grt.url
}



resource "aws_sqs_queue" "sushi" {
  name                              = "exchange-sushibrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "sushi" {
  value = aws_sqs_queue.sushi.url
}



resource "aws_sqs_queue" "waves" {
  name                              = "exchange-wavesbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "waves" {
  value = aws_sqs_queue.waves.url
}


resource "aws_sqs_queue" "morph" {
  name                              = "exchange-morphbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "morph" {
  value = aws_sqs_queue.morph.url
}



resource "aws_sqs_queue" "vxv" {
  name                              = "exchange-vxvbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "vxv" {
  value = aws_sqs_queue.vxv.url
}


resource "aws_sqs_queue" "atlas" {
  name                              = "exchange-atlasbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "atlas" {
  value = aws_sqs_queue.atlas.url
}



resource "aws_sqs_queue" "polis" {
  name                              = "exchange-polisbrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 30
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "polis" {
  value = aws_sqs_queue.polis.url
}



resource "aws_sqs_queue" "ldo" {
  name                              = "exchange-ldobrl.fifo"
  fifo_queue                        = true
  content_based_deduplication       = true
  delay_seconds                     = 0
  receive_wait_time_seconds         = 0 
  visibility_timeout_seconds        = 130
  message_retention_seconds         = 345600
  max_message_size                  = 262144
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300

}


output "ldo" {
  value = aws_sqs_queue.ldo.url
}
