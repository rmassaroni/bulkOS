function newuser() {
    username="test"
    password="password2023"
    if id "$username" &>/dev/null; then
        # echo "User $username already exists. Skipping user creation."
        # exit 1
        sudo deluser --remove-home test
    fi
    # sudo useradd -m -s /bin/bash "$username"
    sudo adduser --disabled-password --gecos "" "$username"
    echo "$username:$password" | sudo chpasswd
    # echo "pass" | sudo passwd --stdin "$username"
    sudo usermod -aG sudo $username
    echo "User $username created successfully."
    #sudo cp ~/.zshrc /home/"$username"/.zshrc
    sudo touch /home/"$username"/.zshrc
    sudo chsh -s /bin/zsh test
    su - $username
    # su "$username" -c "echo 'Hello, I am $USER!'"
#     expect <<EOF
# spawn su - "$username"
# expect "Password:"
# send "password\r"
# interact
# EOF
}
