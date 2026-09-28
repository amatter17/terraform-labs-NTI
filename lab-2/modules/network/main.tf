resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = { Name = "Lab2-VPC-${var.env}" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "Lab2-IGW-${var.env}" }
}

resource "aws_subnet" "subnets" {
  for_each = var.subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, each.value.newbits, each.value.netnum)
  map_public_ip_on_launch = each.value.is_public
  availability_zone       = element(var.azs, 0)

  tags = { Name = "subnet-${var.env}-${each.key}" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table_association" "rta" {
  for_each = aws_subnet.subnets

  subnet_id      = each.value.id
  route_table_id = var.subnets[each.key].is_public ? aws_route_table.public.id : aws_route_table.private.id
}