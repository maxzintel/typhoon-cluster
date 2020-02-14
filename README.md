The goal is not to 'run' kubernetes; the goal is to create kubernetes.
That is what Typhoon is, and it is what these terraform and yaml files will do - create kubernetes.

In a base environment, typhoon will run out-of-the-box. However, there are some changes that should be made for it to be optimized.
* Make Typhoon cloud-aware. In AWS, for example, Typhoon cannot dynamically create persistent volumes or AWS load balancers unless we specify Typhoon is running in AWS.
  * In a `controller.yml` file, add the flag `--cloud-provider=${cloud_provider}`. This variable will be set by the Hyperkube via the `variables.tf` referenced below.
* Run Typhoon in an existing VPC/Subnet. By default, Typhoon's terraform will stand up its own VPC and networking to run in from scratch. In some situations (like enterprise environments in which permissions to create resources like VPC's are limited) this may not be possible.
  * Delete the standard `network.tf`. Then, in the root `variables.tf` add the networking variables that the deleted file would have created. Ex:
```terraform
variable "cloud_provider" {
  type        = string
  default     = "aws"
  description = "The cloud provider"
}

variable "dns_zone_public" {
  type        = string
  description = "AWS Route53 DNS Zone (e.g. aws.example.com)"
}
```
