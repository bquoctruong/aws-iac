import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";

const config = new pulumi.Config();
const createInstance = config.getBoolean("createInstance") || false;

// Fetch the default VPC
const defaultVpc = aws.ec2.getVpc({ default: true });

// Fetch the default subnet IDs
const defaultSubnet = aws.ec2.getSubnetIds({
    vpcId: defaultVpc.then(vpc => vpc.id),
});

// Create a Security Group that allows SSH and HTTP access
const securityGroup = new aws.ec2.SecurityGroup("securityGroup", {
    vpcId: defaultVpc.then(vpc => vpc.id),
    ingress: [
        {
            protocol: "tcp",
            fromPort: 22,
            toPort: 22,
            cidrBlocks: ["0.0.0.0/0"],
        },
        {
            protocol: "tcp",
            fromPort: 80,
            toPort: 80,
            cidrBlocks: ["0.0.0.0/0"],
        },
    ],
    egress: [{
        protocol: "-1",
        fromPort: 0,
        toPort: 0,
        cidrBlocks: ["0.0.0.0/0"],
    }],
});

if (createInstance) {

    // Create an EC2 Instance with User Data
    const ec2Instance = new aws.ec2.Instance("ec2Instance", {
        ami: aws.ec2.getAmi({
            owners: ["amazon"],
            filters: [
                { name: "name", values: ["amzn2-ami-hvm-*-x86_64-gp2"] },
            ],
            mostRecent: true,
        }).then(ami => ami.id),
        instanceType: "t2.micro",
        subnetId: defaultSubnet.then(subnets => subnets.ids[0]),
        vpcSecurityGroupIds: [securityGroup.id],
        keyName: "your-key-pair-name", // Replace with your key pair name
        userData: `#!/bin/bash
        sudo yum update -y
        sudo yum install -y httpd
        sudo systemctl start httpd
        sudo systemctl enable httpd
        echo "Hello from Pulumi!" > /var/www/html/index.html
        `,
        tags: {
            Name: "PulumiEC2Instance",
        },
    });

    // Export the public IP and DNS of the instance
    export const publicIp = ec2Instance.publicIp;
    export const publicDns = ec2Instance.publicDns;
} else {
    pulumi.log.info("EC2 instance creation skipped as per configuration.");
}