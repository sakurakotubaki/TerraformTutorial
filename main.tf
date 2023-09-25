# Terraformのバージョンを指定
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"# プロバイダーのソースを指定
      version = "~> 4.16"# プロバイダーのバージョンを指定
    }
  }

  required_version = ">= 1.3.8"# Terraformのバージョンを指定
}

provider "aws" {
  region  = "ap-northeast-1"# リージョンを指定
}

# amiの箇所はAWSのEC2のAMIカタログから確認する。Amazon Linux 2023 AMIを指定した。
resource "aws_instance" "app_server" {
  ami           = "ami-079cd5448deeace01"# AMIを指定。AMIとはAmazon Machine Imageの略で、EC2インスタンスを作成する際のテンプレートのようなもの。
  instance_type = "t2.micro"# インスタンスタイプを指定。t2.microはEC2インスタンスのスペックで、1CPU、1GBのメモリを持つインスタンス。無料枠で使える

  tags = {
    Name = "ExampleAppServerInstance"# インスタンスにNameタグを付ける
  }
}