module "network" {
  source = "./network"
  
}
module "roles" {
  source = "./roles"

}
module "sg" {
  source = "./sg"
  VPC_id = module.network.Project_Vpc_id
}
module "compute" {
  source = "./compute"
  app_alb_sg = module.sg.app-alb-sg-id
  jenkins_role = module.roles.jenkins_role
  private_role = module.roles.private_ec2_role
  private_sg = module.sg.private-ec2-sg-id
  Private1_id = module.network.Private1_id
  Private2_id = module.network.Private2_id
  Puplic1_id = module.network.Puplic1_id
  Puplic2_id = module.network.Puplic2_id
  Jenkins-alb-sg = module.sg.jenkins-alb-sg-id
  jenkins_sg = module.sg.jenkins-ec2-sg-id
  vpc_id = module.network.Project_Vpc_id
}
module "secret" {
  source = "./secrets"
}
module "ecr" {
  source = "./ECR"
  private-ec2-role-arn = module.roles.private_ec2_role-arn
  jenkins-ec2-role-arn = module.roles.jenkins_role-arn
}