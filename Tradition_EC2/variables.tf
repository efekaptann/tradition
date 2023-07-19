variable "zones" {
    default = [ "eu-west-1a", "eu-west-1b"]
}
variable "cidr_blocks" {
    type = list
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}
