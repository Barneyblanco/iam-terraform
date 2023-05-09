data "aws_caller_identity" "current" {}

resource "aws_cloudtrail" "xyz" {
  name                          = "${local.name}-${local.prefix}"
  s3_bucket_name                = aws_s3_bucket.xyz.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = true
}

resource "aws_s3_bucket" "xyz" {
  bucket        = "${local.name}-${local.prefix}"
  force_destroy = true
}

data "aws_iam_policy_document" "xyz" {
  statement {
    sid    = "AWSCloudTrailAclCheck"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.xyz.arn]
  }

  statement {
    sid    = "AWSCloudTrailWrite"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.xyz.arn}/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
}
resource "aws_s3_bucket_policy" "xyz" {
  bucket = aws_s3_bucket.xyz.id
  policy = data.aws_iam_policy_document.xyz.json
}