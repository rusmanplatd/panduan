# Install Aplikasi

- Virtual box 7
  - [page](https://www.virtualbox.org/wiki/Downloads)
  - [binary](https://download.virtualbox.org/virtualbox/7.0.12/VirtualBox-7.0.12-159484-Win.exe)
- Virtual box extension pack
  - [page](https://www.virtualbox.org/wiki/Downloads)
  - [binary](https://download.virtualbox.org/virtualbox/7.0.12/Oracle_VM_VirtualBox_Extension_Pack-7.0.12.vbox-extpack)
- Vagrant
  - [page](https://developer.hashicorp.com/vagrant/install)
  - [binary](https://releases.hashicorp.com/vagrant/2.4.0/vagrant_2.4.0_windows_amd64.msi)

## Homestead (Virtual Machine)

- password VM: `vagrant`
- restart VM setiap ada perubahan di file `Homestead.yaml`
  - `vagrant provision`

### Install Homestead

- buka terminal
- clone homestead di folder www (laragon/xampp)
- `git clone https://github.com/laravel/homestead`
- `cd homestead`
- buat ssh dengan empty passphrase
- `ssh-keygen -t rsa -C "<your_email_address>"`
- `init.bat`
- sesuaikan file Homestead.yaml
  - bisa copas dari [Homestead.yaml](Homestead.yaml)
- nyalakan vm
  - `vagrant up`
- jika error coba checkout ke tag v13.3.2
  - `git checkout v13.3.2`
  - `vagrant up`
- daftarkan domain virtual host
  - buka text editor dengan `run as administrator`
  - buka file `C:\Windows\System32\drivers\etc\hosts`
  - tambahkan:
    - `192.168.56.56 adminer.hs`
    - `192.168.56.56 ams-patriot.hs`
    - `192.168.56.56 ams-rucika.hs`

### Command Homestead

| Command             | Keterangan     |
| ------------------- | -------------- |
| `vagrant up`        | Menyalakan VM  |
| `vagrant provision` | Restart VM     |
| `vagrant halt`      | Mematikan VM   |
| `vagrant ssh`       | Masuk ke VM    |
| `exit`              | Keluar dari VM |
