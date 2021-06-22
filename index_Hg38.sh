
#$ -cwd
#$ -N indexHg38
#$ -R y

#$ -l h_vmem=30g
#$ -pe smp 4
#$ -binding linear:4

#$ -l h_rt=48:00:00
#$ -l s_rt=48:00:00

echo "START" > /home/unix/kushagra/map_mitochondrial_genome/index_Hg38.log;
source /broad/software/scripts/useuse;
use Anaconda3;
eval "$(conda shell.bash hook)";
source activate /broad/hptmp/kushagra/map_mitochondrial_genome/;
cd /home/unix/kushagra/map_mitochondrial_genome;
bowtie2-build hg38.fa nuclear -p 4 && echo "DONE" >> /home/unix/kushagra/map_mitochondrial_genome/index_Hg38.log;
