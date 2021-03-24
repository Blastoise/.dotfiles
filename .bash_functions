# Funtion for compiling my C++ file
function compile() {
    # file name wihout extension
    file_name=$(echo $1 | cut -d "." -f 1)
    g++ -std=c++14 -O2 -Wall ${1} -o ${file_name}
}