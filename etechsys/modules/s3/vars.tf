variable "bucket_name" {
    type = string
  default = "my-s3-bucket"
}

variable "env" {

  type = list(string)
  default = [ "dev" ]
}