

load ('testesss.mat','vet');

a = length(vet);
a
vet = [vet,5];
save('testesss.mat','vet','a','-append');

