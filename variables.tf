# ------------ GENERAL SETUP -------------
variable "region" {
  default = "eu-central-1"
}
variable "cluster_name" {
  default = "UCNSem1Project"
}
variable "project_name" {
  default = "UCNSem1Project"
}


# ----------------- API ------------------
variable "api_repository_name" {
  default = "ucnsem1project-api"
}
variable "api_service_name" {
  default = "UCNSem1project-api"
}
variable "api_task_name" {
  default = "UCNSem1project-api"
}


# --------------- DATABASE ---------------
variable "mssql_username" {
  default = "ucn"
}

variable "mssql_password" {
  default = "8C^Dv9#Bf%#&Fq7$zi3c"
}

