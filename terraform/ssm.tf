resource "aws_ssm_parameter" "db_host" {
  name  = "/nodeapp/db/hostname"
  type  = "String"
  value = aws_db_instance.mysql.address
}

resource "aws_ssm_parameter" "db_name" {
  name  = "/nodeapp/db/name"
  type  = "String"
  value = "react_node_app"
}

resource "aws_ssm_parameter" "db_user" {
  name  = "/nodeapp/db/user"
  type  = "String"
  value = "appuser"
}

resource "aws_ssm_parameter" "db_port" {
  name  = "/nodeapp/db/port"
  type  = "String"
  value = "3306"
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/nodeapp/db/password"
  type  = "SecureString"
  value = "learnIT02#"
}