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