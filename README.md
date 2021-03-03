# linux-script

Bash script with the following behavior:
- It receives one and only one argument, otherwise it returns an error
- If the argument is not a directory it returns an error
- If the argument is a directory create a tar.gz archive with the directory name given in input
- If the archive creation command is not successful, it returns an error
- If the creation command was successful, it prints the contents of the compressed archive on the std output
- If the archive already exists, it asks the user if he wants to overwrite it: if not, it exits, if so, I delete the old archive and recreate it

