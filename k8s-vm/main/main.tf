
resource "azurerm_resource_group" "rg" {
  name     = var.prefix
  location = var.resource_group_location
}



resource "azurerm_public_ip" "test" {
  count               = 2
  name                = "PIP-${var.hostname}-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}



resource "azurerm_network_interface" "test" {
  count               = 2
  name                = "var.hostname${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "testConfiguration"
    subnet_id                     = azurerm_subnet.test.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "test" {
  count                 = 2
  name                  = "vm-${var.hostname.id}${count.index}"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.test[count.index].id]
  size                  = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  admin_ssh_key {
    username   = var.username
    public_key = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "var.hostname${count.index}"
  }

  computer_name  = "hostname"
  admin_username = var.username
}

