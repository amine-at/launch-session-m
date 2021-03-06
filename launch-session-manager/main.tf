resource "aws_ssm_document" "session_manager_prefs" {
  name            = "SSM-SessionManagerRunShell"
  document_type   = "Session"
  document_format = "JSON"

  content = <<DOC
{
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
        "s3BucketName": "session-manager-logs-at",
        "s3KeyPrefix": "session-manager-logs-at/ssm/session-logs",
        "s3EncryptionEnabled": false,
        "cloudWatchLogGroupName": "/logs/sessions",
        "cloudWatchEncryptionEnabled": false
    }
}
DOC
}
#  content = <<DOC
#{
#    "schemaVersion": "1.0",
#    "description": "Document to hold regional settings for Session Manager",
#    "sessionType": "Standard_Stream",
#    "inputs": {
#        "s3BucketName": "${var.s3_bucket_name}",
#        "s3KeyPrefix": "${var.s3_key_prefix}",
#        "s3EncryptionEnabled": "${var.s3_encryption_enabled}",
#        "cloudWatchLogGroupName": "${var.cloudwatch_log_group_name}",
#        "cloudWatchEncryptionEnabled": "{var.cloudwatch_encryption_enabled}"
#    }
#}
#DOC
#}
