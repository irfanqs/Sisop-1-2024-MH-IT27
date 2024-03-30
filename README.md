# Sisop-1-2024-MH-IT27
Anggota Kelompok :
|  NRP|Nama Anggota  |
|--|--|
|5027231079|Harwinda|
|5027221058|Irfan Qobus Salim|
|5027231038|Dani Wahyu Anak Ary|

List Soal:

 - [Soal 1](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/tree/main#soal-1)
 - [Soal 2](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/tree/main#soal-2)
 - [Soal 3](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/tree/main#soal-3)
 - [Soal 4](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/tree/main#soal-4)

## Soal 1
<details><summary>Klik untuk melihat soal</summary>
Cipung dan abe ingin mendirikan sebuah toko bernama “SandBox”, sedangkan kamu adalah manajer penjualan yang ditunjuk oleh Cipung dan Abe untuk melakukan pelaporan penjualan dan strategi penjualan kedepannya yang akan dilakukan.

Setiap tahun Cipung dan Abe akan mengadakan rapat dengan kamu untuk mengetahui laporan dan strategi penjualan dari “SandBox”. Buatlah beberapa kesimpulan dari data penjualan “[Sandbox.csv](https://drive.google.com/file/d/1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0/view?usp=sharing)” untuk diberikan ke cipung dan abe.

1.  Karena Cipung dan Abe baik hati, mereka ingin memberikan hadiah kepada customer yang telah belanja banyak. Tampilkan nama pembeli dengan total sales paling tinggi
    
2.  Karena karena Cipung dan Abe ingin mengefisienkan penjualannya, mereka ingin merencanakan strategi penjualan untuk customer segment yang memiliki profit paling kecil. Tampilkan customer segment yang memiliki profit paling kecil
    
3.  Cipung dan Abe hanya akan membeli stok barang yang menghasilkan profit paling tinggi agar efisien. Tampilkan 3 category yang memiliki total profit paling tinggi
    
4.  Karena ada seseorang yang lapor kepada Cipung dan Abe bahwa pesanannya tidak kunjung sampai, maka mereka ingin mengecek apakah pesanan itu ada. Cari purchase date dan amount (quantity) dari nama adriaens
</details>

### Penjelasan
pertama buat **sandbox.sh**

```bash
!/bin/bash

# Download File Sandbox.csv
linkfile="https://drive.google.com/uc?id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0"
namafile="Sandbox.csv"
wget -O "$namafile" "$linkfile"

# Profit Terbesar
awk -F ',' 'NR > 1 {sales[$6]+=$17} END {for (pembeli in sales) print pembeli "," sales[pembeli]}' Sandbox.csv |
sort -t ',' -k 2,2nr |
head -n 1 |
awk -F ',' '{print "Nama Pembeli dengan Total Total Sales Tertinggi: " $1}'

# Profit Terkecil
awk -F ',' 'NR > 1 {segment[$6]+=$20} END {profitterkecil=999999999999; segmentterkecil=""; for (cust in segment) {if (segment[cust>

# Soal 1 C, Menampilkan 3 Kategori profit tertinggi
awk -F ',' 'NR > 1 {kategori[$14]+=$21} END {for (jenis in kategori) print jenis "," kategori[jenis]}' Sandbox.csv |
sort -t ',' -k 2,2nr |
head -n 3

# Soal 1 D, Mencari purchase date dan amount (quantity) dari nama adriaens
mencarinama=$(awk -F ',' '$6 == "Adriaens Grayland"' Sandbox.csv)
if [ -z "$mencarinama" ]; then
    echo "andriaens tidak terdaftar!!!."
else
    echo "$mencarinama"
fi
```
1. membuat function untuk mendownload sandbox.csv

```bash
linkfile="https://drive.google.com/uc?id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0"
namafile="Sandbox.csv"
wget -O "$namafile" "$linkfile"
```
2.  membuat function untuk mengecheck nama pembeli dengan total sales paling tinggi
```bash
awk -F ',' 'NR > 1 {sales[$6]+=$17} END {for (pembeli in sales) print pembeli "," sales[pembeli]}' Sandbox.csv |
sort -t ',' -k 2,2nr |
head -n 1 |
awk -F ',' '{print "Nama Pembeli dengan Total Total Sales Tertinggi: " $1}'
```
3. membuat function untuk mencari customer segment yang memiliki profit paling kecil
```bash
awk -F ',' 'NR > 1 {segment[$6]+=$20} END {profitterkecil=999999999999; segmentterkecil=""; for (cust in segment) {if (segment[cust>
```
4. function untuk menampilkan 3 category yang memiliki total profit paling tinggi
```bash
awk -F ',' 'NR > 1 {kategori[$14]+=$21} END {for (jenis in kategori) print jenis "," kategori[jenis]}' Sandbox.csv |
sort -t ',' -k 2,2nr |
head -n 3
```
5. function untuk mengecek nama adriaens
```bash
mencarinama=$(awk -F ',' '$6 == "Adriaens Grayland"' Sandbox.csv)
if [ -z "$mencarinama" ]; then
    echo "andriaens tidak terdaftar!!!."
else
    echo "$mencarinama"
fi
```

**Hasil Output**
![Screenshot from 2024-03-30 18-40-25](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/150106905/d197e4d7-3fec-417a-81d8-27194ece4868)

### Kendala
tidak ada kendala pada soal ini
### Revisi
tidak ada revisi pada soal ini
## Soal 2
<details><summary>Klik untuk melihat soal</summary>
Oppie merupakan seorang peneliti bom atom, ia ingin merekrut banyak peneliti lain untuk mengerjakan proyek bom atom nya, Oppie memiliki racikan bom atom rahasia yang hanya bisa diakses penelitinya yang akan diidentifikasi sebagai user, Oppie juga memiliki admin yang bertugas untuk memanajemen peneliti, bantulah oppie untuk membuat program yang akan memudahkan tugasnya
    
1.  Buatlah 2 program yaitu login.sh dan register.sh
2.  Setiap admin maupun user harus melakukan register terlebih dahulu menggunakan email, username, pertanyaan keamanan dan jawaban, dan password

![](https://lh7-us.googleusercontent.com/g267t1SxVrtsdZO6SkD12pQboNGWVcbZprTwW18wVstSe_m0B9ogOBQehszbFRp7siahYgxrWVmoDJDpscL7DsHBqjNh_mJa8ghc71vugqpNKnMOFkUaOG1oZui2lZoKHlOh4aSUsSoJgH7pz_1dnA)

3.  Username yang dibuat bebas, namun email bersifat unique. setiap email yang mengandung kata admin akan dikategorikan menjadi admin
4.  Karena resep bom atom ini sangat rahasia Oppie ingin password nya memuat keamanan tingkat tinggi

 - Password tersebut harus di encrypt menggunakan base64
 - Password yang dibuat harus lebih dari 8 karakter
 - Harus terdapat paling sedikit 1 huruf kapital dan 1 huruf kecil
 - Harus terdapat paling sedikit 1 angka
    
5.  Karena Oppie akan memiliki banyak peneliti dan admin ia berniat untuk menyimpan seluruh data register yang ia lakukan ke dalam folder users file users.txt. Di dalam file tersebut, terdapat catatan seluruh email, username, pertanyaan keamanan dan jawaban, dan password hash yang telah ia buat.
6. Setelah melakukan register, program harus bisa melakukan login. Login hanya perlu dilakukan menggunakan email dan password.
7. Karena peneliti yang di rekrut oleh Oppie banyak yang sudah tua dan pelupa maka Oppie ingin ketika login akan ada pilihan lupa password dan akan keluar pertanyaan keamanan dan ketika dijawab dengan benar bisa memunculkan password
    

![](https://lh7-us.googleusercontent.com/P2RPHbbkWfWb7KyXu0yQS9kTMmy_lSSAJ3i6QwtVyYcfyl-1Pa1KNZONmQC_dXQx4g1xxndS6OyUN725Na1XkFaNRJfaJYHep51biL-5l-a_3kkkPqR_KGCEulS8cRaulRJIYCiIFhLOBt9QZtRZeA)

![](https://lh7-us.googleusercontent.com/VvagdElnyIeAEPY8mXhwVKORw9XUiRjw1l_suEP-DlmooPpHlCBhooEKhJmv22HIHYnvmV8qxib5Lhy2IHBOW4eJe7FpMJ5UQzGjOzwSs3htsVGDxFX5yVvHU0wBrvB_YL9kYDdXAK2kNTjkRswZdw)

![](https://lh7-us.googleusercontent.com/xZGJrq5vsnx5Mpl_VMrQ_PhOWIO8yIxJPmsIU-ytNC35ytg5d4jh-gOMwNIQkP5xJiheHJDsMJ7QtAhf7uOBpSySS6Sb61UHAnwm1aNx_r1zlrT2dO66HFRZd8leOLGcQ1Wm1uhO1_zZBU88OmMzmw)

8.  Setelah user melakukan login akan keluar pesan sukses, namun setelah seorang admin melakukan login Oppie ingin agar admin bisa menambah, mengedit (username, pertanyaan keamanan dan jawaban, dan password), dan menghapus user untuk memudahkan kerjanya sebagai admin.
    

![](https://lh7-us.googleusercontent.com/7zdD0eF8pl3MNqqUVcVfwR1GHvooVW_hx1cY706ikioMZlGrP0eWAe5NdnPpx5nWYTkHKfuOTEshBGnJDarKdQl1wAtm59uTGfBQwJ_mNDNjDKjqmvQSUY7zXn_hpVomSebKC_ngHFMZqBQp_XtHsw)

9.  Ketika admin ingin melakukan edit atau hapus user, maka akan keluar input email untuk identifikasi user yang akan di hapus atau di edit
10.  Oppie ingin programnya tercatat dengan baik, maka buatlah agar program bisa mencatat seluruh log ke dalam folder users file auth.log, baik login ataupun register.

 - Format: [date] [type] [message]    
 - Type: REGISTER SUCCESS, REGISTER FAILED, LOGIN SUCCESS, LOGIN FAILED
 -  Ex: [23/09/17 13:18:02] [REGISTER SUCCESS] user [username] registered successfully
 [23/09/17 13:22:41] [LOGIN FAILED] ERROR Failed login attempt on user with email [email]
</details>

### Penjelasan
pertama buat **register.sh**

```bash
#!/bin/bash

# ngecek jika users directory keluar atau tidak, jika tidak akan dibuat
mkdir -p users

# Change directory ke users
cd users

function check_email_exists() {
    local email=$1
    grep -q "^$email:" users.txt
    return $?
}

function check_email_format() {
    local email=$1
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        return 0
    else
        return 1
    fi
}

function encrypt_password() {
    local password=$1
    echo -n "$password" | base64
}

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
```

1. `mkdir -p users` membuat direktori `users` jika belum ada. '-p' memastikan diektori sudah ada, tidak akan muncul pesan kesalahan
2. `cd users` untuk berpindah ke direktori `users`
3. membuat function untuk memeriksa apakah email sudah terdaftar atau belum

```bash
   function check_email_exists() {
    local email=$1
    grep -q "^$email:" users.txt
    return $?
}
```
4. membuat function `check_email_format` untuk  mengecek format email sesuai dengan ketentuan, terdapat huruf, simbol `"@"`, dan simbol `"."` seperti format email pada umumnya. jika benar maka akan `return 0` atau berhasil jika format salah maka akan `return 1`

```bash
function check_email_format() {
    local email=$1
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        return 0
    else
        return 1
    fi
}
```
5. membuat function `encrypt_password` untuk mengenkripsi kata sandi menggunakan base64.

```bash
function encrypt_password() {
    local password=$1
    echo -n "$password" | base64
}
```
6. membuat function `check_password` untuk memeriksa format kata sandi sesuai ketentuan yaitu terdiri dari 8 dan mengandung `upper` huruf kapital, `lower` huruf kecil, dan `digit` angka

 ```bash
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
```
7. Function untuk log messages yang akan disimpan pada `auth.log`

```bash
function log() {
    local type=$1
    local message=$2
    local date=$(date +"%d/%m/%y %H:%M:%S")
    echo "[$date] [$type] $message" >> auth.log
}
```
8. membuat function `register` sebagai Main registrasi. dimana pertama akan mencetak kata `"Welcome to Registration System"` lalu pengguna diminta untuk memasukkan emailnya. lalu alamat email yang dimasukkan oleh pengguna diperiksa menggunakan fungsi `check_email_format().` Jika formatnya tidak sesuai dengan pola yang diharapkan (misalnya, tidak ada `'@'` atau domain tidak valid), pesan kesalahan ditampilkan, dan registrasi dianggap gagal. kemudian fungsi `check_email_exists` untuk memastikan email sudah ada dalam `user.txt` atau belum. jika sudah terdaftar, registrasi dianggap gagal dan pesan kesalahan akan ditampilkan `email already exits`. kemudian  `while true; do` loop untuk meminta pengguna memasukkan kata sandi yang diinginkan. Loop ini akan terus berjalan sampai kata sandi yang dimasukkan memenuhi kriteria kompleksitas yang ditentukan. Jika kata sandi tidak memenuhi persyaratan (minimal 8 karakter, minimal satu huruf besar, satu huruf kecil, dan satu angka), pesan kesalahan akan ditampilkan dan pengguna diminta memasukkan ulang kata sandi. `"$email:$username:$security_question:$security_answer:$encrypted_password:user" >> users.txt` ini berfungsi untuk mengumpulkan dan memverifikasi semua detail dan informasi pengguna kedalam file `user.txt`.
`echo "Registration successful!"` Pesan berhasil yang ditampilkan kepada pengguna untuk memberi tahu bahwa proses registrasi telah berhasil.
`log "REGISTER SUCCESS" "User $username registered successfully"`  Hasil dari registrasi dicatat dalam file `auth.log`, termasuk timestamp, jenis keberhasilan, dan nama pengguna yang terdaftar.

```bash
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
```
9. `register` memanggil fungsi `register()` untuk memulai proses registrasi

selanjutnya kita buat **login.sh**
```bash
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
```
1. pengguna dapat memilih `"login"` atau `"forgot password"` dimana pada `# Function untuk perform login` memiliki fungsi `perform_login()` untuk mengecek email yang ada di user.txt. jika email tidak ada maka akan keluar keterangannya. dan jika ada maka akan lanjut ke berikutnya yaitu pengguna memasukkan password. jika password sesuai dengan yang tersimpan saat register  `if [[ "$entered_password" == "$stored_password" ]];` maka login akan sukses.
2. pada bagian `# Check if user is admin` terdapat `if [[ $email =~ .*"admin".* ]];` dimana jika email mengandung kata admin setelah sukses login maka akan memanggil `$admin_option` dimana jika menjadi admin maka dapat menambah user dengan fungsi `add_user()`, edit user dengan fungsi `edit_user()`, editing password pada fungsi `edit_password()`, editing question and answer security pada `fungsi edit_security_info()` dan deleting user pada fungsi `delete_user()`.
3. dan data yang dimasukkan pengguna tercatat pada file `user.txt` dan history login berhasil atau tidaknya semua tercatat pada file `auth.log`

**Hasil Output**

<img width="356" alt="Screenshot 2024-03-30 021532" src="https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/79549192/fbbd2f15-7688-47bc-a964-cc86a555fdb4">
<img width="368" alt="Screenshot 2024-03-30 021625" src="https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/79549192/b6ff5cd0-8335-4909-86ff-15d6f1318785">


**Dokumentasi user.txt dan auth.log**

<img width="324" alt="image" src="https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/79549192/b61894d7-bb10-47c0-8247-21ad13dee5c7">
<img width="326" alt="ss auth log" src="https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/79549192/6c816b9a-1653-4f33-8235-251caebd3fc0">

### Kendala
Tidak ada kendala pada jawaban nomor ini
### Revisi
Tidak ada revisi pada jawaban nomor ini
## Soal 3
<details><summary>Klik untuk melihat soal</summary>
Alyss adalah seorang gamer yang sangat menyukai bermain game Genshin Impact. Karena hobinya, dia ingin mengoleksi foto-foto karakter Genshin Impact. Suatu saat Yanuar memberikannya sebuah [Link](https://drive.google.com/file/d/1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN/view?usp=sharing) yang berisi koleksi kumpulan foto karakter dan sebuah clue yang mengarah ke penemuan gambar rahasia. Ternyata setiap nama file telah dienkripsi dengan menggunakan hexadecimal. Karena penasaran dengan apa yang dikatakan Yanuar, Alyss tidak menyerah dan mencoba untuk mengembalikan nama file tersebut kembali seperti semula.

 -  Alyss membuat script bernama awal.sh, untuk download file yang diberikan oleh Yanuar dan unzip terhadap file yang telah diunduh dan decode setiap nama file yang terenkripsi dengan hex . Karena pada file list_character.csv terdapat data lengkap karakter, Alyss ingin merename setiap file berdasarkan file tersebut. Agar semakin rapi, Alyss mengumpulkan setiap file ke dalam folder berdasarkan region tiap karakter. **Format: Region - Nama - Elemen - Senjata.jpg**
 - Karena tidak mengetahui jumlah pengguna dari tiap senjata yang ada di folder "genshin_character".Alyss berniat untuk menghitung serta menampilkan jumlah pengguna untuk setiap senjata yang ada.  **Format: [Nama Senjata] : [jumlah]**
Untuk menghemat penyimpanan. Alyss menghapus file - file yang tidak ia gunakan, yaitu **genshin_character.zip, list_character.csv, dan genshin.zip**
 - Namun sampai titik ini Alyss masih belum menemukan clue dari the secret picture yang disinggung oleh Yanuar. Dia berpikir keras untuk menemukan pesan tersembunyi tersebut. Alyss membuat script baru bernama search.sh untuk melakukan pengecekan terhadap setiap file tiap 1 detik. Pengecekan dilakukan dengan cara meng-ekstrak sebuah value dari setiap gambar dengan  menggunakan command steghide. Dalam setiap gambar tersebut, terdapat sebuah file txt yang berisi string. Alyss kemudian mulai melakukan dekripsi dengan hex pada tiap file txt dan mendapatkan sebuah url. Setelah mendapatkan url yang ia cari, Alyss akan langsung menghentikan program search.sh serta mendownload file berdasarkan url yang didapatkan.
 - Dalam prosesnya, setiap kali Alyss melakukan ekstraksi dan ternyata hasil ekstraksi bukan yang ia inginkan, maka ia akan langsung menghapus file txt tersebut. Namun, jika itu merupakan file txt yang dicari, maka ia akan menyimpan hasil dekripsi-nya bukan hasil ekstraksi. Selain itu juga, Alyss melakukan pencatatan log pada file image.log untuk setiap pengecekan gambar. **Format: [date] [type] [image_path]**

Hasil akhir:

 1. genshin_character
 2. search.sh
 3. awal.sh
 4. image.log
 5. [filename].txt
 6. [image].jpg
 </details>
 
### Penjelasan
Pertama, kita awali dengan **pembuatan awal.sh**

    #!/bin/bash
    
    wget -O genshin.zip "https://drive.usercontent.google.com/u/0/uc?id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN&export=download"
    
    unzip *.zip
    
    unzip genshin_character.zip
    
    cd genshin_character
    
    for encode in *.jpg;
    do
     name=$(basename "$encode" .jpg)
     decode=$(echo "$name" | xxd -r -p)
     mv "$encode" "${decode}.jpg"
    done
    
    cd ..
    mv list_character.csv genshin_character
    cd genshin_character
    
    for char in *.jpg;
    do
     namaFoto=$(basename "$char" .jpg)
     region=$(awk -F ',' "/$namaFoto/ {print \$2}" list_character.csv)
     element=$(awk -F ',' "/$namaFoto/ {print \$3}" list_character.csv)
     senjata=$(awk -F ',' "/$namaFoto/ {print \$4}" list_character.csv)
    
     gantiNama="${region} - ${namaFoto} - ${element} - ${senjata}" 
     
     mkdir -p "${region}"
    
     gantiNama=$(echo "$gantiNama" | tr -d '\r')
    
     mv "$char" "${region}/${gantiNama}.jpg"
    
    done
    
    awk -F ',' 'NR > 1 {
        gsub(/\r/, "", $4)
        senjata[$4]++
    } 
    END {
        for (weapon in senjata) {
            if (weapon != "") {
                printf "%s : %d\n", weapon, senjata[weapon]
            }
        }
    }' list_character.csv
    
    cd ..
    
    rm -r genshin.zip genshin_character/list_character.csv genshin_character.zip

 1. Langkah pertama yaitu mendownload **genshin.zip** menggunakan `wget`, kemudian unzip file zip tersebut dan juga unzip file zip yang ada di dalamnya, yaitu **genshin_character.zip**
 2. Langkah kedua yaitu kita `cd` ke folder *genshin_character*, kemudian kita *decode* nama file jpg yang ada di dalam folder tersebut, dengan menggunakan looping untuk menyusuri semua file jpg dan mengganti semua namanya dengan cara mengubah format heksadesimal ke dalam biner menggunakan `xxd -r -p`
 3. Langkah ketiga kita akan mengganti semua nama file jpg tersebut berdasarkan format yang diminta, semua data yang diperlukan berada di **list_character.csv**. Oleh karena itu kita pindahkan file **list_character.csv** ke dalam folder *genshin_character*, kemudian buat variable **region**,**element**, dan **senjata** untuk menyimpan data-data dari file csv menggunakan `awk`. Kemudian kita buat folder yang bernama region dari tiap-tiap karakter. Lalu kita ganti semua nama file jpg sesuai dengan format yang telah dibuat di variable **gantiNama**. Setelah itu, kita pindahkan semua foto ke dalam folder yang sesuai dengan region masing-masing character.
 4. Langkah keempat kita diminta untuk mengeluarkan output semua nama senjata beserta jumlahnya ke dalam terminal, kita akan memanfaatkan `awk` untuk mengambil nama senjata beserta jumlahnya di kolom keempat dari **list_character.csv**. Setelah itu kita melakukan looping untuk mengeluarkan output nama senjata beserta jumlahnya sesuai dengan format yang diinginkan.
 5. Terakhir, kita kembali ke folder awal lalu menghapus semua file dan folder yang diminta, yaitu **genshin.zip**, **genshin_character.zip**, dan **list_character.csv**.

Selanjutnya, kita akan **membuat search.sh**

    #!/bin/bash

    cd genshin_character
    
    log() {
        echo "[$(date +'%d/%m/%Y %H:%M:%S')] [$1] [$2]" >> ../../image.log
    }
    
    status=false
    valid_url='https?://\S+'
    genshinFolders=("Fontaine" "Inazuma" "Liyue" "Mondstat" "Sumeru")
    
    while true; do
        for folder in "${genshinFolders[@]}"; do
            cd "$folder" || continue
            for foto in *.jpg; do
                steghide extract -sf "$foto" -p "" > /dev/null 2>&1
                name=$(awk -F '-' '{gsub(/^[ \t]+|[ \t]+$/, "", $2); print $2}' <<< "$foto")
    
                if [ "$status" = true ]; then
                    break
                fi
    
                extract="${name}.txt"
    
                if [ -f "$extract" ]; then
                    # url=$(base64 ${extract})
                    # url=${base64 --decode "$extract"}
                    # url=$(echo "$extract" | base64 --decode --ignore-garbage)
                    url=$(base64 -d <<< echo "$extract")
    
       
                    if [ "$status" = true ]; then
                    break
                    fi
    
                    if [[ $url =~ $valid_url ]]; then
                        echo "[FOUND] $foto"
                        echo "URL: $url"
                        echo "$url" >> ../../dekripsi.txt
                        log "FOUND" "$foto"
                        wget "$url" -P ../../
                        rm -f "$extract"
                        status=true
                        break
                    else
                        echo "[NOT FOUND] $foto"
                        rm -f "$extract"
                        log "NOT FOUND" "$foto"
                    fi
                fi
                sleep 1
            done
            cd ..
            sleep 1
    
            if [ "$status" = true ]; then
                    break
            fi
        done
        if [ "$status" = true ]; then
            break
        fi
        done
1. Langkah pertama yaitu kita diminta untuk mengekstrak sebuah value yang ada di tiap folder dan didecode dengan base64. Pengecekan dilakukan setiap 1 detik. Untuk itu kita menggunakan `steghide` untuk mengekstrak value dari foto. Karena nama file txt value tersebut sama dengan nama tiap file foto karakter, kita perlu membuat variable `nama` untuk mengambil data dari nama file jpg agar kita bisa mengambil value dari foto tersebut. Setelah itu, kita perlu decode isi file txt tersebut menggunakan base64.
2. Jika url yang didapatkan benar, maka status akan diubah menjadi true dan semua looping akan berhenti. Jika url yang didapatkan salah, maka file txt tersebut akan langsung dihapus dan looping masih terus berjalan hingga url yang didapatkan benar. Semua proses dicatat dalam file **image.log** dan juga url yang benar disimpan di **dekripsi.txt**.
3. Langkah selanjutnya adalah memberi command `sleep 1` agar looping dapat berhenti setiap 1 detik. Tidak hanya looping pada tiap file, looping pada tiap folder juga akan dijeda selama 1 detik.
   <br>
   
**Hasil Output**

Sebelum dirun, pastikan perizinan untuk menjalankan file diubah dengan command `chmod +x awal.sh search.sh`
![image](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/130438307/88e79a14-7aa5-47a7-9748-8022218cd434)
![image](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/130438307/a8c4a547-0849-49aa-8cb3-223a8430fb3b)
![image](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/130438307/98c7418f-acaa-454a-b0f4-5e63d64ee24a)
![image](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/130438307/bad070aa-bcff-43fa-b18d-d855bab276d1)
**Isi file image.log**

![image](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/130438307/6f46269f-e95b-4cb0-8ed9-a38456e95460)
### Kendala
Ada problem di mana saat search.sh dijalankan, terdapat error bertuliskan `base64: invalid input`. Namun, error tersebut tidak mengganggu jalannya program sehingga program tetap bisa mendapatkan flagnya
### Revisi
Tidak ada revisi untuk jawaban nomor ini
## Soal 4
<details><summary>Klik untuk melihat soal</summary>
Stitch sangat senang dengan PC di rumahnya. Suatu hari, PC nya secara tiba-tiba nge-freeze 🤯 Tentu saja, Stitch adalah seorang streamer yang harus setiap hari harus bermain game dan streaming. Akhirnya, dia membawa PC nya ke tukang servis untuk diperbaiki. Setelah selesai diperbaiki, ternyata biaya perbaikan sangat mahal sehingga dia harus menggunakan uang hasil tabungan nya untuk membayarnya. Menurut tukang servis, masalahnya adalah pada CPU dan GPU yang overload karena gaming dan streaming sehingga mengakibatkan freeze pada PC nya. Agar masalah ini tidak terulang kembali, Stitch meminta kamu untuk membuat sebuah program monitoring resource yang tersedia pada komputer.

Buatlah program monitoring resource pada PC kalian. Cukup monitoring ram dan monitoring size suatu directory. Untuk ram gunakan command `free -m`. Untuk disk gunakan command `du -sh <target_path>`. Catat semua metrics yang didapatkan dari hasil `free -m`. Untuk hasil `du -sh <target_path>` catat size dari path directory tersebut. Untuk target_path yang akan dimonitor adalah /home/{user}/.

1.  Masukkan semua metrics ke dalam suatu file log bernama metrics_{YmdHms}.log. {YmdHms} adalah waktu disaat file script bash kalian dijalankan. Misal dijalankan pada 2024-03-20 15:00:00, maka file log yang akan tergenerate adalah metrics_20240320150000.log.
    
2.  Script untuk mencatat metrics diatas diharapkan dapat berjalan otomatis pada setiap menit.
    
3.  Kemudian, buat satu script untuk membuat agregasi file log ke satuan jam. Script agregasi akan memiliki info dari file-file yang tergenerate tiap menit. Dalam hasil file agregasi tersebut, terdapat nilai minimum, maximum, dan rata-rata dari tiap-tiap metrics. File agregasi akan ditrigger untuk dijalankan setiap jam secara otomatis. Berikut contoh nama file hasil agregasi metrics_agg_2024032015.log dengan format metrics_agg_{YmdH}.log
    
4.  Karena file log bersifat sensitif pastikan semua file log hanya dapat dibaca oleh user pemilik file.

Note:
-   Nama file untuk script per menit adalah minute_log.sh
-   Nama file untuk script agregasi per jam adalah aggregate_minutes_to_hourly_log.sh
-   Semua file log terletak di /home/{user}/log
-   Semua konfigurasi cron dapat ditaruh di file skrip .sh nya masing-masing dalam bentuk comment

**Berikut adalah contoh isi dari file metrics yang dijalankan tiap menit:**
mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size 15949,10067,308,588,5573,4974,2047,43,2004,/home/user/coba/,74M

**Berikut adalah contoh isi dari file agregasi yang dijalankan tiap jam:**
type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size minimum,15949,10067,223,588,5339,4626,2047,43,1995,/home/user/coba/,50M maximum,15949,10387,308,622,5573,4974,2047,52,2004,/home/user/coba/,74M average,15949,10227,265.5,605,5456,4800,2047,47.5,1999.5,/home/user/coba/,62M
</details>

### Penjelasan
Pertama, kita buat script bernama **minute_log.sh**, nantinya script ini akan dijalankan setiap satu menit menggunakan `crontab`.

    #!/bin/bash
    
    #CRONJOB
    #* * * * * minute_log.sh
    
    # Mengatur waktu untuk nama file log
    log_time=$(date +"%Y%m%d%H%M%S")
    log_file="/home/irfanqs/log/metrics_$log_time.log"
    
    # Mengambil metrics RAM dan metrics swap
    ram_metrics=$(free -m | awk 'NR==2 {print $2","$3","$4","$5","$6","$7}')
    swap_metrics=$(free -m | awk 'NR==3{print $2","$3","$4}')
    
    # Mengambil metrics size direktori target
    target_path="/home/irfanqs/"
    dir_size=$(du -sh "$target_path" | awk '{print $1}')
    
    # Menulis metrics ke dalam file log
    echo "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > "$log_file"
    echo "$ram_metrics,$swap_metrics,$target_path,$dir_size" >> "$log_file"
    
    # Mengubah izin folder log
    chmod 600 $log_file

1. Langkah pertama yang perlu dilakukan yaitu kita membuat variable `log_time` untuk menyimpan data dari waktu sesuai dengan format. Selain itu, kita perlu membuat variable `log_file` untuk menyimpan path tempat file **metrics_$log_time.log** disimpan.
2. Selanjutnya kita akan mengambil metrics RAM dan metrics swap menggunakan `free -m` dan dengan bantuan `awk` kita dapat mengambil data yang dibutuhkan. Setelah itu, hasilnya akan disimpan di variable `ram_metrics` dan `swap_metrics`.
3. Setelah itu kita juga mengambil size directory dari path yang telah tercantum di `target_path`. Dengan menggunakan `du -sh`, kita dapat menampilkan size directory tersebut dan menyimpannya di variable `dir_size`.
4. Setelah semua data yang dibutuhkan dicatat di tiap variable, kita akan menyimpannya ke dalam file log yang telah diatur oleh variable `log_file`. Kita akan menjalankan `echo "$ram_metrics,$swap_metrics,$target_path,$dir_size"` dan memasukkannya ke `log_file` dengan menggunakan perintah `>>`. 
5. Langkah yang terakhir adalah kita perlu mengubah perizinan agar file tiap log yang dibuat dapat dibuka oleh user yang membuatnya saja, untuk itu kita perlu command `chmod 600 $log_file`

Kedua, kita buat file bernama **aggregate_minutes_to_hourly_log.sh**. Nantinya program ini akan berjalan setiap satu jam menggunakan `crontab`.

    #!/bin/bash
    
    # CRONJOB
    # 0 * * * * aggregate_minutes_to_hourly_log.sh
    log_time=$(date +"%Y%m%d%H")
    
    #deklarasi nilai awal
    path=~/
    mkdir ../log/combined_log
    
    touch ../log/combined_log/combined_metrics.log
    
    for file in ../log/*.log;
    do
        awk 'NR==2' "$file" >> "../log/combined_log/combined_metrics.log"
        # cat "$file" >> "../log/combined_log/combined_metrics.log"
    done
    echo "type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > "../log/metrics_agg_${log_time}.log"
    # Calculate max
    max_mem_tot=$(awk -F',' '{ if ($1 > max_mem_tot || NR == 1) max_mem_tot = $1 } END { print max_mem_tot }' "../log/combined_log/combined_metrics.log")
    max_memus=$(awk -F',' '{ if ($2 > max_memus || NR == 1) max_memus = $2 } END { print max_memus }' "../log/combined_log/combined_metrics.log")
    max_memfr=$(awk -F',' '{ if ($3 > max_memfr || NR == 1) max_memfr = $3 } END { print max_memfr }' "../log/combined_log/combined_metrics.log")
    max_memsh=$(awk -F',' '{ if ($4 > max_memsh || NR == 1) max_memsh = $4 } END { print max_memsh }' "../log/combined_log/combined_metrics.log")
    max_membf=$(awk -F',' '{ if ($5 > max_membf || NR == 1) max_membf = $5 } END { print max_membf }' "../log/combined_log/combined_metrics.log")
    max_memav=$(awk -F',' '{ if ($6 > max_memav || NR == 1) max_memav = $6 } END { print max_memav }' "../log/combined_log/combined_metrics.log")
    max_swaptot=$(awk -F',' '{ if ($7 > max_swaptot || NR == 1) max_swaptot = $7 } END { print max_swaptot }' "../log/combined_log/combined_metrics.log")
    max_swapus=$(awk -F',' '{ if ($8 > max_swapus || NR == 1) max_swapus = $8 } END { print max_swapus }' "../log/combined_log/combined_metrics.log")
    max_swapfr=$(awk -F',' '{ if ($9 > max_swapfr || NR == 1) max_swapfr = $9 } END { print max_swapfr }' "../log/combined_log/combined_metrics.log")
    
    #get all pathsz and separate alphabet-numeric
    pathsz=$(awk -F',' '{print $NF}' "../log/combined_log/combined_metrics.log")
    max_pathsz=$(echo "$pathsz" | sed 's/\([0-9]\+\)\([A-Za-z]\+\)/\1 \2/' | sort -nr | head -n 1 | awk '{print $1}')
    
    # Calculate min
    min_mem_tot=$(awk -F',' '{ if ($1 < min_mem_tot || NR == 1) min_mem_tot = $1 } END { print min_mem_tot }' "../log/combined_log/combined_metrics.log")
    min_memus=$(awk -F',' '{ if ($2 < min_memus || NR == 1) min_memus = $2 } END { print min_memus }' "../log/combined_log/combined_metrics.log")
    min_memfr=$(awk -F',' '{ if ($3 < min_memfr || NR == 1) min_memfr = $3 } END { print min_memfr }' "../log/combined_log/combined_metrics.log")
    min_memsh=$(awk -F',' '{ if ($4 < min_memsh || NR == 1) min_memsh = $4 } END { print min_memsh }' "../log/combined_log/combined_metrics.log")
    min_membf=$(awk -F',' '{ if ($5 < min_membf || NR == 1) min_membf = $5 } END { print min_membf }' "../log/combined_log/combined_metrics.log")
    min_memav=$(awk -F',' '{ if ($6 < min_memav || NR == 1) min_memav = $6 } END { print min_memav }' "../log/combined_log/combined_metrics.log")
    min_swaptot=$(awk -F',' '{ if ($7 < min_swaptot || NR == 1) min_swaptot = $7 } END { print min_swaptot }' "../log/combined_log/combined_metrics.log")
    min_swapus=$(awk -F',' '{ if ($8 < min_swapus || NR == 1) min_swapus = $8 } END { print min_swapus }' "../log/combined_log/combined_metrics.log")
    min_swapfr=$(awk -F',' '{ if ($9 < min_swapfr || NR == 1) min_swapfr = $9 } END { print min_swapfr }' "../log/combined_log/combined_metrics.log")
    min_pathsz=$(echo "$pathsz" | sed 's/\([0-9]\+\)\([A-Za-z]\+\)/\1 \2/' | sort -n | head -n 1 | awk '{print $1}')
    
    #AVG
    avg_mem_tot=$(((max_mem_tot + min_mem_tot) / 2))
    avg_memus=$(((max_memus + min_memus) / 2))
    avg_memfr=$(((max_memfr + min_memfr) / 2))
    avg_memsh=$(((max_memsh + min_memsh) / 2))
    avg_membf=$(((max_membf + min_membf) / 2))
    avg_memav=$(((max_memav + min_memav) / 2))
    avg_swaptot=$(((max_swaptot + min_swaptot) / 2))
    avg_swapus=$(((max_swapus + min_swapus) / 2))
    avg_swapfr=$(((max_swapfr + min_swapfr) / 2))
    avg_pathsz=$(((max_pathsz + min_pathsz) / 2))
    
    #hasil
    echo "type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > "../log/metrics_agg_${log_time}.log"
    echo "minimum,$min_mem_tot,$min_memus,$min_memfr,$min_memsh,$min_membf,$min_memav,$min_swaptot,$min_swapus,$min_swapfr,$path,$min_pathsz""M" >> "../log/metrics_agg_${log_time}.log"
    echo "maximum,$max_mem_tot,$max_memus,$max_memfr,$max_memsh,$max_membf,$max_memav,$max_swaptot,$max_swapus,$max_swapfr,$path,$max_pathsz""M" >> "../log/metrics_agg_${log_time}.log"
    echo "average,$avg_mem_tot,$avg_memus,$avg_memfr,$avg_memsh,$avg_membf,$avg_memav,$avg_swaptot,$avg_swapus,$avg_swapfr,$path,$avg_pathsz""M" >> "../log/metrics_agg_${log_time}.log"
    
    rm -r "../log/combined_log/"
    
    chmod 600 "../log/metrics_agg_${log_time}.log"

1. Langkah pertama yang perlu dilakukan adalah membuat variable `log_time` untuk menyimpan data waktu sesuai format yang dibutuhkan. Kemudia kita akan membuat folder bernama **combined_log** di folder log. Serta dengan membuat file baru bernama **combined_metrics.log** di dalam direktori tersebut.
2. Setelah itu kita akan melakukan looping untuk tiap file .log yang ada di folder, dengan memanfaatkan `awk` untuk mengambil nilai pada baris kedua setiap file log. Nantinya, kita akan memanfaatkan file **combined_metrics.log** untuk menghitung nilai maksimal, minimal, dan rata-rata tiap kolomnya, karena data tiap file log sudah tercatat ke dalam file tersebut.
3. Kemudian kita akan menghitung nilai max, min, dan avg tiap kolomnya. Dengan menggunakan `awk`, kita dapat membuat sebuah rumus agar kita dapat mencari nilai max dan min. Untuk rumusnya kurang lebih sama konsepnya, sebagai contoh kita akan menggunakan variable `max_mem_tot`. Jika nilai `max_mem_tot` lebih kecil dari kolom 1 atau posisinya berada di baris 1, maka `max_mem_tot` bernilai kolom 1. Perhitungan ini akan terus berjalan hingga baris terakhir. Setelah itu, masuk ke bagian END, nilai `max_mem_tot` akan dicetak. Untuk menjadikan rumus ini sebagai perhitungan nilai min, kita hanya perlu mengubah if statementnya menjadi lebih besar dari nilai kolom tersebut.
4. Selain menghitung nilai max dan min, kita juga perlu mengetahui path dan ukurannya. Dengan variable `pathsz`, kita memanfaatkan `awk` untuk print jumlah dari kolom tersebut. Dan dengan variable `max_pathsz`, kita dapat mencari nilai max dari ukuran path tersebut,
5. Setelah itu, kita perlu menghitung juga nilai average dari semua perhitungan di atas. Caranya cukup simpel, kita hanya perlu menambahkan nilai max dan min lalu dibagi 2. Semuanya akan disimpan di variablenya masing-masing.
6. Setelah semuanya selesai, kita dapat menampilkan semua nilainya dengan command `echo` agar nilainya dapat muncul di file yang bernama **metrics_agg_${log_time}.log** yang terletak di  folder `../log`. Tidak lupa kita menghapus folder log/combined_log karena sudah tidak dibutuhkan lagi.
7. Tidak lupa kita mengubah perizinan file log yang nanti dioutputkan oleh program ini agar dapat diakses oleh user yang membuat saja.

**Hasil Output** <br>
Output file **minute_log.sh**
![image](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/130438307/8c3431bc-14c1-4c05-9c3e-c4aeff307f25)

Output file **aggregate_minutes_to_hourly_log.sh**
![image](https://github.com/irfanqs/Sisop-1-2024-MH-IT27/assets/130438307/f521f73e-2e3d-417c-80de-85ddfb198145)


### Kendala
Command cronjob tidak berjalan, padahal crontab telah disetting sesuai command tiap file tersebut
### Revisi
Ada revisi pada command cronjob kedua file tersebut, seharusnya command cronjob ditulis full dengan pathnya sehingga menjadi seperti berikut `* * * * * /home/irfanqs/soal_4/minute_log.sh` untuk file **minute_log.sh** dan `0 * * * * /home/irfanqs/soal_4/aggregate_minutes_to_hourly_log.sh` untuk file **aggregate_minutes_to_hourly_log.sh**. Selain itu, ada sebuah persyaratan yang perlu ditambahi pada looping file .log pada file **aggregate_minutes_to_hourly_log.sh**. Pada looping tersebut seharusnya diberi syarat jika file .log tersebut bernama **minutes_agg_(waktu dibuat).log**, maka file tersebut akan diskip dan lanjut ke file selanjutnya. Hal ini perlu dilakukan agar output dari file **aggregate_minutes_to_hourly_log.sh** tidak salah karena file **minutes_agg_(waktu dibuat).log** tidak akan terinput ke dalam output file tersebut
