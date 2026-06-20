variable "vpc_cidr" { default = "192.168.0.0/16" }

variable "db_user" { default = "admin" }
variable "db_password" { default = "root123456" }
variable "key_pair_name" { default = "akshay1" }

variable "asg_min" { default = 1 }
variable "asg_max" { default = 3 }
variable "asg_desired" { default = 1 }     #change to ur requirement as it just for project practice purpose  