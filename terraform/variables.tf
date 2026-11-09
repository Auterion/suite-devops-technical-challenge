variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "candidate" {
  description = "Your name, used to tag every resource you create (set with TF_VAR_candidate)"
  type        = string
}
