ROOT_DIR=$(pwd)
BUILD_DIR="$ROOT_DIR/bin"


run_nasm_linux_sample() {
  # lê e remove a extensão do primeiro argumento da função
  FILE_NAME="${1%.*}"

  nasm -f elf $FILE_NAME.asm -o "$BUILD_DIR/$FILE_NAME.o"
  ld -m elf_i386 "$BUILD_DIR/$FILE_NAME.o" -o "$BUILD_DIR/$FILE_NAME"
  "$BUILD_DIR/$FILE_NAME" ${@:2}
}

# Referências
# https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
# https://stackoverflow.com/questions/6212219/passing-parameters-to-a-bash-function
# https://unix.stackexchange.com/questions/82060/bash-slice-of-positional-parameters

echo "-----------------------------------"
echo "| Now you are playing with power! |"
echo "-----------------------------------"
