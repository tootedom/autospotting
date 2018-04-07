# Autospotting configuration
variable "asg_allowed_instance_types" {
  description = <<EOF
Comma separated list of allowed instance types for spot requests,
in case you want to allow specific types (also support globs).

Example: 't2.*,m4.large' or special value: 'current': the same as initial on-demand instances
EOF
  default     = ""
}

variable "asg_disallowed_instance_types" {
  description = <<EOF
Comma separated list of disallowed instance types for spot requests,
in case you want to exclude specific types (also support globs).

Example: 't2.*,m4.large'
EOF
  default = ""
}

variable "asg_min_on_demand_number" {
  description = "Minimum on demand number for all ASG enabled"
  default     = "0"
}

variable "asg_min_on_demand_percentage" {
  description = "Minimum on demand percentage for all ASG enabled"
  default     = "0.0"
}

variable "asg_on_demand_price_multiplier" {
  description = "Multiplier for the on-demand price"
  default     = "1.0"
}

variable "asg_spot_product_description" {
  description = "The Spot Product or operating system to use when looking up spot price history in the market. Valid choices: Linux/UNIX | SUSE Linux | Windows | Linux/UNIX (Amazon VPC) | SUSE Linux (Amazon VPC) | Windows (Amazon VPC)"
  default     = "Linux/UNIX (Amazon VPC)"
}

variable "asg_spot_price_buffer_percentage" {
  description = "Percentage above the current spot price to place the bid"
  default     = "10.0"
}

variable "asg_bidding_policy" {
  description = "Choice of bidding policy for the spot instance"
  default     = "normal"
}

variable "asg_regions_enabled" {
  description = "Regions in which autospotting is enabled"
  default     = ""
}

variable "asg_tag_filters" {
  description = "Tags to filter which ASGs autospotting considers.  If blank by default this will search for asgs with spot-enabled=true.  You can set this to many tags, for example: spot-enabled=true,Environment=dev,Team=vision"
  default     = ""
}

# Lambda configuration
variable "lambda_zipname" {
  description = "Name of the archive"
  default     = "../build/s3/nightly/lambda.zip"
}

variable "lambda_s3_bucket" {
  description = "Bucket which the archive is stored in"
  default     = ""
}

variable "lambda_s3_key" {
  description = "Key in S3 under which the archive is stored"
  default     = ""
}

variable "lambda_runtime" {
  description = "Environment the lambda function runs in"
  default     = "go1.x"
}

variable "lambda_memory_size" {
  description = "Memory size allocated to the lambda run"
  default     = 1024
}

variable "lambda_timeout" {
  description = "Timeout after which the lambda timeout"
  default     = 300
}

variable "lambda_run_frequency" {
  description = "How frequent should lambda run"
  default     = "rate(5 minutes)"
}
