#! /bin/bash

echo "Script started"
echo "Go to directory /d/QA_Manual"
cd /d/QA_Manual
pwd
echo "Create directories d_2 d_3 d_4"
mkdir d_2 d_3 d_4
ls -al
echo "Go to directory d_2"
cd d_2
echo "Create files (3 txt, 2 json)"
touch file1.txt file2.txt file3.txt file4.json file5.json
ls -al
echo "Create directories d_1 d_2 d_3"
mkdir d_2 d_3 d_4
echo "Directory d_2 conteines:"
ls -al
echo "Move 2 files from d_2 to d_3"
mv /d/QA_Manual/d_2/file1.txt /d/QA_Manual/d_2/file2.txt /d/QA_Manual/d_3
ls -al
cd /d/QA_Manual/d_3
ls -al
echo "Done"
