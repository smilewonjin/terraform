## terraform 설치
https://computingforgeeks.com/how-to-install-terraform-on-ubuntu/
<br>https://learn.microsoft.com/ko-kr/azure/developer/terraform/quickstart-configure

## Azure CLI 설치
https://learn.microsoft.com/ko-kr/cli/azure/install-azure-cli-linux?pivots=apt

## **Terraform을 이용한 Azure Infrastructure코드 기반 생성**
> 참조
 * [https://learn.microsoft.com/ko-kr/azure/virtual-machines/linux/quick-create-terraform](https://learn.microsoft.com/ko-kr/azure/virtual-machines/linux/quick-create-terraform)

  
> **azure account info**

  `az account show`

  ![image](https://user-images.githubusercontent.com/126428788/227119299-7c7fede5-854d-4e3e-9c51-8ee8d390e49e.png)

  ````
    export ARM_SUBSCRIPTION_ID="[id(subscription)]"
    export ARM_TENANT_ID="[homeTenantId or tenantId]"
    export ARM_CLIENT_ID="[azure portal user account]"
    export ARM_CLIENT_SECRET="<azure portal user account password>"
    
  ````

  `printenv | grep ^ARM*`
 
  `. ~/.bashrc`
 
  `mkdir test`

  `vi providers.tf`

  `vi main.tf`

  `vi variables.tf`

  `vi outputs.tf`


> **terraform init**

  `terraform init`

  ![image](https://user-images.githubusercontent.com/126428788/227118353-1c92eaa2-8f07-4ab7-ba8b-f50a04b7bdd1.png)


> **terraform plan**

  `terraform plan -out main.tfplan`

  ![image](https://user-images.githubusercontent.com/126428788/227118050-5378bdb2-b0ec-46db-aa95-8248cf8ce46d.png)
  ![image](https://user-images.githubusercontent.com/126428788/227118224-37e41bd6-aabb-4bd8-906d-16b7a71944b7.png)


> **terraform apply**

  `terraform apply main.tfplan`

  ![image](https://user-images.githubusercontent.com/126428788/227118872-990a89d3-3d3d-4418-b131-23f9569d5944.png)


> **Azure portal**

  ![image](https://user-images.githubusercontent.com/126428788/227122267-59a79534-52bd-4363-874b-f5040785e4f7.png)


## **VM Login**
> **사설키 생성**
    
  `terraform output -raw tls_private_key > id_rsa`
 
 
 > **사설키 읽기 전용 액세스 권한 변경**

  `chmod 400 <keyname>.pem`
 

> **VM login**

  `ssh -i <private key path> azureuser@[public IP]` 
  ![image](https://user-images.githubusercontent.com/126428788/227143828-1aeec90b-e616-4043-90cd-1a03e0ea0c5b.png)
