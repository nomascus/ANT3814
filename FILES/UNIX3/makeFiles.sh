mkdir ./UNIX3
mkdir ./UNIX3/FILES
cd UNIX3/FILES
for i in $(seq 1 50); do touch file${i}.txt; done
