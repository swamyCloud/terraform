# terraform
## follow Following steps to create aws instance
### Day - 1
<code>
    terraform init
    
    terraform apply #(type 'yes' when needed)

    terraform destroy #(type 'yes' when needed)
</code>

### DAY - 2
<code>

    terraform init --upgrade
    terrapform plan
    terraform apply -auto-approve #(no need to type yes if we provide -auto-approve)
</code>
 terrform plan -var="t2.nano"  (provide dynamic values while running)


 ### DAY - 3 & 4 - state file
 Terraform state file will track resource information
 Responsible to manage desired state to current state

 ### Day - 5

 ### Day - 6 - import
 file: main.tf -> resource "aws_instance" "import" {}
 -> terraform init
 -> terraform import aws_instance.import ami-0d682f26195e9ec0f(Instance_id)
 -> run "terraform plan" apply changes until you get No Changes