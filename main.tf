### Creating a VPC

resource "aws_vpc" "tw-vpc" {
  cidr_block = "20.0.0.0/16"
  tags = {
    Name = "tw-vpc"
  }
}

### Creating a Internet gateway and attaching to VPC

resource "aws_internet_gateway" "tw-igw" {
  vpc_id = "${aws_vpc.tw-vpc.id}"
  tags = {
    Name = "tw-igw"
  }
}

### Creating a NAT Gateway for getting internet access to DB instances as we have to install few packages and we dont have a local repo

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.tweip-nat.id}"
  subnet_id     = "${aws_subnet.tw-public-subnet.id}"
}

### Creating a 2 public Subnets

resource "aws_subnet" "tw-public-subnet" {
  vpc_id            = "${aws_vpc.tw-vpc.id}"
  cidr_block        = "20.0.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "tw-public"
  }
}
resource "aws_subnet" "tw-public-subnet2" {
  vpc_id            = "${aws_vpc.tw-vpc.id}"
  cidr_block        = "20.0.3.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "tw-public"
  }
}

### Creating a Private Subnet

resource "aws_subnet" "tw-private-subnet" {
  vpc_id            = "${aws_vpc.tw-vpc.id}"
  cidr_block        = "20.0.2.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "tw-private"
  }
}

### Creating a Route for internet access

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.tw-vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.tw-igw.id}"
}

### Creating a Private route table - Public route table is created by default which is nothing but main route table

resource "aws_route_table" "tw-private_route_table" {
    vpc_id = "${aws_vpc.tw-vpc.id}"
     route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_nat_gateway.gw.id}"
  }
}
resource "aws_route_table_association" "private_subnet_association" {
    subnet_id      = "${aws_subnet.tw-private-subnet.id}"
    route_table_id = "${aws_route_table.tw-private_route_table.id}"
}
resource "aws_eip" "tweip-nat" {
vpc      = true
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "${aws_vpc.tw-vpc.id}"

  ingress {
    from_port   = 0
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  egress {
    from_port       = 0
    to_port         = 0
    cidr_blocks     = ["0.0.0.0/0"]
    protocol        = "-1"
  }
}
