function newuser() {
    username="test"
    password="password2023"
    if id "$username" &>/dev/null; then
        # echo "User $username already exists. Skipping user creation."
        # exit 1
        sudo deluser --remove-home test
    fi
    # sudo useradd -m -s /bin/bash "$username"
    # sudo adduser --disabled-password --gecos "" "$username"
    sudo adduser "$username"
    # echo "$username:$password" | sudo chpasswd
    # echo "pass" | sudo passwd --stdin "$username"
    sudo usermod -aG sudo $username
    echo "User $username created successfully."
    #sudo cp ~/.zshrc /home/"$username"/.zshrc
    # sudo touch /home/"$username"/.zshrc
    # sudo chsh -s /bin/zsh test
    su - $username
    # su "$username" -c "echo 'Hello, I am $USER!'"
#     expect <<EOF
# spawn su - "$username"
# expect "Password:"
# send "password\r"
# interact
# EOF
}


# source all
function sa() {
    local dir="$1"
    if [ -d "$dir" ]; then
        for file in "$dir"/*; do
            if [ -f "$file" ]; then
                source "$file"
            fi
        done
    else
        echo "Directory does not exist: $dir"
    fi
}


count_uncommitted() {
    local projects_dir="$HOME/projects"
    local count=0

    for project_dir in "$projects_dir"/*; do
        if [ -d "$project_dir" ]; then
            if [ -d "$project_dir/.git" ]; then
                if ! git -C "$project_dir" diff --quiet --exit-code; then
                    ((count++))
                fi
            fi
        fi
    done

    echo "Number of projects with uncommitted changes: $count"
}
