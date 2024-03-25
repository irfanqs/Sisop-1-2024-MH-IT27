#!/bin/bash

# ngecek jika users directory keluar atau tida, jika tidak akan dibuat
mkdir -p users

# Change directory ke users
cd users

# memeriksa apakah email sudah terdaftar atau belum
function check_email_exists() {
    local email=$1
    grep -q "^$email:" users.txt
    return $?
}

# mengecek format email
function check_email_format() {
    local email=$1
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        return 0
    else
        return 1
    fi
}

# membuat kata sandi terenkripsi base64
function encrypt_password() {
    local password=$1
    echo -n "$password" | base64
}

# memeriksa format kata sandi
function check_password_complexity() {
    local password=$1
    if [[ ${#password} -lt 8 ]]; then
        return 1
    fi
    if ! [[ "$password" =~ [[:upper:]] && "$password" =~ [[:lower:]] && "$password" =~ [[:digit:]] ]]; then
        return 1
    fi
    return 0
}

# Function untuk log messages
function log() {
    local type=$1
    local message=$2
    local date=$(date +"%d/%m/%y %H:%M:%S")
    echo "[$date] [$type] $message" >> auth.log
}

# Main registrasi
function register() {
    echo "Welcome to Registration System"
    read -p "Enter email: " email
    check_email_format "$email" || { echo "Invalid email format."; log "REGISTER FAILED" "Invalid email format for user registration"; return 1; }
    check_email_exists "$email" && { echo "Email already exists."; log "REGISTER FAILED" "User with email $email already exists"; return 1; }
    
    read -p "Enter username: " username
    
    read -p "Enter security question: " security_question

    read -p "Enter answer to security question: " security_answer

    while true; do
        read -s -p "Enter password: " password
        echo
        check_password_complexity "$password" && break
        echo "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit."
    done

    encrypted_password=$(encrypt_password "$password")

    echo "$email:$username:$security_question:$security_answer:$encrypted_password:user" >> users.txt
    echo "Registration successful!"
    log "REGISTER SUCCESS" "User $username registered successfully"
}

# Main program
register
