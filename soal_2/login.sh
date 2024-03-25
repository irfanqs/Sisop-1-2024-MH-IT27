#!/bin/bash

# Change directory ke user
cd users || exit

# untuk mengambil kata sandi hash untuk email yang diinput
function get_password_hash() {
    local email=$1
    grep "^$email:" users.txt | cut -d ':' -f 5
}

# untuk mendekripsi kata sandi hash
function decrypt_password_hash() {
    local encrypted_password=$1
    echo "$encrypted_password" | base64 --decode
}

# Verifikasi jawaban pertanyaan keamanan
function verify_security_answer() {
    local email=$1
    local user_answer=$2
    local stored_answer=$(grep "^$email:" users.txt | cut -d ':' -f 4)
    [[ "$user_answer" == "$stored_answer" ]]
}

# untuk forgot password
function forgot_password() {
    read -p "Enter your email: " email
    if ! grep -q "^$email:" users.txt; then
        echo "Email not found."
        log "LOGIN FAILED" "ERROR: Failed login attempt on user with email $email"
        return 1
    fi
    
    security_question=$(grep "^$email:" users.txt | cut -d ':' -f 3)
    read -p "$security_question: " user_answer
    
    if verify_security_answer "$email" "$user_answer"; then
        encrypted_password=$(get_password_hash "$email")
        password=$(decrypt_password_hash "$encrypted_password")
        echo "Your password is: $password"
    else
        echo "Incorrect answer."
    fi
}

# untuk menambah user
function add_user() {
    echo "===Adding user==="
    read -p "Enter email: " email
    if grep -q "^$email:" users.txt; then
        echo "Email already exists."
        return
    fi

    if [[ ! "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$ ]]; then
        echo "Invalid email format."
        return
    fi

    read -p "Enter username: " username

    read -p "Enter security question: " security_question

    read -p "Enter answer to security question: " security_answer

    while true; do

        read -s -p "Enter password: " password

        if [[ ${#password} -lt 8 ]]; then
            echo "Password must be at least 8 characters."
            continue
        fi
        if ! [[ "$password" =~ [[:upper:]] && "$password" =~ [[:lower:]] && "$password" =~ [[:digit:]] ]]; then
            echo "Password must contain at least one uppercase letter, one lowercase letter, and one digit."
            continue
        fi
        break

    done
    # mengenkripsi kata sandi
    encrypted_password=$(echo "$password" | base64)
    # tambahkan detail pengguna ke user.txt
    echo "$email:$username:$security_question:$security_answer:$encrypted_password" >> users.txt
    log "REGISTER SUCCESS" "User $username registered successfully"
    echo "User added successfully."

}

# untuk mengedit user
function edit_user() {
    echo "===Editing User==="
    read -p "Enter the email of the user to edit: " email
    if ! grep -q "^$email:" users.txt; then
        echo "User not found."
        return
    fi

    echo "Select what to edit:"
    echo "1. Edit Security Question and Answer"
    echo "2. Edit Password"
    echo "3. Edit Username"
    read -p "Enter your choice: " edit_option

    case $edit_option in
        1) edit_security_info "$email" ;;
        2) edit_password "$email" ;;
        3) edit_username "$email" ;;
        4) echo "Logged out." ;;
        *) echo "Invalid choice" ;;
    esac
}

# untuk edit username
function edit_username() {
    local email=$1
    read -p "Enter new username: " new_username

    # Update username di users.txt
    awk -v email="$email" -v new_username="$new_username" '
        BEGIN { FS = ":"; OFS = ":" }
        $1 == email { $2 = new_username }
        { print }
    ' users.txt > temp.txt && mv temp.txt users.txt

    log "USERNAME UPDATED" "Username updated for user with email $email"
    echo "Username updated successfully."
}


# untuk ngedit security question dan answer
function edit_security_info() {
    local email=$1
    read -p "Enter new security question: " new_question
    read -p "Enter new answer for '$new_question': " new_answer

    # Update users.txt with new security info
    awk -v email="$email" -v new_question="$new_question" -v new_answer="$new_answer" '
        BEGIN { FS = ":"; OFS = ":" }
        $1 == email {
            $3 = new_question
            $4 = new_answer
        }
        { print }
    ' users.txt > temp.txt && mv temp.txt users.txt

    log "SECURITY INFO UPDATED" "Security question and answer updated for user with email $email"
    echo "Security question and answer updated successfully."
}
# untuk edit password
function edit_password() {
    local email=$1
    read -s -p "Enter new password: " new_password
    echo

    # mengenkripsi kat sandi baru
    encrypted_password=$(echo "$new_password" | base64)

    # Update password di users.txt
    awk -v email="$email" -v encrypted_password="$encrypted_password" '
        BEGIN { FS = ":"; OFS = ":" }
        $1 == email { $5 = encrypted_password }
        { print }
    ' users.txt > temp.txt && mv temp.txt users.txt

    log "PASSWORD UPDATED" "Password updated for user with email $email"
    echo "Password updated successfully."
}


# untuk delete user
function delete_user() {
    echo "===Deleting User==="
    read -p "Enter the email of the user to delete: " email
    if grep -q "^$email:" users.txt; then
        # Delete user dari users.txt
        sed -i "/^$email:/d" users.txt
        log "USER DELETED" "User with email $email deleted successfully"
        echo "User deleted successfully."
    else
        echo "User not found."
    fi
}

# Function untuk log messages
function log() {
    local type=$1
    local message=$2
    local date=$(date +"%d/%m/%y %H:%M:%S")
    echo "[$date] [$type] $message" >> auth.log
}

# Function untuk perform login
function perform_login() {
    read -p "Enter email: " email
    if ! grep -q "^$email:" users.txt; then
        echo "Email not found."
        log "LOGIN FAILED" "ERROR: Failed login attempt on user with email $email"
        return 1
    fi
    
    encrypted_password=$(get_password_hash "$email")
    stored_password=$(decrypt_password_hash "$encrypted_password")
    
    read -s -p "Enter password: " entered_password
    echo
    
    if [[ "$entered_password" == "$stored_password" ]]; then
        echo "Login successful!"
        log "LOGIN SUCCESS" "User with email $email logged in successfully"
        
        # Check if user is admin
        if [[ $email =~ .*"admin".* ]]; then
            echo "Admin options:"
            echo "1. Add User"
            echo "2. Edit User"
            echo "3. Delete User"
            echo "4. Logout"
            read -p "Enter your choice: " admin_option
            case $admin_option in
                1) add_user ;;
                2) edit_user ;;
                3) delete_user ;;
                4) echo "Logged out." ;;
                *) echo "Invalid choice" ;;
            esac
        fi
    else
        echo "Incorrect password."
        read -p "Forgot password? (y/n): " choice
        if [[ "$choice" == "y" ]]; then
            forgot_password
        else
            log "LOGIN FAILED" "ERROR: Failed login attempt on user with email $email"
        fi
    fi
}

# Main program
echo "1. Login"
echo "2. Forgot Password"
read -p "Enter your choice: " option

case $option in
    1) perform_login ;;
    2) forgot_password ;;
    *) echo "Invalid choice" ;;
esac
