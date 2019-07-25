resource "aws_security_group" "sgweb" {
    name = "sgweb"
    description = "Allow inbound connections."

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 0
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
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
        from_port       = 0
        to_port         = 0
        cidr_blocks     = ["0.0.0.0/0"]
        protocol        = "-1"
    }
    vpc_id = "${aws_vpc.tw-vpc.id}"

    tags = {
        Name = "WebServerSG"
    }
}

resource "aws_instance" "web01" {
    ami = "${var.ami}"
    availability_zone = "${var.availability_zone1}"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
    subnet_id = "${aws_subnet.tw-public-subnet.id}"
    associate_public_ip_address = true
    source_dest_check = false
    key_name = "${var.key_name}"
    user_data = "${file("./userdata/web.sh")}"
    tags = {
        Name = "WebServer01"
    }
}

resource "aws_instance" "web02" {
    ami = "${var.ami}"
    availability_zone = "${var.availability_zone2}"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
    subnet_id = "${aws_subnet.tw-public-subnet2.id}"
    associate_public_ip_address = true
    source_dest_check = false
    key_name  = "${var.key_name}"
    user_data = "${file("./userdata/web.sh")}"
    tags = {
        Name = "WebServer02"
    }
}
