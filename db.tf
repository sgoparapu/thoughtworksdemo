### Creating Security Group for DB Instance

resource "aws_security_group" "db" {
    name = "sg_db"
    description = "Allow incoming database connections."

    ingress { # MySQL
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.sgweb.id}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.tw-vpc.id}"

    tags = {
        Name = "DBServerSG"
    }
}

### Creating DB Instance 

resource "aws_instance" "db-1" {
    ami = "ami-082b5a644766e0e6f"
    availability_zone = "us-west-2a"
    instance_type = "t2.micro"
    key_name = "sidharth"
    vpc_security_group_ids = ["${aws_security_group.db.id}"]
    subnet_id = "${aws_subnet.tw-private-subnet.id}"
    source_dest_check = false
    user_data = "${file("/home/ec2-user/templates/instance/userdata/db.sh")}"
    tags = {
        Name = "DB Server 1"
    }
}
