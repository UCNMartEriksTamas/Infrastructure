# NOTE: AWS creates its own route table upon creating a VPC, therefore we must overwrite the original

resource "aws_route_table" "main_route_table" {
  vpc_id = aws_vpc.network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = aws_vpc.network.id
  route_table_id = aws_route_table.main_route_table.id
}
